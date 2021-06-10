package kosta.mapda.domain.map;

import java.time.LocalDateTime;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

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
	private Long msNo;
	
	@ManyToOne
	@JoinColumn(name="mem_no")
	private Member member;
	
	@ManyToOne
	@JoinColumn(name="map_no")
	private Theme theme;
	
	@CreationTimestamp
	private LocalDateTime mapStorageRegdate;
	
}
