package kosta.mapda.domain.map;

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
import javax.persistence.Transient;

import org.hibernate.annotations.CreationTimestamp;
import org.springframework.web.multipart.MultipartFile;

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
public class Place {
	
	@Transient //테이블에 컬럼으로 생성되지 않게 ....
	private List<MultipartFile> file;
	
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "PL_placeNo_seq")
	@SequenceGenerator(sequenceName = "PL_placeNo_seq",allocationSize = 1,name = "PL_placeNo_seq")
	private Long placeNo;
	
	private String placeTitle;
	private float placeLatitude;
	private float placeLongitude;
	private String placeAddr;
	private String placeContent;
	
	@CreationTimestamp
	private LocalDateTime placeRegdate;
	
	private String placeTag;
	private int placeLike;
	private int placeStar;
	private int placeHidden;	// default 1,  0 hidden 으로 전환
	private int placeIconNo;
	private String placeIconName;
	private String placeIconPath;
	private int placeStatus;
	
	//////////////////////////////////////////////////////////////////////////////////////
	
	@ManyToOne
	@JoinColumn(name = "mem_no")
	private Member member;
	
	@ManyToOne
	@JoinColumn(name = "mng_no")
	private Management management;
	
	@ManyToOne
	@JoinColumn(name = "map_no")
	private Theme theme;
	
	@OneToMany(mappedBy ="place")
	private List<PlacePhoto> photo;
	
//	@OneToMany(mappedBy = "place", cascade = CascadeType.ALL)
//	private List<PlacePhoto> ppList;		// place photo
//	
//	@OneToMany(mappedBy = "place", cascade = CascadeType.ALL)
//	private List<PlaceReview> prList;		// place reply
//
//	@OneToMany(mappedBy = "place", cascade = CascadeType.ALL)
//	private List<PlacePhotoReview> pprList;		// place photo review
//	
	
	public Place(Long placeNo) {
		this.placeNo = placeNo;
	}
}
