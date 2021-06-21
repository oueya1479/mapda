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
import javax.persistence.OneToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Transient;

import org.hibernate.annotations.NotFound;
import org.hibernate.annotations.NotFoundAction;
import org.springframework.web.multipart.MultipartFile;

import kosta.mapda.domain.enterprise.Enterprise;
import kosta.mapda.domain.member.Member;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Entity
@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
public class Coupon {
	
	@Transient
	private MultipartFile file;

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "cp_no_seq")
	@SequenceGenerator(sequenceName = "cp_no_seq", allocationSize = 1, name = "cp_no_seq")
	private Long cpNo; //쿠폰번호
	
	private String cpName; //쿠폰명
	private String cpPlace; //쿠폰이용매장
	private String cpImgpath; //쿠폰이미지 경로
	private Integer cpPrice; //쿠폰가격
	private String cpDetail; //쿠폰설명
	private String cpUsingdetail; //사용유의사항
	private Integer cpState; //쿠폰 발급상태 (0:발급중단, 1: 발급가능)
	
	@ManyToOne
	@JoinColumn(name = "mem_no") //회원번호
	@NotFound(action=NotFoundAction.IGNORE)
	private Enterprise member;
	
	@ManyToOne
	@JoinColumn(name = "cpca_no") //카테고리번호
	private CouponCategory couponCategory;
	
	public Coupon(Long cpNo) {
		this.cpNo = cpNo;
	}
	
}
