package com.care.root.commember.service;

import java.util.List;
import java.util.Map;

import com.care.root.dto.ComMemberDTO;




public interface ComMemberService {
	public int logChk(String id, String pwd);
	public void comregister(ComMemberDTO dto, String[] addr);
	public void commodify(ComMemberDTO dto, String[] addr);
	public Map<String, Object> getMember(String id);
	public List<ComMemberDTO> getList();
}
