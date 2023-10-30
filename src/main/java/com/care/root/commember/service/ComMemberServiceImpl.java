package com.care.root.commember.service;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;


import com.care.root.member.dto.ComMemberDTO;
import com.care.root.mybatis.ComMemberMapper;


@Service
public class ComMemberServiceImpl implements ComMemberService{
	BCryptPasswordEncoder encoder;
	@Autowired ComMemberMapper mapper;
	public ComMemberServiceImpl() {
		encoder = new BCryptPasswordEncoder();
	}
	public int logChk(String id, String pwd) {
		ComMemberDTO dto = mapper.getMember(id);
		int result = 1;
		if(dto!=null) {
			if(encoder.matches(pwd, dto.getPwd())||pwd.equals(dto.getPwd())) {
				result = 0;
			}
		}
		
		return result;
	}
	public void comregister(ComMemberDTO dto, String[] addr) {
		String ad = "";
		for(String a : addr) {
			ad += a+"/";
		}
		dto.setAddr(ad);
		dto.setPwd(encoder.encode(dto.getPwd()));
		try {
			mapper.comregister(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
	
	}
	public List<ComMemberDTO> getList(){
		List<ComMemberDTO> list = null;
		try {
			list = mapper.getList();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	public Map<String, Object> getMember(String id){
		ComMemberDTO dto = mapper.getMember(id);
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
	
	public void commodify(ComMemberDTO dto, String[] addr) {
		String ad = "";
		for(String a : addr) {
			ad += a+"/";
		}
		dto.setAddr(ad);
		dto.setPwd(encoder.encode(dto.getPwd()));
		try {
			mapper.commodify(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
	
	}
	public void comdelete(String id) {
		mapper.comdelete(id);
	}
	public void keepLogin(String sessionId, String id) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("sessionId", sessionId);
		map.put("id", id);
		mapper.keepLogin(map);
		
	}
	public ComMemberDTO getComSessionId(String sessionId) {
		return mapper.getComSessionId(sessionId);
	}
}
