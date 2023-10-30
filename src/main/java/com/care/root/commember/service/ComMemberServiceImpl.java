package com.care.root.commember.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.care.root.dto.ComMemberDTO;
import com.care.root.mybatis.ComMemberMapper;


@Service
public class ComMemberServiceImpl implements ComMemberService{
	@Autowired(required = false) ComMemberMapper mapper;
	
	public int logChk(String id, String pwd) {
		ComMemberDTO dto = mapper.getMember(id);
		int result = 1;
		if(dto!=null) {
			System.out.println(dto.getId());
			System.out.println(dto.getPwd());
			System.out.println(dto.getAddr());
			if(pwd.equals(dto.getPwd())) {
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
		
		dto.setPwd(dto.getPwd());
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
		System.out.println(dto.getName());
		dto.setAddr(ad);
		
		try {
			mapper.commodify(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
	
	}
}
