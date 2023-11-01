package com.care.root.mybatis.member;

import java.util.List;
import java.util.Map;

import com.care.root.member.dto.GenMemberDTO;

public interface GenMemberMapper {
	public GenMemberDTO getMember(String id);
	public void genregister(GenMemberDTO dto);
	public void genmodify(GenMemberDTO dto);
	public List<GenMemberDTO> getList();
	public void gendelete(String id);
	public void keepLogin(Map<String, Object> map);
	public GenMemberDTO getGenSessionId(String sessionId);
}
