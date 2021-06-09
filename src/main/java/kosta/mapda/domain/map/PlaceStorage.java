package kosta.mapda.domain.map;

import java.time.LocalDateTime;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;

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
	@OneToMany
	@JoinColumn(name="mem_no")
	private Member member;
	
	@Id
	@OneToMany
	@JoinColumn(name="place_no")
	private Place place;
	
	@CreationTimestamp
	private LocalDateTime placeStorageRegdate;
}
