package com.care.root.board;

import java.io.File;
import java.io.FileInputStream;
import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.care.root.board.dto.GenBoardDTO;
import com.care.root.board.dto.ReplyDTO;
import com.care.root.board.service.GenBoardService;
import com.care.root.board.service.GenFileService;
import com.care.root.board.service.ReplyService;
import com.care.root.common.LoginSession;

@Controller
@RequestMapping("/board")
public class BoardController {
	
	@Autowired GenBoardService gbs;
	@Autowired GenFileService gfs;
	@Autowired ReplyService rs;
	
	@GetMapping("genBoardList")
	public String boardAllList(Model model, @RequestParam(value="type", required=false) String type, @RequestParam(value="keyword", required=false) String keyword, @RequestParam(required = false, defaultValue = "1") int num) throws Exception {
		if(type != null  && keyword !=null) {
			Map<String, Object> map = gbs.selectSearch(model, type, keyword, num);
			model.addAttribute("list", map.get("list"));
			model.addAttribute("repeat", map.get("repeat"));
			
		}else {
			Map<String, Object> map = gbs.boardAllList(num);
			model.addAttribute("list", map.get("list"));
			model.addAttribute("repeat", map.get("repeat"));
		}
		return "board/genBoardList";
	}
	
	@GetMapping("genWrite")
	public String genWrite(HttpSession session, Model model) {
		System.out.println("asd : " + session.getAttribute(LoginSession.GLOGIN));
		model.addAttribute("genId", session.getAttribute(LoginSession.GLOGIN));
		return "board/genWrite";
	}
	
	@PostMapping("genWriteSave")
	public String genWriteSave(MultipartHttpServletRequest mt, 
								GenBoardDTO dto) {
		dto.setCategory(mt.getParameter("category"));
		dto.setTitle(mt.getParameter("title"));
		dto.setId(mt.getParameter("id"));
		dto.setContent(mt.getParameter("content"));
		
        MultipartFile[] files = {mt.getFile("imgN1"),mt.getFile("imgN2"),mt.getFile("imgN3"),mt.getFile("imgN4"),mt.getFile("imgN5")};
        
        String[] nan = {mt.getParameter("image1"), mt.getParameter("image2"),
				mt.getParameter("image3"), mt.getParameter("image4"), mt.getParameter("image5")};
        
        gfs.saveImage(dto, files, nan);
        
		return "redirect:genBoardList";
	}
	
	@GetMapping("genBoardView")
	public String genBoardView(@RequestParam int writeNo,
							   Model model,
							   HttpSession session) {
		String id1 = null;
		String id2 = null;
		System.out.println("chk : " + session.getAttribute(LoginSession.GLOGIN));
		
		if((session.getAttribute(LoginSession.GLOGIN) == null) && (session.getAttribute(LoginSession.CLOGIN) != null)) {
			id1 = "undefined";
			id2 = (String) session.getAttribute(LoginSession.CLOGIN);
		}else if((session.getAttribute(LoginSession.GLOGIN) != null) && (session.getAttribute(LoginSession.CLOGIN) == null)){
			id1 = (String) session.getAttribute(LoginSession.GLOGIN);
			id2 = "undefined";
		} else {
			id1 = "undefined";
			id2 = "undefined";
		}
		
		model.addAttribute("dto", gbs.genView(writeNo));
		model.addAttribute("genId", id1);
		model.addAttribute("comId", id2);
		model.addAttribute("likes", gbs.genLikeChk(id1, writeNo));
		model.addAttribute("reply", rs.viewRep(writeNo));
		return "board/genBoardView";
	}
	
	@PostMapping("likes")
	public String likes(@RequestParam String id,
						@RequestParam int writeNo) {
		System.out.println(id + writeNo);
		gbs.genLike(id, writeNo);
		return "redirect:genBoardView?writeNo="+ writeNo;
	}
	
	@GetMapping("imgView")
	public void imgView(@RequestParam String name,
						HttpServletResponse response) throws Exception {
		String encodedName = URLEncoder.encode(name, "UTF-8");
		response.addHeader("Content-disposition", "attachment; fileName="+encodedName);
		File file = new File(GenBoardService.IMAGE_REPO + "/" + name);
		FileInputStream in = new FileInputStream(file);
		FileCopyUtils.copy(in, response.getOutputStream());
		in.close();
	}
	
	@PostMapping("reply")
	public String reply(@RequestParam(required = false) String gId,
						@RequestParam(required = false) String cId,
						@RequestParam String content,
						@RequestParam int writeNo,
						ReplyDTO dto,
						Model model) {
		
		System.out.println("gggid : " + gId);
		System.out.println("cccid : " + cId);
		
		dto.setWriteNo(writeNo);
		if(gId == null && cId != null) {
			dto.setnId("nan");
			dto.setcId(cId);
		}else if(gId != null && cId == null){
			dto.setnId(gId);
			dto.setcId("nan");
		} else {
			dto.setnId("nan");
			dto.setcId("nan");
		}
		dto.setContent(content);
		
		if(dto.getcId().equals("nan") && dto.getnId().equals("nan")) {
			return "redirect:genBoardView?writeNo="+ writeNo;
		}else {
			rs.addReply(dto);
			return "redirect:genBoardView?writeNo="+ writeNo;
		}
	}
	
	@PostMapping("replyModify")
	public String repMod(@RequestParam int writeNo,
			 			 @RequestParam int replyNo,
			 			 @RequestParam String modify) {
		System.out.println("writeNo : " + writeNo);
		System.out.println("replyNo : " + replyNo );
		System.out.println("modify : " + modify);
		ReplyDTO dto = new ReplyDTO();
		dto.setContent(modify);
		dto.setReplyNo(replyNo);
		dto.setWriteNo(writeNo);
		rs.replyModify(dto);
		
		return "redirect:genBoardView?writeNo="+ writeNo;
	}
	
	@GetMapping("replyDelete")
	public String repDel(@RequestParam int writeNo,
						 @RequestParam int replyNo) {
		rs.replyDelete(replyNo);
		return "redirect:genBoardView?writeNo="+ writeNo;
	}
	
	@GetMapping("genModify")
	public String genModify(@RequestParam int writeNo,
							Model model) {
		model.addAttribute("dto", gbs.genView(writeNo));
		return "board/genModify";
	}
	
	@PostMapping("genModifySave") 
	public String genModifySave(@RequestParam int writeNo, 
								MultipartHttpServletRequest mt){

		GenBoardDTO dto = gbs.genView(writeNo);
		dto.setCategory(mt.getParameter("category"));
		dto.setTitle(mt.getParameter("title"));
		dto.setId(mt.getParameter("id"));
		dto.setContent(mt.getParameter("content"));
		
		String[] nan = {mt.getParameter("image1"), mt.getParameter("image2"),
				mt.getParameter("image3"), mt.getParameter("image4"), mt.getParameter("image5")};
		
		MultipartFile[] fileNames = {
				mt.getFile("imageName1"),
				mt.getFile("imageName2"),
				mt.getFile("imageName3"),
				mt.getFile("imageName4"),
				mt.getFile("imageName5")
		};
		gfs.modify(dto, nan, fileNames);
		
		return "redirect:genBoardView?writeNo="+writeNo;
	}
	
	@GetMapping("genDelete")
	public String genDelete(@RequestParam int writeNo, GenBoardDTO dto) {
		dto = gbs.genView(writeNo);
		gfs.genDelete(dto);
		gbs.genDelete(writeNo);
		return "redirect:genBoardList";
	}
	@GetMapping("genBoardMypage")
	public String genBoardMypage(Model model, @RequestParam(value="type", required=false) String type, @RequestParam(value="keyword", required=false) String keyword, @RequestParam(required = false, defaultValue = "1") int num) throws Exception {
		System.out.println(type);
		System.out.println(keyword);
		Map<String, Object> map = gbs.selectSearch(model, type, keyword, num);
		model.addAttribute("list", map.get("list"));
		model.addAttribute("repeat", map.get("repeat"));
		return "board/genBoardMypage";
	}
}
