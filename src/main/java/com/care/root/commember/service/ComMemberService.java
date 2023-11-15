package com.care.root.commember.service;

import java.util.List;
import java.util.Map;

import com.care.root.member.dto.ComMemberDTO;




public interface ComMemberService {
	public int logChk(String id, String pwd);
	public void comregister(ComMemberDTO dto, String[] addr);
	public void commodify(ComMemberDTO dto, String[] addr);
	public Map<String, Object> getMember(String id);
	public List<ComMemberDTO> getList();
	public void comdelete(String id);
	public void keepLogin(String sessionId, String id);
	public ComMemberDTO getComSessionId(String id);
	public int idchk(String id);
	public int emailchk(String email);
}
