package kosta.mapda.domain.service;

import java.time.LocalDateTime;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
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
public class Coupon {

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "cp_no_seq")
	@SequenceGenerator(sequenceName = "cp_no_seq", allocationSize = 1, name = "cp_no_seq")
	private Long cpNo; //쿠폰번호
	
	private String cpName; //쿠폰명
	private String cpPlace; //쿠폰이용매장
	private String cpImg; //쿠폰이미지
	private String cpImgPath; //쿠폰이미지 경로
	private int cpPrice; //쿠폰가격
	private String cpDetail; //쿠폰설명
	private String cpUsingDetail; //사용유의사항
	private int cpState; //쿠폰 발급상태 (0:발급중단, 1: 발급가능)
	
	@ManyToOne
	@JoinColumn(name = "mem_no") //회원번호
	private Member member;
	
	@ManyToOne
	@JoinColumn(name = "cpca_no") //카테고리번호
	private CouponCategory couponCategory;
	
	public Coupon(Long cpNo) {
		this.cpNo = cpNo;
	}
	
}
