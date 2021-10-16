package springweb.z02_util;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

@Component("chatHandler") // Dispatcher에서 지정한 핸들러명과 Mapping
public class A02_ChattingHandler extends TextWebSocketHandler {
	
	// 전역변수로 접속한 SocketSession을 누적할 수 있게 선언 key == 세션ID,
	// Value Object는 WebSocketSession로 처리할 수 있게 Map 객체로 선언
	private Map<String, WebSocketSession> users = new ConcurrentHashMap();

	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		// TODO Auto-generated method stub
		super.afterConnectionEstablished(session);
		System.out.println(session.getId() + " 님 접속했습니다.");
		// 접속할때마다 session을 누적 처리
		users.put(session.getId(), session);
	}
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		// TODO Auto-generated method stub
		super.handleTextMessage(session, message);
		System.out.println(session.getId() + " 님이 보낸 메세지 : " + message.getPayload());
		// 접속할 client들에게 메세지 전송
		for(WebSocketSession ws : users.values()) {
			ws.sendMessage(message); // => Client에서 onMessage로 받음
		}
	}	
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		// TODO Auto-generated method stub
		super.afterConnectionClosed(session, status);
		System.out.println(session.getId() + " 님이 접속을 종료했습니다.");
		// 접속이 종료된 session은 삭제 처리
		users.remove(session.getId());
	}

	@Override
	public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
		// TODO Auto-generated method stub
		super.handleTransportError(session, exception);
		System.out.println(session.getId() + " 님, 오류가 발생했습니다. \n 오류 코드 : " + exception.getMessage());
	}

}