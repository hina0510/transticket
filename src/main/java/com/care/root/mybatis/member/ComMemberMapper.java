package com.care.root.mybatis.member;


import java.util.List;
import java.util.Map;

import com.care.root.member.dto.ComMemberDTO;



public interface ComMemberMapper {
	public ComMemberDTO getMember(String id);
	public void comregister(ComMemberDTO dto);
	public void commodify(ComMemberDTO dto);
	public List<ComMemberDTO> getList();
	public void comdelete(String id);
	public void keepLogin(Map<String, Object> map);
	public ComMemberDTO getComSessionId(String sessionId);
}
