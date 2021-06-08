package kosta.mapda.domain.map;

import java.time.LocalDateTime;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.SequenceGenerator;

import org.hibernate.annotations.CreationTimestamp;

import kosta.mapda.domain.Management;
import kosta.mapda.domain.member.Member;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class PlacePhotoReview {	// Place Photo Review
	
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "PPR_PPRNo_seq")
	@SequenceGenerator(sequenceName = "PPR_PPRNo_seq", allocationSize = 1, name = "PPR_PPRNo_seq")
	private Long pprNo;
	
	private String pprContent;
	
	@CreationTimestamp
	private LocalDateTime pprRegDate;
	
	private int pprStar;
	private int pprStatus;
	
	@ManyToOne
	@JoinColumn(name = "place_no")
	private Place place;
	
	@ManyToOne
	@JoinColumn(name = "mem_no")
	private Member member;
	
	@ManyToOne
	@JoinColumn(name = "mng_no")
	private Management mng;
	
	@OneToMany(mappedBy = "ppr", cascade = CascadeType.ALL)
	private List<PlacePhotoReviewPhoto> pprpList;	// place photo review photo
	
}
