package com.care.root.genmember.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;


import com.care.root.member.dto.GenMemberDTO;
import com.care.root.mybatis.member.GenMemberMapper;

@Service
public class GenMemberServiceImpl implements GenMemberService{
	BCryptPasswordEncoder encoder;
	@Autowired GenMemberMapper mapper;
	
	public GenMemberServiceImpl() {
		encoder = new BCryptPasswordEncoder();
	}
	
	public int logChk1(String id, String pwd) {
		GenMemberDTO dto = mapper.getMember(id);
		int result = 1;
		if(dto!=null) {
			if(encoder.matches(pwd, dto.getPwd())||pwd.equals(dto.getPwd())) {
				result = 0;
			}
		}
		return result;
	}
	
	public void genregister(GenMemberDTO dto, String[] addr) {
		String ad = "";
		for(String a : addr) {
			ad += a+"/";
		}
		dto.setAddr(ad);
		
		dto.setPwd(encoder.encode(dto.getPwd()));
		try {
			mapper.genregister(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
	
	}
	public List<GenMemberDTO> getList(){
		List<GenMemberDTO> list = null;
		try {
			list = mapper.getList();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	public Map<String, Object> getMember(String id){
		GenMemberDTO dto = mapper.getMember(id);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("dto", dto);
		String[] addr = dto.getAddr().split("/");
		if(addr.length>1) {
			map.put("addr1", addr[0]);
			map.put("addr2", addr[1]);
			map.put("addr3", addr[2]);
		}
		return map;
	}
	
	public void genmodify(GenMemberDTO dto, String[] addr) {
		String ad = "";
		for(String a : addr) {
			ad += a+"/";
		}
		dto.setAddr(ad);
		dto.setPwd(encoder.encode(dto.getPwd()));
		try {
			mapper.genmodify(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void gendelete(String id) {
		mapper.gendelete(id);
	}
	
	public void keepLogin(String sessionId, String id) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("sessionId", sessionId);
		map.put("id", id);
		mapper.keepLogin(map);
		
	}
	
	public GenMemberDTO getGenSessionId(String sessionId) {
		return mapper.getGenSessionId(sessionId);
	}
	public int idchk(String id) {
		int result = mapper.idchk(id);
		return result;
	}
	public int emailchk(String email) {
		int result = mapper.emailchk(email);
		return result;
	}
}
