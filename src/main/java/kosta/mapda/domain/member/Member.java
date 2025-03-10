package kosta.mapda.domain.member;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.MapsId;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.SequenceGenerator;

import org.hibernate.annotations.CreationTimestamp;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import kosta.mapda.domain.map.PlaceStorage;
import kosta.mapda.domain.map.MapStorage;
import kosta.mapda.domain.map.Place;
import kosta.mapda.domain.map.PlacePhotoReview;
import kosta.mapda.domain.map.Theme;
import kosta.mapda.domain.service.MyCoupon;
import kosta.mapda.domain.service.MyPoint;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class Member implements UserDetails{

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
	
	
	
	@OneToMany(mappedBy = "mapNo", fetch = FetchType.EAGER)
	private List<Theme> mapList;
	
	@OneToMany(mappedBy = "member")
	private List<Place> myPlaceList;
	
	@OneToMany(mappedBy = "member")
	private List<PlacePhotoReview> myPhotoReviewList;

	@OneToMany(mappedBy = "member")
	private List<MyCoupon> myCouponList;
	
	@OneToMany(mappedBy = "member")
	private List<MapStorage> mapStorageList;
	
	@OneToMany(mappedBy="member")
	private List<PlaceStorage> placeStorageList;
	
	@OneToOne(mappedBy = "member")
	private MyPoint myPoint;
	
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		List<GrantedAuthority> auth = new ArrayList<GrantedAuthority>();
 
		if (this.memGrade.equals("User")) {
			auth.add(new SimpleGrantedAuthority("ROLE_USER"));
		} else if (this.memGrade.equals("Enterprise")) {
			auth.add(new SimpleGrantedAuthority("ROLE_USER"));
			auth.add(new SimpleGrantedAuthority("ROLE_ENTERPRISE"));
		} else if(this.memGrade.equals("Influencer")) {
			auth.add(new SimpleGrantedAuthority("ROLE_USER"));
			auth.add(new SimpleGrantedAuthority("ROLE_INFLUENCER"));
		} else if(this.memGrade.equals("Admin")) {
			auth.add(new SimpleGrantedAuthority("ROLE_USER"));
			auth.add(new SimpleGrantedAuthority("ROLE_INFLUENCER"));
			auth.add(new SimpleGrantedAuthority("ROLE_ENTERPRISE"));
			auth.add(new SimpleGrantedAuthority("ROLE_ADMIN"));
		}
		return auth;
	}

	@Override
	public String getPassword() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String getUsername() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean isAccountNonExpired() {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean isAccountNonLocked() {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean isEnabled() {
		// TODO Auto-generated method stub
		return false;
	}
	
	
	public Member(Long memNo) {
		this.memNo = memNo;
	}
}
