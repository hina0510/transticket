package com.care.root.genmember.service;

import java.util.List;
import java.util.Map;

import com.care.root.member.dto.GenMemberDTO;

public interface GenMemberService {
	public int logChk1(String id, String pwd);
	public void genregister(GenMemberDTO dto, String[] addr);
	public void genmodify(GenMemberDTO dto, String[] addr);
	public Map<String, Object> getMember(String id);
	public List<GenMemberDTO> getList();
	public void gendelete(String id);
	public void keepLogin(String sessionId, String id);
	public GenMemberDTO getGenSessionId(String id);
	public int idchk(String id);
	public int emailchk(String email);
}
