package com.care.root.board.service;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.care.root.board.dto.GenBoardDTO;
import com.care.root.mybatis.board.GenBoardMapper;

@Service
public class GenFileServiceImpl implements GenFileService {
	@Autowired GenBoardMapper mapper;
	
	
	public void saveImage(GenBoardDTO dto, MultipartFile[] file) {
		if(file[0].isEmpty()) {
			dto.setImageName1("nan");
			dto.setImageName2("nan");
			dto.setImageName3("nan");
			dto.setImageName4("nan");
			dto.setImageName5("nan");
		}else {
			try {
		        String[] savePath = new String[5];
		        String[] nowImgName = new String[5];
		        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd-HHmmss");
		        String saveNow = dateFormat.format(new Date());
		        
		        for(int i = 0; i < 5; i++) {
		        	if(file.length > i) {
		        		nowImgName[i] = saveNow + "-" + file[i].getOriginalFilename();
		        		savePath[i] = IMAGE_REPO + "/" + nowImgName[i];
		        		file[i].transferTo(new File(savePath[i]));
		        	}else {
		        		nowImgName[i] = "nan";
		        	}
		        		
		        	System.out.println("sdwaa ::" + nowImgName[i]);
		        }
		        dto.setImageName1(nowImgName[0]);
		        dto.setImageName2(nowImgName[1]);
		        dto.setImageName3(nowImgName[2]);
		        dto.setImageName4(nowImgName[3]);
		        dto.setImageName5(nowImgName[4]);
		        
		    } catch (Exception e) {
		        e.printStackTrace();
		    }
		}
			 System.out.println(dto.getCategory());
			 System.out.println(dto.getTitle());
			 System.out.println(dto.getId());
			 System.out.println(dto.getContent());
			 System.out.println(dto.getImageName1());
			 System.out.println(dto.getImageName2());
			 System.out.println(dto.getImageName3());
			 System.out.println(dto.getImageName4());
			 System.out.println(dto.getImageName5());
			 
			 mapper.saveWrite(dto);
	   }
	
	public void deleteImage(GenBoardDTO dto) {
		File file1 = new File(IMAGE_REPO + "/" + dto.getImageName1());
		file1.delete();
		
		File file2 = new File(IMAGE_REPO + "/" + dto.getImageName2());
		file2.delete();
		
		File file3 = new File(IMAGE_REPO + "/" + dto.getImageName3());
		file3.delete();
		
		File file4 = new File(IMAGE_REPO + "/" + dto.getImageName4());
		file4.delete();
		
		File file5 = new File(IMAGE_REPO + "/" + dto.getImageName5());
		file5.delete();
	}
	
	public void modify(GenBoardDTO dto, String[] nan,  MultipartFile[] fileNames) {
		
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd-HHmmss");
	    String saveNow = dateFormat.format(new Date());
		
	    if(nan[0].equals("nan")) { // �씠誘몄�媛� nan.png濡� �꽕�젙�릺�뿀�쓣 寃쎌슦
	    	if(!dto.getImageName1().equals(nan[0])) { //泥섏쓬 dto�뿉 ���옣�맂 媛믪씠 nan.png�씠 �븘�땺 寃쎌슦 湲곗〈 �씠誘몄� �궘�젣�븯怨� nan�쑝濡� 諛붽씔�떎.
	    		File file = new File(IMAGE_REPO + "/" + dto.getImageName1());
				file.delete();
				
				dto.setImageName1("nan");
	    	}
	    }else { // �씠誘몄�媛� nan.png媛� �븘�땺 寃쎌슦
	    	if(!fileNames[0].isEmpty()) { // 諛곗뿴�씠 鍮꾩뼱�엳吏� �븡�떎硫� �씠誘몄�媛� 蹂�寃쎈맂 寃껋씠�떎.
	    		File file = new File(IMAGE_REPO + "/" + dto.getImageName1());
				file.delete();
				try {
					String nowImgName = saveNow + "-" + fileNames[0].getOriginalFilename();
	        		String savePath = IMAGE_REPO + "/" + nowImgName;
	        		fileNames[0].transferTo(new File(savePath));
	        		dto.setImageName1(nowImgName);
				} catch (Exception e) {
					e.printStackTrace();
				}
	    	}
	    }
	    
	    if(nan[1].equals("nan")) { // �씠誘몄�媛� nan.png濡� �꽕�젙�릺�뿀�쓣 寃쎌슦
	    	if(!dto.getImageName2().equals(nan[1])) { //泥섏쓬 dto�뿉 ���옣�맂 媛믪씠 nan.png�씠 �븘�땺 寃쎌슦 湲곗〈 �씠誘몄� �궘�젣�븯怨� nan�쑝濡� 諛붽씔�떎.
	    		File file = new File(IMAGE_REPO + "/" + dto.getImageName2());
	    		file.delete();
	    		
	    		dto.setImageName2("nan");
	    	}
	    }else { // �씠誘몄�媛� nan.png媛� �븘�땺 寃쎌슦
	    	if(!fileNames[1].isEmpty()) { // 諛곗뿴�씠 鍮꾩뼱�엳吏� �븡�떎硫� �씠誘몄�媛� 蹂�寃쎈맂 寃껋씠�떎.
	    		File file = new File(IMAGE_REPO + "/" + dto.getImageName2());
	    		file.delete();
	    		try {
	    			String nowImgName = saveNow + "-" + fileNames[1].getOriginalFilename();
	    			String savePath = IMAGE_REPO + "/" + nowImgName;
	    			fileNames[1].transferTo(new File(savePath));
	    			dto.setImageName2(nowImgName);
	    		} catch (Exception e) {
	    			e.printStackTrace();
	    		}
	    	}
	    }
	    
	    if(nan[2].equals("nan")) { // �씠誘몄�媛� nan.png濡� �꽕�젙�릺�뿀�쓣 寃쎌슦
	    	if(!dto.getImageName3().equals(nan[2])) { //泥섏쓬 dto�뿉 ���옣�맂 媛믪씠 nan.png�씠 �븘�땺 寃쎌슦 湲곗〈 �씠誘몄� �궘�젣�븯怨� nan�쑝濡� 諛붽씔�떎.
	    		File file = new File(IMAGE_REPO + "/" + dto.getImageName3());
	    		file.delete();
	    		
	    		dto.setImageName3("nan");
	    	}
	    }else { // �씠誘몄�媛� nan.png媛� �븘�땺 寃쎌슦
	    	if(!fileNames[2].isEmpty()) { // 諛곗뿴�씠 鍮꾩뼱�엳吏� �븡�떎硫� �씠誘몄�媛� 蹂�寃쎈맂 寃껋씠�떎.
	    		File file = new File(IMAGE_REPO + "/" + dto.getImageName3());
	    		file.delete();
	    		try {
	    			String nowImgName = saveNow + "-" + fileNames[2].getOriginalFilename();
	    			String savePath = IMAGE_REPO + "/" + nowImgName;
	    			fileNames[2].transferTo(new File(savePath));
	    			dto.setImageName3(nowImgName);
	    		} catch (Exception e) {
	    			e.printStackTrace();
	    		}
	    	}
	    }
	    
	    if(nan[3].equals("nan")) { // �씠誘몄�媛� nan.png濡� �꽕�젙�릺�뿀�쓣 寃쎌슦
	    	if(!dto.getImageName4().equals(nan[3])) { //泥섏쓬 dto�뿉 ���옣�맂 媛믪씠 nan.png�씠 �븘�땺 寃쎌슦 湲곗〈 �씠誘몄� �궘�젣�븯怨� nan�쑝濡� 諛붽씔�떎.
	    		File file = new File(IMAGE_REPO + "/" + dto.getImageName4());
	    		file.delete();
	    		
	    		dto.setImageName4("nan");
	    	}
	    }else { // �씠誘몄�媛� nan.png媛� �븘�땺 寃쎌슦
	    	if(!fileNames[3].isEmpty()) { // 諛곗뿴�씠 鍮꾩뼱�엳吏� �븡�떎硫� �씠誘몄�媛� 蹂�寃쎈맂 寃껋씠�떎.
	    		File file = new File(IMAGE_REPO + "/" + dto.getImageName4());
	    		file.delete();
	    		try {
	    			String nowImgName = saveNow + "-" + fileNames[3].getOriginalFilename();
	    			String savePath = IMAGE_REPO + "/" + nowImgName;
	    			fileNames[3].transferTo(new File(savePath));
	    			dto.setImageName4(nowImgName);
	    		} catch (Exception e) {
	    			e.printStackTrace();
	    		}
	    	}
	    }
	    
	    if(nan[4].equals("nan")) { // �씠誘몄�媛� nan.png濡� �꽕�젙�릺�뿀�쓣 寃쎌슦
	    	if(!dto.getImageName5().equals(nan[4])) { //泥섏쓬 dto�뿉 ���옣�맂 媛믪씠 nan.png�씠 �븘�땺 寃쎌슦 湲곗〈 �씠誘몄� �궘�젣�븯怨� nan�쑝濡� 諛붽씔�떎.
	    		File file = new File(IMAGE_REPO + "/" + dto.getImageName5());
	    		file.delete();
	    		
	    		dto.setImageName5("nan");
	    	}
	    }else { // �씠誘몄�媛� nan.png媛� �븘�땺 寃쎌슦
	    	if(!fileNames[4].isEmpty()) { // 諛곗뿴�씠 鍮꾩뼱�엳吏� �븡�떎硫� �씠誘몄�媛� 蹂�寃쎈맂 寃껋씠�떎.
	    		File file = new File(IMAGE_REPO + "/" + dto.getImageName5());
	    		file.delete();
	    		try {
	    			String nowImgName = saveNow + "-" + fileNames[4].getOriginalFilename();
	    			String savePath = IMAGE_REPO + "/" + nowImgName;
	    			fileNames[4].transferTo(new File(savePath));
	    			dto.setImageName5(nowImgName);
	    		} catch (Exception e) {
	    			e.printStackTrace();
	    		}
	    	}
	    }
		mapper.modify(dto);
	}
	
	public void genDelete(GenBoardDTO dto) {
		String[] fileNames = {dto.getImageName1(), dto.getImageName2(), dto.getImageName3(), dto.getImageName4(),dto.getImageName5()};
		
		for(String fileName : fileNames ) {
			System.out.println("�씠由� : " + fileName);
			File file = new File(IMAGE_REPO + "/" + fileName);
    		file.delete();
		}
	}
	
}