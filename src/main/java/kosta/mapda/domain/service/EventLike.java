package kosta.mapda.domain.service;

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
public class EventLike {
	
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "event_elno_seq")
	@SequenceGenerator(sequenceName = "event_elno_seq", allocationSize = 1, name = "event_elno_seq")
	private Long elNo;
	
	@ManyToOne
	@JoinColumn(name = "evp_no")
	private EventPost eventPost;
	
	@ManyToOne
	@JoinColumn(name = "mem_no")
	private Member member;
}
