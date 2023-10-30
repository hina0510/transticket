package com.care.root.mybatis;

import java.util.List;

import com.care.root.dto.GenMemberDTO;

public interface GenMemberMapper {
	public GenMemberDTO getMember(String id);
	public void genregister(GenMemberDTO dto);
	public void genmodify(GenMemberDTO dto);
	public List<GenMemberDTO> getList();
}
