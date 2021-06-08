package kosta.mapda.domain.map;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class MapCategory {
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "mapcategory_ctgrno_seq")
	@SequenceGenerator(sequenceName = "mapcategory_ctgrno_seq", allocationSize = 1, name = "mapcategory_ctgrno_seq")
	private Long CategoryNo;
	private String CategoryName;

}
