package kosta.mapda.domain.map;

import java.time.LocalDateTime;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.SequenceGenerator;

import org.hibernate.annotations.CreationTimestamp;
import org.springframework.format.annotation.DateTimeFormat;

import kosta.mapda.domain.Management;
import kosta.mapda.domain.member.Member;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class PlacePhotoReview {	// Place_Photo_Review
	
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "PPR_PPRNo_seq")
	@SequenceGenerator(sequenceName = "PPR_PPRNo_seq", allocationSize = 1, name = "PPR_PPRNo_seq")
	private Long pprNo;
	
	private String pprContent;
	
	@CreationTimestamp
	@DateTimeFormat(pattern = "yyyy-MM-dd hh:mm:ss")
	private LocalDateTime pprRegdate;
	
	private int pprStar;
	private int pprStatus;
	
	@ManyToOne
	@JoinColumn(name = "placeNo")
	private Place place;
	
	@ManyToOne
	@JoinColumn(name = "memNo")
	private Member member;
	
	@ManyToOne
	@JoinColumn(name = "mngNo")
	private Management mng;
	
	//@JsonIgnore
	@OneToMany(mappedBy = "ppr", cascade = CascadeType.ALL)
	private List<PlacePhotoReviewPhoto> pprpList;	// place photo review photo
	
}
