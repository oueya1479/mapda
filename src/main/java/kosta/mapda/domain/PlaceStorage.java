package kosta.mapda.domain;

import java.time.LocalDateTime;

import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

import org.hibernate.annotations.CreationTimestamp;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class PlaceStorage {
	
	@OneToOne
	@JoinColumn(name="mem_no")
	private Member member;
	
	@OneToMany
	@JoinColumn(name="place_no")
	private Place place;
	
	@CreationTimestamp
	private LocalDateTime placeStorageRegdate;
}
