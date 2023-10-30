package com.care.root.reservation.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.care.root.mybatis.reservation.concertBoardMapper;
import com.care.root.mybatis.reservation.exhibitionBoardMapper;
import com.care.root.mybatis.reservation.musicalBoardMapper;
import com.care.root.reservation.dto.concertBoardDTO;
import com.care.root.reservation.dto.exhibitionBoardDTO;
import com.care.root.reservation.dto.musicalBoardDTO;

@Service
public class reservationServiceImpl implements reservationService{
	@Autowired concertBoardMapper cmapper;
	@Autowired musicalBoardMapper mmapper;
	@Autowired exhibitionBoardMapper emapper;
	@Autowired reservationFileService fs;
	
	public Map<String, Object> cBoardList(int num){
		int pageLetter = 3; //�� �� ��
		int allCount = cmapper.selectCBoardCount(); //�� �� ����
		int repeat = allCount/pageLetter; //�� ������ ��
		if(allCount%pageLetter !=0) {//������ �������� ������
			repeat++;
		}
		int end = num * pageLetter;
		int start = end + 1 - pageLetter;
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("repeat", repeat);
		map.put("list", cmapper.cBoardList(start, end));
		
		return map;
	}
	public concertBoardDTO cContentView(int writeNo) {
		cUpHit(writeNo);
		return cmapper.cGetContent(writeNo);
	}
	private void cUpHit(int writeNo) {
		cmapper.cUpHit(writeNo);
	}
	public String cWriteSave(concertBoardDTO cdto, MultipartFile file) {
		cdto.setImage_file_name(fs.saveFile(file));
		
		int result = cmapper.cWriteSave(cdto);
		String msg = "", url="";
		if(result==1) {//DB�� ���������� ����
			msg="�� ���� �߰��Ǿ����ϴ�";
			url="/root/reservation/concert_board";
		}else {//DB�� ���� ����
			msg="������ �߻��߽��ϴ�";
			url="/root/reservation/write_concert_form";
		}
		return fs.getMessage(msg, url);
	}
	public concertBoardDTO cGetContent(int writeNo) {
		return cmapper.cGetContent(writeNo);
	}
	public String cModify(concertBoardDTO cdto, MultipartFile file) {
		String originName = null;
		if(!file.isEmpty()) { //������
			originName = cdto.getImage_file_name();
			cdto.setImage_file_name(fs.saveFile(file));
		}
		int result = cmapper.cModify(cdto);
		String msg = "", url="";
		if(result==1) {
			//�⺻ �̹��� ���� originName
			fs.deleteImage(originName);
			msg="�����Ǿ����ϴ�";
			url="/root/reservation/concert_content?writeNo="+cdto.getWriteNo();
		}else {
			//���� �̹��� ���� dto.getImage_file_name()
			fs.deleteImage(cdto.getImage_file_name());
			msg="���� �߻�";
			url="/root/reservation/modify_concert_form?writeNo="+cdto.getWriteNo();
		}
		return fs.getMessage(msg, url);
	}
	public String cDelete(int writeNo, String fileName) {
		int result = cmapper.cDelete(writeNo);
		String msg = "", url="";
		if(result==1) {
			fs.deleteImage(fileName);
			msg="�����Ǿ����ϴ�";
			url="/root/reservation/concert_board";
		}else {
			msg="���� �߻�";
			url="/root/reservation/concert_content?writeNo="+writeNo;
		}
		return fs.getMessage(msg, url);
	}
	
	public Map<String, Object> mBoardList(int num){
		int pageLetter = 3; //�� �� ��
		int allCount = mmapper.selectMBoardCount(); //�� �� ����
		int repeat = allCount/pageLetter; //�� ������ ��
		if(allCount%pageLetter !=0) {//������ �������� ������
			repeat++;
		}
		int end = num * pageLetter;
		int start = end + 1 - pageLetter;
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("repeat", repeat);
		map.put("list", mmapper.mBoardList(start, end));
		
		return map;
	}
	public musicalBoardDTO mContentView(int writeNo) {
		mUpHit(writeNo);
		return mmapper.mGetContent(writeNo);
	}
	private void mUpHit(int writeNo) {
		mmapper.mUpHit(writeNo);
	}
	public String mWriteSave(musicalBoardDTO mdto, MultipartFile file) {
		mdto.setImage_file_name(fs.saveFile(file));
		
		int result = mmapper.mWriteSave(mdto);
		String msg = "", url="";
		if(result==1) {//DB�� ���������� ����
			msg="�� ���� �߰��Ǿ����ϴ�";
			url="/root/reservation/musical_board";
		}else {//DB�� ���� ����
			msg="������ �߻��߽��ϴ�";
			url="/root/reservation/write_musical_form";
		}
		return fs.getMessage(msg, url);
	}
	public musicalBoardDTO mGetContent(int writeNo) {
		return mmapper.mGetContent(writeNo);
	}
	public String mModify(musicalBoardDTO mdto, MultipartFile file) {
		String originName = null;
		if(!file.isEmpty()) { //������
			originName = mdto.getImage_file_name();
			mdto.setImage_file_name(fs.saveFile(file));
		}
		int result = mmapper.mModify(mdto);
		String msg = "", url="";
		if(result==1) {
			//�⺻ �̹��� ���� originName
			fs.deleteImage(originName);
			msg="�����Ǿ����ϴ�";
			url="/root/reservation/musical_content?writeNo="+mdto.getWriteNo();
		}else {
			//���� �̹��� ���� dto.getImage_file_name()
			fs.deleteImage(mdto.getImage_file_name());
			msg="���� �߻�";
			url="/root/reservation/modify_musical_form?writeNo="+mdto.getWriteNo();
		}
		return fs.getMessage(msg, url);
	}
	public String mDelete(int writeNo, String fileName) {
		int result = mmapper.mDelete(writeNo);
		String msg = "", url="";
		if(result==1) {
			fs.deleteImage(fileName);
			msg="�����Ǿ����ϴ�";
			url="/root/reservation/musical_board";
		}else {
			msg="���� �߻�";
			url="/root/reservation/musical_content?writeNo="+writeNo;
		}
		return fs.getMessage(msg, url);
	}
	
	public Map<String, Object> eBoardList(int num){
		int pageLetter = 3; //�� �� ��
		int allCount = emapper.selectEBoardCount(); //�� �� ����
		int repeat = allCount/pageLetter; //�� ������ ��
		if(allCount%pageLetter !=0) {//������ �������� ������
			repeat++;
		}
		int end = num * pageLetter;
		int start = end + 1 - pageLetter;
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("repeat", repeat);
		map.put("list", emapper.eBoardList(start, end));
		
		return map;
	}
	public exhibitionBoardDTO eContentView(int writeNo) {
		eUpHit(writeNo);
		return emapper.eGetContent(writeNo);
	}
	private void eUpHit(int writeNo) {
		emapper.eUpHit(writeNo);
	}
	public String eWriteSave(exhibitionBoardDTO edto, MultipartFile file){
		edto.setImage_file_name(fs.saveFile(file));
		
		int result = emapper.eWriteSave(edto);
		String msg = "", url="";
		if(result==1) {//DB�� ���������� ����
			msg="�� ���� �߰��Ǿ����ϴ�";
			url="/root/reservation/exhibition_board";
		}else {//DB�� ���� ����
			msg="������ �߻��߽��ϴ�";
			url="/root/reservation/write_exhibition_form";
		}
		return fs.getMessage(msg, url);
	}
	public exhibitionBoardDTO eGetContent(int writeNo) {
		return emapper.eGetContent(writeNo);
	}
	public String eModify(exhibitionBoardDTO edto, MultipartFile file) {
		String originName = null;
		if(!file.isEmpty()) { //������
			originName = edto.getImage_file_name();
			edto.setImage_file_name(fs.saveFile(file));
		}
		int result = emapper.eModify(edto);
		String msg = "", url="";
		if(result==1) {
			//�⺻ �̹��� ���� originName
			fs.deleteImage(originName);
			msg="�����Ǿ����ϴ�";
			url="/root/reservation/exhibition_content?writeNo="+edto.getWriteNo();
		}else {
			//���� �̹��� ���� dto.getImage_file_name()
			fs.deleteImage(edto.getImage_file_name());
			msg="���� �߻�";
			url="/root/reservation/modify_exhibition_form?writeNo="+edto.getWriteNo();
		}
		return fs.getMessage(msg, url);
	}
	public String eDelete(int writeNo, String fileName) {
		int result = emapper.eDelete(writeNo);
		String msg = "", url="";
		if(result==1) {
			fs.deleteImage(fileName);
			msg="�����Ǿ����ϴ�";
			url="/root/reservation/exhibition_board";
		}else {
			msg="���� �߻�";
			url="/root/reservation/exhibition_content?writeNo="+writeNo;
		}
		return fs.getMessage(msg, url);
	}
}
