package kosta.mapda.domain;

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

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
public class EventMember {

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "event_emno_seq")
	@SequenceGenerator(sequenceName = "event_emno_seq", allocationSize = 1, name = "event_emno_seq")
	private Long emNo;
	private String emId;
	private int emPoint;
	private int emState;

	@CreationTimestamp
	private LocalDateTime emDate;

	@OneToMany(mappedBy = "mem_no")
	private List<Member> member;

	@ManyToOne
	@JoinColumn(name="ev_no")
	private Event event;
}
