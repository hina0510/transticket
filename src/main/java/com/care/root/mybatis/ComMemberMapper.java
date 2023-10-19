package com.care.root.mybatis;


import java.util.List;

import com.care.root.dto.ComMemberDTO;



public interface ComMemberMapper {
	public ComMemberDTO getMember(String id);
	public void comregister(ComMemberDTO dto);
	public void commodify(ComMemberDTO dto);
	public List<ComMemberDTO> getList();
}
