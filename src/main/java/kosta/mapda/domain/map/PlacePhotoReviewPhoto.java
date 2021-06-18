package kosta.mapda.domain.map;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Transient;

import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class PlacePhotoReviewPhoto {	//Place_Photo_Review_Photo
	
	@Transient	//테이블 컬럼으로 생성되지 않게..
	private List<MultipartFile> files;
	
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "PPRP_PPRPNo_seq")
	@SequenceGenerator(sequenceName = "PPRP_PPRPNo_seq", allocationSize = 1, name = "PPRP_PPRPNo_seq")
	private Long pprpNo;
	
	private String pprpPath;
	
	@JsonIgnore	//이거
	@ManyToOne//(cascade = CascadeType.MERGE)//이거는 해야하는거야 말아야하는거야
	@JoinColumn(name = "ppr_no")
	private PlacePhotoReview ppr;
	
}
