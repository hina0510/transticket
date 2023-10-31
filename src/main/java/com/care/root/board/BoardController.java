package com.care.root.board;

import java.io.File;
import java.io.FileInputStream;
import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

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
import com.care.root.board.service.GenBoardService;
import com.care.root.board.service.GenFileService;

@Controller
@RequestMapping("/board")
public class BoardController {
	
	@Autowired GenBoardService gbs;
	@Autowired GenFileService gfs;
	
	
	@GetMapping("genBoardList")
	public String boardAllList(Model model,
							   @RequestParam(required = false, defaultValue = "1") int num) {
		Map<String, Object> map = gbs.boardAllList(num);
		model.addAttribute("list", map.get("list"));
		model.addAttribute("repeat", map.get("repeat"));
		return "board/genBoardList";
	}
	
	@GetMapping("genWrite")
	public String genWrite() {
		return "board/genWrite";
	}
	
	@PostMapping("genWriteSave")
	public String genWriteSave(MultipartHttpServletRequest mt, 
								GenBoardDTO dto,
							   @RequestParam("imageFiles") MultipartFile[] files) {
		dto.setCategory(mt.getParameter("category"));
		dto.setTitle(mt.getParameter("title"));
		dto.setId(mt.getParameter("id"));
		dto.setContent(mt.getParameter("content"));
        gfs.saveImage(dto, files);
        
		return "redirect:genBoardList";
	}
	
	@GetMapping("genBoardView")
	public String genBoardView(@RequestParam int writeNo,
							   Model model) {
		model.addAttribute("dto", gbs.genView(writeNo));
		return "board/genBoardView";
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
	
	@GetMapping("genModify")
	public String genModify(@RequestParam int writeNo,
							Model model) {
		model.addAttribute("dto", gbs.genView(writeNo));
		return "board/genModify";
	}
	
	@PostMapping("genModifySave") 
	public String genModifySave(@RequestParam int writeNo, 
								MultipartHttpServletRequest mt){
		System.out.println("게시글 번호 : " + writeNo);

		GenBoardDTO dto = gbs.genView(writeNo);
		dto.setCategory(mt.getParameter("category"));
		dto.setTitle(mt.getParameter("title"));
		dto.setId(mt.getParameter("id"));
		dto.setContent(mt.getParameter("content"));
		
		// 여기부터 삭제를 눌러서 nan을 저장한 것
		String[] nan = {mt.getParameter("image1"), mt.getParameter("image2"),
				mt.getParameter("image3"), mt.getParameter("image4"), mt.getParameter("image5")};
		
		// 여기는 새로운 이미지파일을 넣은 것
		MultipartFile[] fileNames = {
				mt.getFile("imageName1"),
				mt.getFile("imageName2"),
				mt.getFile("imageName3"),
				mt.getFile("imageName4"),
				mt.getFile("imageName5")
		};
		
		//이제 1번, 2번, 3번을 한번에 서비스로 옮기고 if문을 사용하여 dto.set~를 해준다.
		
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
	

}
