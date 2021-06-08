package kosta.mapda.domain;

import java.time.LocalDateTime;

import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

public class Message {

	private Long msgNo; //메시지번호
	private String msgTitle; //메시지제목
	private String msgContent; // 메시지내용
	
	private LocalDateTime msgDate; //메시지 등록날짜
	private int msgState; //메시지상태
	
	@ManyToOne
	@JoinColumn(name = "mem_no") //회원번호
	private Member member;
}
