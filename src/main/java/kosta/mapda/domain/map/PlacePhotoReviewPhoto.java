package kosta.mapda.domain.map;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;

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
	
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "PPRP_PPRPNo_seq")
	@SequenceGenerator(sequenceName = "PPRP_PPRPNo_seq", allocationSize = 1, name = "PPRP_PPRPNo_seq")
	private Long pprpNo;
	private String pprpPath;
	
	@ManyToOne
	@JoinColumn(name = "ppr_no")
	private PlacePhotoReview ppr;
	
}
