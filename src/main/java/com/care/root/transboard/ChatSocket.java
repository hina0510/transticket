package com.care.root.transboard;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

public class ChatSocket extends TextWebSocketHandler{
	ArrayList<WebSocketSession> auth = new ArrayList<>();
	
	@Override //클라이언트가 연결시 실행되는 메소드
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		System.out.println(session.getAttributes().get("glogin")+"님 연결되었습니다");
		auth.add(session);//세션을 추가
	}

	@Override //메세지를 받는 메소드
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		System.out.println(session.getAttributes().get("glogin")+"님 메세지 : "+message.getPayload());
		System.out.println("session : "+session.getAttributes());
		Map<String, Object> map = session.getAttributes();
		TextMessage text = new TextMessage(map.get("glogin")+" : "+message.getPayload());
		for(WebSocketSession s:auth) {
			s.sendMessage(text);//각 세션끼리 내용따로
		}
	}

	@Override //연결이 끊기면 실행됨
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		System.out.println(session.getAttributes().get("glogin")+"님 연결 해제");;
	}
}
