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
import javax.persistence.Table;
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
@Table(name="Map")
@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
public class Theme{
	
	
	@Transient//테이블에 컬럼으로 생성되지 않게 하기 위한 어노테이션
	private MultipartFile file; 
	
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "map_mapno_seq")
	@SequenceGenerator(sequenceName = "map_mapno_seq", allocationSize = 1, name = "map_mapno_seq")
	private Long mapNo;
	
	private String mapTitle;
	private String mapContent; 
	private String mapImg;
	private String mapImgPath;
	private int mapSubQty;
	private int mapReadnum;
	private int mapLike;
	
	@CreationTimestamp
	private LocalDateTime mapRegdate;
	
	private int mapStatus;
	private int mapIsopen;
	
	@ManyToOne
	@JoinColumn(name="mng_no")
	private Management management;
	
	@ManyToOne
	@JoinColumn(name="category_no")
	private MapCategory mapCategory;
	
	@ManyToOne
	@JoinColumn(name="mem_no")
	private Member member;
	
	@OneToMany(mappedBy="theme")
	private List<Place> place;
	
	@OneToMany(mappedBy="theme")
	private List<MapStorage> mapStorage;

	public Theme(Long mapNo) {
		this.mapNo = mapNo;
	}

}
