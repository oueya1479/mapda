package kosta.mapda.domain.map;

import java.time.LocalDateTime;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

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
	private Long psNo;
	
	@ManyToOne
	@JoinColumn(name="memNo")
	private Member member;
	
	
	@ManyToOne
	@JoinColumn(name="placeNo")
	private Place place;
	
	@CreationTimestamp
	private LocalDateTime placeStorageRegdate;
}
