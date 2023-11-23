package com.care.root.board.service;

import java.util.List;

import com.care.root.board.dto.ReplyDTO;

public interface ReplyService {
	public void addReply(ReplyDTO dto);
	public List<ReplyDTO> viewRep(int writeNo);
	public void replyDelete(int replyNo);
	public void replyModify(ReplyDTO dto);
}
