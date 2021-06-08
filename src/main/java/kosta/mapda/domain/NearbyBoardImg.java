package kosta.mapda.domain;

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

@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
public class NearbyBoardImg {

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "nbimg_fno_seq")
	@SequenceGenerator(sequenceName = "nbimg_fno_seq", initialValue = 1, name = "nbimg_fno_seq")
	private Long nbimgFno;
	
	@ManyToOne
	@JoinColumn(name = "nb_no")
	private NearbyBoard nearbyBoard;
	private String nbimgFname;
	private String nbimgSrc;
	
}
