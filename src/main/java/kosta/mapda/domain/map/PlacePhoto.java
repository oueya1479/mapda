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

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class PlacePhoto {	//Place Photo
	
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "PP_PPNo_seq")
	@SequenceGenerator(sequenceName = "PP_PPNo_seq", allocationSize = 1, name = "PP_PPNo_seq")
	private Long ppNo;
	private String ppPath;
	
	@ManyToOne
	@JoinColumn(name = "place_no")
	private Place place;
	
}
