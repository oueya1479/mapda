package kosta.mapda.domain.map;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;

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
public class HiddenPlace {

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "hp_no_seq")
	@SequenceGenerator(sequenceName = "hp_no_seq", allocationSize = 1, name = "hp_no_seq")
	private Long hpNo;
	
	@ManyToOne
	@JoinColumn(name="mem_no")
	private Member member;
	
	@ManyToOne
	@JoinColumn(name="place_no")
	private Place place;
}
