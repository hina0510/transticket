package com.care.root.genmember.service;

import java.util.List;
import java.util.Map;


import com.care.root.dto.GenMemberDTO;

public interface GenMemberService {
	public int logChk1(String id, String pwd);
	public void genregister(GenMemberDTO dto, String[] addr);
	public void genmodify(GenMemberDTO dto, String[] addr);
	public Map<String, Object> getMember(String id);
	public List<GenMemberDTO> getList();
}
