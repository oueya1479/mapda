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

import org.hibernate.annotations.CreationTimestamp;

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
public class MapStorage {
	
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "map_msno_seq")
	@SequenceGenerator(sequenceName = "map_msno_seq", allocationSize = 1, name = "map_msno_seq")
	private Long msNo;
	
	@ManyToOne
	@JoinColumn(name="mem_no")
	private Member member;
	
	@ManyToOne
	@JoinColumn(name="map_no")
	private Theme theme;
	
	@CreationTimestamp
	private LocalDateTime msRegdate;
//	
//	@OneToMany(mappedBy="mapStorage")
//	private List<Theme> theme;
//	
}
