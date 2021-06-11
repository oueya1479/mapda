package kosta.mapda.domain.service;

import java.time.LocalDateTime;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;

import kosta.mapda.domain.member.Member;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
public class Message {

	
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "msg_no_seq")
	@SequenceGenerator(sequenceName = "msg_no_seq", allocationSize = 1, name = "msg_no_seq")
	private Long msgNo; //메시지번호
	private String msgTitle; //메시지제목
	private String msgContent; // 메시지내용
	
	private LocalDateTime msgDate; //메시지 등록날짜
	private int msgState; //메시지상태
	
	@ManyToOne
	@JoinColumn(name = "mem_no") //회원번호
	private Member member;
}
