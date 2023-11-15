package com.care.root.board.service;

import java.io.File;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import com.care.root.board.dto.GenBoardDTO;
import com.care.root.mybatis.board.GenBoardMapper;

@Service
public class GenFileServiceImpl implements GenFileService {
	@Autowired GenBoardMapper mapper;
	
	
	public void saveImage(GenBoardDTO dto, MultipartFile[] file, String[] nan) {
		try {
		        String[] savePath = new String[5];
		        String[] nowImgName = new String[5];
		        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd-HHmmss");
		        String saveNow = dateFormat.format(new Date());
		        
		        for(int i = 0; i < 5; i++) {
		        	if(nan[i].equals("1")) {
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

	
	public void modify(GenBoardDTO dto, String[] nan,  MultipartFile[] fileNames) {
		
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd-HHmmss");
	    String saveNow = dateFormat.format(new Date());
		
	    if(nan[0].equals("nan")) { // 占쎌뵠沃섎챷占썲첎占� nan.png嚥∽옙 占쎄퐬占쎌젟占쎈┷占쎈�占쎌뱽 野껋럩�뒭
	    	if(!dto.getImageName1().equals(nan[0])) { //筌ｌ꼷�벉 dto占쎈퓠 占쏙옙占쎌삢占쎈쭆 揶쏅�れ뵠 nan.png占쎌뵠 占쎈툡占쎈빜 野껋럩�뒭 疫꿸퀣�� 占쎌뵠沃섎챷占� 占쎄텣占쎌젫占쎈릭�⑨옙 nan占쎌몵嚥∽옙 獄쏅떽�뵒占쎈뼄.
	    		File file = new File(IMAGE_REPO + "/" + dto.getImageName1());
				file.delete();
				
				dto.setImageName1("nan");
	    	}
	    }else { // 占쎌뵠沃섎챷占썲첎占� nan.png揶쏉옙 占쎈툡占쎈빜 野껋럩�뒭
	    	if(!fileNames[0].isEmpty()) { // 獄쏄퀣肉댐옙�뵠 �뜮袁⑸선占쎌뿳筌욑옙 占쎈륫占쎈뼄筌롳옙 占쎌뵠沃섎챷占썲첎占� 癰귨옙野껋럥留� 野껉퍔�뵠占쎈뼄.
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
	    
	    if(nan[1].equals("nan")) { // 占쎌뵠沃섎챷占썲첎占� nan.png嚥∽옙 占쎄퐬占쎌젟占쎈┷占쎈�占쎌뱽 野껋럩�뒭
	    	if(!dto.getImageName2().equals(nan[1])) { //筌ｌ꼷�벉 dto占쎈퓠 占쏙옙占쎌삢占쎈쭆 揶쏅�れ뵠 nan.png占쎌뵠 占쎈툡占쎈빜 野껋럩�뒭 疫꿸퀣�� 占쎌뵠沃섎챷占� 占쎄텣占쎌젫占쎈릭�⑨옙 nan占쎌몵嚥∽옙 獄쏅떽�뵒占쎈뼄.
	    		File file = new File(IMAGE_REPO + "/" + dto.getImageName2());
	    		file.delete();
	    		
	    		dto.setImageName2("nan");
	    	}
	    }else { // 占쎌뵠沃섎챷占썲첎占� nan.png揶쏉옙 占쎈툡占쎈빜 野껋럩�뒭
	    	if(!fileNames[1].isEmpty()) { // 獄쏄퀣肉댐옙�뵠 �뜮袁⑸선占쎌뿳筌욑옙 占쎈륫占쎈뼄筌롳옙 占쎌뵠沃섎챷占썲첎占� 癰귨옙野껋럥留� 野껉퍔�뵠占쎈뼄.
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
	    
	    if(nan[2].equals("nan")) { // 占쎌뵠沃섎챷占썲첎占� nan.png嚥∽옙 占쎄퐬占쎌젟占쎈┷占쎈�占쎌뱽 野껋럩�뒭
	    	if(!dto.getImageName3().equals(nan[2])) { //筌ｌ꼷�벉 dto占쎈퓠 占쏙옙占쎌삢占쎈쭆 揶쏅�れ뵠 nan.png占쎌뵠 占쎈툡占쎈빜 野껋럩�뒭 疫꿸퀣�� 占쎌뵠沃섎챷占� 占쎄텣占쎌젫占쎈릭�⑨옙 nan占쎌몵嚥∽옙 獄쏅떽�뵒占쎈뼄.
	    		File file = new File(IMAGE_REPO + "/" + dto.getImageName3());
	    		file.delete();
	    		
	    		dto.setImageName3("nan");
	    	}
	    }else { // 占쎌뵠沃섎챷占썲첎占� nan.png揶쏉옙 占쎈툡占쎈빜 野껋럩�뒭
	    	if(!fileNames[2].isEmpty()) { // 獄쏄퀣肉댐옙�뵠 �뜮袁⑸선占쎌뿳筌욑옙 占쎈륫占쎈뼄筌롳옙 占쎌뵠沃섎챷占썲첎占� 癰귨옙野껋럥留� 野껉퍔�뵠占쎈뼄.
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
	    
	    if(nan[3].equals("nan")) { // 占쎌뵠沃섎챷占썲첎占� nan.png嚥∽옙 占쎄퐬占쎌젟占쎈┷占쎈�占쎌뱽 野껋럩�뒭
	    	if(!dto.getImageName4().equals(nan[3])) { //筌ｌ꼷�벉 dto占쎈퓠 占쏙옙占쎌삢占쎈쭆 揶쏅�れ뵠 nan.png占쎌뵠 占쎈툡占쎈빜 野껋럩�뒭 疫꿸퀣�� 占쎌뵠沃섎챷占� 占쎄텣占쎌젫占쎈릭�⑨옙 nan占쎌몵嚥∽옙 獄쏅떽�뵒占쎈뼄.
	    		File file = new File(IMAGE_REPO + "/" + dto.getImageName4());
	    		file.delete();
	    		
	    		dto.setImageName4("nan");
	    	}
	    }else { // 占쎌뵠沃섎챷占썲첎占� nan.png揶쏉옙 占쎈툡占쎈빜 野껋럩�뒭
	    	if(!fileNames[3].isEmpty()) { // 獄쏄퀣肉댐옙�뵠 �뜮袁⑸선占쎌뿳筌욑옙 占쎈륫占쎈뼄筌롳옙 占쎌뵠沃섎챷占썲첎占� 癰귨옙野껋럥留� 野껉퍔�뵠占쎈뼄.
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
	    
	    if(nan[4].equals("nan")) { // 占쎌뵠沃섎챷占썲첎占� nan.png嚥∽옙 占쎄퐬占쎌젟占쎈┷占쎈�占쎌뱽 野껋럩�뒭
	    	if(!dto.getImageName5().equals(nan[4])) { //筌ｌ꼷�벉 dto占쎈퓠 占쏙옙占쎌삢占쎈쭆 揶쏅�れ뵠 nan.png占쎌뵠 占쎈툡占쎈빜 野껋럩�뒭 疫꿸퀣�� 占쎌뵠沃섎챷占� 占쎄텣占쎌젫占쎈릭�⑨옙 nan占쎌몵嚥∽옙 獄쏅떽�뵒占쎈뼄.
	    		File file = new File(IMAGE_REPO + "/" + dto.getImageName5());
	    		file.delete();
	    		
	    		dto.setImageName5("nan");
	    	}
	    }else { // 占쎌뵠沃섎챷占썲첎占� nan.png揶쏉옙 占쎈툡占쎈빜 野껋럩�뒭
	    	if(!fileNames[4].isEmpty()) { // 獄쏄퀣肉댐옙�뵠 �뜮袁⑸선占쎌뿳筌욑옙 占쎈륫占쎈뼄筌롳옙 占쎌뵠沃섎챷占썲첎占� 癰귨옙野껋럥留� 野껉퍔�뵠占쎈뼄.
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
			System.out.println("占쎌뵠�뵳占� : " + fileName);
			File file = new File(IMAGE_REPO + "/" + fileName);
    		file.delete();
		}
	}


	@Override
	public void selectSearch(Model model, String type, String keyword, int num) {
		// TODO Auto-generated method stub
		
	}


	@Override
	public void boardList(Model model, int num) {
		// TODO Auto-generated method stub
		
	}


}