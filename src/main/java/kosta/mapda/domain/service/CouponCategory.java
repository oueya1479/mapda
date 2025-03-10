package kosta.mapda.domain.service;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.SequenceGenerator;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
public class CouponCategory {

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "cpca_no_seq")
	@SequenceGenerator(sequenceName = "cpca_no_seq", allocationSize = 1, name = "cpca_no_seq")
	private Long cpcaNo; //쿠폰카테고리번호
	
	private String cpcaName; //쿠폰카테고리명
	
	public CouponCategory(Long cpcaNo) {
		this.cpcaNo = cpcaNo;
	}
	
	@OneToMany(mappedBy = "couponCategory")
	private List<Coupon> couponList;
	
	
	
	
}
