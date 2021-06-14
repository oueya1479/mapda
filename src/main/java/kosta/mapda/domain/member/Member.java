package kosta.mapda.domain.member;

import java.time.LocalDateTime;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.SequenceGenerator;

import org.hibernate.annotations.CreationTimestamp;

import kosta.mapda.domain.map.Theme;
import kosta.mapda.domain.service.MyCoupon;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class Member {

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "mem_no_seq")
	@SequenceGenerator(sequenceName = "mem_no_seq", allocationSize = 1, name = "mem_no_seq" )
	private Long memNo;
	private String memId;
	private String memPw;
	private String memName;
	private String memAddr;
	private int memAge;
	private String memGrade;
	private String memAccount;
	private int memPaystatus;
	private int memStatus;
	private int memFollower;
	private int memFollowing;
	private String memImage;
	
	@CreationTimestamp
	private LocalDateTime memRegdate;
	
	@OneToMany(mappedBy = "mapNo")
	private List<Theme> mapList;

	@OneToMany(mappedBy = "member")
	private List<MyCoupon> myCouponList;
}
