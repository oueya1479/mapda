package kosta.mapda.domain.service;

import java.time.LocalDateTime;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.SequenceGenerator;

import org.hibernate.annotations.CreationTimestamp;

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
public class MyPoint {

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE , generator = "mypt_no_seq")
	@SequenceGenerator(sequenceName = "mypt_no_seq", allocationSize = 1, name = "mypt_no_seq")
	private Long myptNo; // 내포인트 번호
	private int myptRem; // 잔여포인트
	private int myptPlus; // 누적포인트
	private int myptMinus; // 소멸포인트
	
	@CreationTimestamp
	private LocalDateTime myptDate; //포인트 적립 날짜
	
	@OneToOne
	@JoinColumn(name = "mem_no") //회원번호
	private Member member;
	
	@OneToOne
	@JoinColumn(name = "pt_no") //포인트번호
	private Point point;
}
