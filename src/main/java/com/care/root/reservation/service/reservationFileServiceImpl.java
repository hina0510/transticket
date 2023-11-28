package com.care.root.reservation.service;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.care.root.mybatis.reservation.concertBoardMapper;
import com.care.root.mybatis.reservation.concertSeatMapper;
import com.care.root.mybatis.reservation.exhibitionBoardMapper;
import com.care.root.mybatis.reservation.exhibitionSeatMapper;
import com.care.root.mybatis.reservation.musicalBoardMapper;
import com.care.root.mybatis.reservation.musicalSeatMapper;
import com.care.root.reservation.dto.concertBoardDTO;
import com.care.root.reservation.dto.concertSeatDTO;
import com.care.root.reservation.dto.exhibitionBoardDTO;
import com.care.root.reservation.dto.exhibitionSeatDTO;
import com.care.root.reservation.dto.musicalBoardDTO;
import com.care.root.reservation.dto.musicalSeatDTO;


@Service
public class reservationFileServiceImpl implements reservationFileService{
	@Autowired concertBoardMapper cmapper;
	@Autowired concertSeatMapper csmapper;
	@Autowired musicalBoardMapper mmapper;
	@Autowired musicalSeatMapper msmapper;
	@Autowired exhibitionBoardMapper emapper;
	@Autowired exhibitionSeatMapper esmapper;
	
	public String getMessage(String msg, String url) {
		String message = "<script>alert('"+msg+"');";
		message +="location.href='"+url+"';</script>";
		return message;
	}
	public void cSaveImage(concertBoardDTO cdto, MultipartFile[] file, String[] nan) {
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
	        cdto.setImageName1(nowImgName[0]);
	        cdto.setImageName2(nowImgName[1]);
	        cdto.setImageName3(nowImgName[2]);
	        cdto.setImageName4(nowImgName[3]);
	        cdto.setImageName5(nowImgName[4]);
	        
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
		System.out.println(cdto.getTitle());
		System.out.println(cdto.getType());
		System.out.println(cdto.getComname());
		System.out.println(cdto.getCon_stDate());
		System.out.println(cdto.getCon_endDate());
		System.out.println(cdto.getCon_place());
		System.out.println(cdto.getPrice());
		System.out.println(cdto.getContent());
		System.out.println(cdto.getForm());
		System.out.println(cdto.getImageName1());
		System.out.println(cdto.getImageName2());
		System.out.println(cdto.getImageName3());
		System.out.println(cdto.getImageName4());
		System.out.println(cdto.getImageName5());
			 
		int result = cmapper.cWriteSave(cdto);
		String msg = "", url="";
		if(result==1) {
			msg="게시되었습니다";
			url="/root/reservation/concert_board";
		}else {//DB 저장 실패 시
			msg="문제 발생";
			url="/root/reservation/write_concert_form";
		}
		getMessage(msg, url);
	}
	public void cModify(concertBoardDTO cdto, String[] nan,  MultipartFile[] fileNames) {
		
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd-HHmmss");
	    String saveNow = dateFormat.format(new Date());
		
	    if(nan[0].equals("nan")) { 
	    	if(!cdto.getImageName1().equals(nan[0])) { 
	    		File file = new File(IMAGE_REPO + "/" + cdto.getImageName1());
				file.delete();
				
				cdto.setImageName1("nan");
	    	}
	    }else { 
	    	if(!fileNames[0].isEmpty()) { 
	    		File file = new File(IMAGE_REPO + "/" + cdto.getImageName1());
				file.delete();
				try {
					String nowImgName = saveNow + "-" + fileNames[0].getOriginalFilename();
	        		String savePath = IMAGE_REPO + "/" + nowImgName;
	        		fileNames[0].transferTo(new File(savePath));
	        		cdto.setImageName1(nowImgName);
				} catch (Exception e) {
					e.printStackTrace();
				}
	    	}
	    }
	    
	    if(nan[1].equals("nan")) { 
	    	if(!cdto.getImageName2().equals(nan[1])) { 
	    		File file = new File(IMAGE_REPO + "/" + cdto.getImageName2());
	    		file.delete();
	    		
	    		cdto.setImageName2("nan");
	    	}
	    }else { 
	    	if(!fileNames[1].isEmpty()) { 
	    		File file = new File(IMAGE_REPO + "/" + cdto.getImageName2());
	    		file.delete();
	    		try {
	    			String nowImgName = saveNow + "-" + fileNames[1].getOriginalFilename();
	    			String savePath = IMAGE_REPO + "/" + nowImgName;
	    			fileNames[1].transferTo(new File(savePath));
	    			cdto.setImageName2(nowImgName);
	    		} catch (Exception e) {
	    			e.printStackTrace();
	    		}
	    	}
	    }
	    
	    if(nan[2].equals("nan")) { 
	    	if(!cdto.getImageName3().equals(nan[2])) { 
	    		File file = new File(IMAGE_REPO + "/" + cdto.getImageName3());
	    		file.delete();
	    		
	    		cdto.setImageName3("nan");
	    	}
	    }else { 
	    	if(!fileNames[2].isEmpty()) { 
	    		File file = new File(IMAGE_REPO + "/" + cdto.getImageName3());
	    		file.delete();
	    		try {
	    			String nowImgName = saveNow + "-" + fileNames[2].getOriginalFilename();
	    			String savePath = IMAGE_REPO + "/" + nowImgName;
	    			fileNames[2].transferTo(new File(savePath));
	    			cdto.setImageName3(nowImgName);
	    		} catch (Exception e) {
	    			e.printStackTrace();
	    		}
	    	}
	    }
	    
	    if(nan[3].equals("nan")) { 
	    	if(!cdto.getImageName4().equals(nan[3])) { 
	    		File file = new File(IMAGE_REPO + "/" + cdto.getImageName4());
	    		file.delete();
	    		
	    		cdto.setImageName4("nan");
	    	}
	    }else { 
	    	if(!fileNames[3].isEmpty()) { 
	    		File file = new File(IMAGE_REPO + "/" + cdto.getImageName4());
	    		file.delete();
	    		try {
	    			String nowImgName = saveNow + "-" + fileNames[3].getOriginalFilename();
	    			String savePath = IMAGE_REPO + "/" + nowImgName;
	    			fileNames[3].transferTo(new File(savePath));
	    			cdto.setImageName4(nowImgName);
	    		} catch (Exception e) {
	    			e.printStackTrace();
	    		}
	    	}
	    }
	    
	    if(nan[4].equals("nan")) { 
	    	if(!cdto.getImageName5().equals(nan[4])) {
	    		File file = new File(IMAGE_REPO + "/" + cdto.getImageName5());
	    		file.delete();
	    		
	    		cdto.setImageName5("nan");
	    	}
	    }else { 
	    	if(!fileNames[4].isEmpty()) { 
	    		File file = new File(IMAGE_REPO + "/" + cdto.getImageName5());
	    		file.delete();
	    		try {
	    			String nowImgName = saveNow + "-" + fileNames[4].getOriginalFilename();
	    			String savePath = IMAGE_REPO + "/" + nowImgName;
	    			fileNames[4].transferTo(new File(savePath));
	    			cdto.setImageName5(nowImgName);
	    		} catch (Exception e) {
	    			e.printStackTrace();
	    		}
	    	}
	    }
		int result = cmapper.cModify(cdto);
		String msg = "", url="";
		if(result==1) {
			msg="수정되었습니다";
			url="/root/reservation/concert_content?writeNo="+cdto.getWriteNo();
		}else {
			msg="문제 발생";
			url="/root/reservation/modify_concert_form?writeNo="+cdto.getWriteNo();
		}
		getMessage(msg, url);
	}
	public void cDelete(concertBoardDTO cdto) {
		String[] fileNames = {cdto.getImageName1(), cdto.getImageName2(), cdto.getImageName3(), cdto.getImageName4(), cdto.getImageName5()};
		
		for(String fileName : fileNames ) {
			System.out.println("fileName : " + fileName);
			File file = new File(IMAGE_REPO + "/" + fileName);
    		file.delete();
		}
	}
	public void cSeatSave(concertSeatDTO cdto) {
		System.out.println(cdto.getConS_id());
		csmapper.cSeatSave(cdto);
	}
	
	public void mSaveImage(musicalBoardDTO mdto, MultipartFile[] file, String[] nan) {
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
	        mdto.setImageName1(nowImgName[0]);
	        mdto.setImageName2(nowImgName[1]);
	        mdto.setImageName3(nowImgName[2]);
	        mdto.setImageName4(nowImgName[3]);
	        mdto.setImageName5(nowImgName[4]);
	        
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
		System.out.println(mdto.getTitle());
		System.out.println(mdto.getType());
		System.out.println(mdto.getComname());
		System.out.println(mdto.getMu_stDate());
		System.out.println(mdto.getMu_endDate());
		System.out.println(mdto.getMu_place());
		System.out.println(mdto.getPrice());
		System.out.println(mdto.getContent());
		System.out.println(mdto.getForm());
		System.out.println(mdto.getImageName1());
		System.out.println(mdto.getImageName2());
		System.out.println(mdto.getImageName3());
		System.out.println(mdto.getImageName4());
		System.out.println(mdto.getImageName5());
		
		int result = mmapper.mWriteSave(mdto);
		String msg = "", url="";
		if(result==1) {//DB 저장 시
			msg="게시되었습니다";
			url="/root/reservation/musical_board";
		}else {//DB 저장 실패 시
			msg="문제 발생";
			url="/root/reservation/write_musical_form";
		}
		getMessage(msg, url);
	}
	public void mModify(musicalBoardDTO mdto, String[] nan,  MultipartFile[] fileNames) {
		
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd-HHmmss");
		String saveNow = dateFormat.format(new Date());
		
		if(nan[0].equals("nan")) { 
			if(!mdto.getImageName1().equals(nan[0])) { 
				File file = new File(IMAGE_REPO + "/" + mdto.getImageName1());
				file.delete();
				
				mdto.setImageName1("nan");
			}
		}else { 
			if(!fileNames[0].isEmpty()) { 
				File file = new File(IMAGE_REPO + "/" + mdto.getImageName1());
				file.delete();
				try {
					String nowImgName = saveNow + "-" + fileNames[0].getOriginalFilename();
					String savePath = IMAGE_REPO + "/" + nowImgName;
					fileNames[0].transferTo(new File(savePath));
					mdto.setImageName1(nowImgName);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		
		if(nan[1].equals("nan")) { 
			if(!mdto.getImageName2().equals(nan[1])) { 
				File file = new File(IMAGE_REPO + "/" + mdto.getImageName2());
				file.delete();
				
				mdto.setImageName2("nan");
			}
		}else { 
			if(!fileNames[1].isEmpty()) { 
				File file = new File(IMAGE_REPO + "/" + mdto.getImageName2());
				file.delete();
				try {
					String nowImgName = saveNow + "-" + fileNames[1].getOriginalFilename();
					String savePath = IMAGE_REPO + "/" + nowImgName;
					fileNames[1].transferTo(new File(savePath));
					mdto.setImageName2(nowImgName);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		
		if(nan[2].equals("nan")) { 
			if(!mdto.getImageName3().equals(nan[2])) { 
				File file = new File(IMAGE_REPO + "/" + mdto.getImageName3());
				file.delete();
				
				mdto.setImageName3("nan");
			}
		}else { 
			if(!fileNames[2].isEmpty()) { 
				File file = new File(IMAGE_REPO + "/" + mdto.getImageName3());
				file.delete();
				try {
					String nowImgName = saveNow + "-" + fileNames[2].getOriginalFilename();
					String savePath = IMAGE_REPO + "/" + nowImgName;
					fileNames[2].transferTo(new File(savePath));
					mdto.setImageName3(nowImgName);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		
		if(nan[3].equals("nan")) { 
			if(!mdto.getImageName4().equals(nan[3])) { 
				File file = new File(IMAGE_REPO + "/" + mdto.getImageName4());
				file.delete();
				
				mdto.setImageName4("nan");
			}
		}else { 
			if(!fileNames[3].isEmpty()) { 
				File file = new File(IMAGE_REPO + "/" + mdto.getImageName4());
				file.delete();
				try {
					String nowImgName = saveNow + "-" + fileNames[3].getOriginalFilename();
					String savePath = IMAGE_REPO + "/" + nowImgName;
					fileNames[3].transferTo(new File(savePath));
					mdto.setImageName4(nowImgName);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		
		if(nan[4].equals("nan")) { 
			if(!mdto.getImageName5().equals(nan[4])) {
				File file = new File(IMAGE_REPO + "/" + mdto.getImageName5());
				file.delete();
				
				mdto.setImageName5("nan");
			}
		}else { 
			if(!fileNames[4].isEmpty()) { 
				File file = new File(IMAGE_REPO + "/" + mdto.getImageName5());
				file.delete();
				try {
					String nowImgName = saveNow + "-" + fileNames[4].getOriginalFilename();
					String savePath = IMAGE_REPO + "/" + nowImgName;
					fileNames[4].transferTo(new File(savePath));
					mdto.setImageName5(nowImgName);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		int result = mmapper.mModify(mdto);
		String msg = "", url="";
		if(result==1) {
			msg="수정되었습니다";
			url="/root/reservation/concert_content?writeNo="+mdto.getWriteNo();
		}else {
			msg="문제 발생";
			url="/root/reservation/modify_concert_form?writeNo="+mdto.getWriteNo();
		}
		getMessage(msg, url);
	}
	public void mDelete(musicalBoardDTO mdto) {
		String[] fileNames = {mdto.getImageName1(), mdto.getImageName2(), mdto.getImageName3(), mdto.getImageName4(), mdto.getImageName5()};
		
		for(String fileName : fileNames ) {
			System.out.println("fileName : " + fileName);
			File file = new File(IMAGE_REPO + "/" + fileName);
    		file.delete();
		}
	}
	public void mSeatSave(musicalSeatDTO mdto) {
		System.out.println(mdto.getMuS_id());
		msmapper.mSeatSave(mdto);
	}
	
	public void eSaveImage(exhibitionBoardDTO edto, MultipartFile[] file, String[] nan) {
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
	        edto.setImageName1(nowImgName[0]);
	        edto.setImageName2(nowImgName[1]);
	        edto.setImageName3(nowImgName[2]);
	        edto.setImageName4(nowImgName[3]);
	        edto.setImageName5(nowImgName[4]);
	        
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
		System.out.println(edto.getTitle());
		System.out.println(edto.getType());
		System.out.println(edto.getComname());
		System.out.println(edto.getEx_stDate());
		System.out.println(edto.getEx_endDate());
		System.out.println(edto.getEx_place());
		System.out.println(edto.getPrice());
		System.out.println(edto.getContent());
		System.out.println(edto.getForm());
		System.out.println(edto.getImageName1());
		System.out.println(edto.getImageName2());
		System.out.println(edto.getImageName3());
		System.out.println(edto.getImageName4());
		System.out.println(edto.getImageName5());
		
		int result = emapper.eWriteSave(edto);
		String msg = "", url="";
		if(result==1) {//DB 저장 시
			msg="게시되었습니다";
			url="/root/reservation/concert_board";
		}else {//DB 저장 실패 시
			msg="문제 발생";
			url="/root/reservation/write_concert_form";
		}
		getMessage(msg, url);
	}
	
	public void eModify(exhibitionBoardDTO edto, String[] nan,  MultipartFile[] fileNames) {
		
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd-HHmmss");
		String saveNow = dateFormat.format(new Date());
		
		if(nan[0].equals("nan")) { 
			if(!edto.getImageName1().equals(nan[0])) { 
				File file = new File(IMAGE_REPO + "/" + edto.getImageName1());
				file.delete();
				
				edto.setImageName1("nan");
			}
		}else { 
			if(!fileNames[0].isEmpty()) { 
				File file = new File(IMAGE_REPO + "/" + edto.getImageName1());
				file.delete();
				try {
					String nowImgName = saveNow + "-" + fileNames[0].getOriginalFilename();
					String savePath = IMAGE_REPO + "/" + nowImgName;
					fileNames[0].transferTo(new File(savePath));
					edto.setImageName1(nowImgName);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		
		if(nan[1].equals("nan")) { 
			if(!edto.getImageName2().equals(nan[1])) { 
				File file = new File(IMAGE_REPO + "/" + edto.getImageName2());
				file.delete();
				
				edto.setImageName2("nan");
			}
		}else { 
			if(!fileNames[1].isEmpty()) { 
				File file = new File(IMAGE_REPO + "/" + edto.getImageName2());
				file.delete();
				try {
					String nowImgName = saveNow + "-" + fileNames[1].getOriginalFilename();
					String savePath = IMAGE_REPO + "/" + nowImgName;
					fileNames[1].transferTo(new File(savePath));
					edto.setImageName2(nowImgName);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		
		if(nan[2].equals("nan")) { 
			if(!edto.getImageName3().equals(nan[2])) { 
				File file = new File(IMAGE_REPO + "/" + edto.getImageName3());
				file.delete();
				
				edto.setImageName3("nan");
			}
		}else { 
			if(!fileNames[2].isEmpty()) { 
				File file = new File(IMAGE_REPO + "/" + edto.getImageName3());
				file.delete();
				try {
					String nowImgName = saveNow + "-" + fileNames[2].getOriginalFilename();
					String savePath = IMAGE_REPO + "/" + nowImgName;
					fileNames[2].transferTo(new File(savePath));
					edto.setImageName3(nowImgName);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		
		if(nan[3].equals("nan")) { 
			if(!edto.getImageName4().equals(nan[3])) { 
				File file = new File(IMAGE_REPO + "/" + edto.getImageName4());
				file.delete();
				
				edto.setImageName4("nan");
			}
		}else { 
			if(!fileNames[3].isEmpty()) { 
				File file = new File(IMAGE_REPO + "/" + edto.getImageName4());
				file.delete();
				try {
					String nowImgName = saveNow + "-" + fileNames[3].getOriginalFilename();
					String savePath = IMAGE_REPO + "/" + nowImgName;
					fileNames[3].transferTo(new File(savePath));
					edto.setImageName4(nowImgName);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		
		if(nan[4].equals("nan")) { 
			if(!edto.getImageName5().equals(nan[4])) {
				File file = new File(IMAGE_REPO + "/" + edto.getImageName5());
				file.delete();
				
				edto.setImageName5("nan");
			}
		}else { 
			if(!fileNames[4].isEmpty()) { 
				File file = new File(IMAGE_REPO + "/" + edto.getImageName5());
				file.delete();
				try {
					String nowImgName = saveNow + "-" + fileNames[4].getOriginalFilename();
					String savePath = IMAGE_REPO + "/" + nowImgName;
					fileNames[4].transferTo(new File(savePath));
					edto.setImageName5(nowImgName);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		int result = emapper.eModify(edto);
		String msg = "", url="";
		if(result==1) {
			msg="수정되었습니다";
			url="/root/reservation/concert_content?writeNo="+edto.getWriteNo();
		}else {
			msg="문제 발생";
			url="/root/reservation/modify_concert_form?writeNo="+edto.getWriteNo();
		}
		getMessage(msg, url);
	}
	
	public void eDelete(exhibitionBoardDTO edto) {
		String[] fileNames = {edto.getImageName1(), edto.getImageName2(), edto.getImageName3(), edto.getImageName4(), edto.getImageName5()};
		
		for(String fileName : fileNames ) {
			System.out.println("fileName : " + fileName);
			File file = new File(IMAGE_REPO + "/" + fileName);
    		file.delete();
		}
	}
	public void eSeatSave(exhibitionSeatDTO edto) {
		esmapper.eSeatSave(edto);
	}
	
}
