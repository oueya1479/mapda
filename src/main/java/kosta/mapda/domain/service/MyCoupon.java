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
public class MyCoupon {

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "mycp_no_seq")
	@SequenceGenerator(sequenceName = "mycp_no_seq", allocationSize = 1, name = "mycp_no_seq")
	private Long mycpNo; //내쿠폰번호
	
	private String barcoImg; //바코드이미지
	private String barcoImgPath; //바코드 이미지 경로
	private int barcoNo; //바코드번호
	
	@CreationTimestamp
	private LocalDateTime mycpDate; //쿠폰 발급날짜
	private int mycpState; //내쿠폰상태
	
	@OneToOne
	@JoinColumn(name = "cp_no")//쿠폰번호
	private Coupon coupon;
	
	@ManyToOne
	@JoinColumn(name = "mem_no") //회원번호
	private Member member;
	
}
