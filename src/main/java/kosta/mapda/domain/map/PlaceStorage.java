package kosta.mapda.domain.map;

import java.time.LocalDateTime;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
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
public class PlaceStorage {
	
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "place_psno_seq")
	@SequenceGenerator(sequenceName = "place_psno_seq", allocationSize = 1, name = "place_psno_seq")
	private Long psNo;
	
	@ManyToOne
	@JoinColumn(name="mem_no")
	private Member member;
	
	@ManyToOne
	@JoinColumn(name="place_no")
	private Place place;
	
	@CreationTimestamp
	private LocalDateTime placeStorageRegdate;
}
