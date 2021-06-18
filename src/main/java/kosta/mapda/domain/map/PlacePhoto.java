package kosta.mapda.domain.map;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Transient;

import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class PlacePhoto {	//Place_Photo
	
	@Transient //테이블에 컬럼으로 생성되지 않게 ....
	private List<MultipartFile> files;
	
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "PP_PPNo_seq")
	@SequenceGenerator(sequenceName = "PP_PPNo_seq", allocationSize = 1, name = "PP_PPNo_seq")
	private Long ppNo;
	private String ppPath;
	
	@ManyToOne(cascade = CascadeType.ALL)	//없으면 플레이스 등록 오류
	@JoinColumn(name = "place_no")
	private Place place;
	
}
