package kosta.mapda.domain.service;

import java.time.LocalDateTime;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;

import kosta.mapda.domain.Management;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
public class Event {
	
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "event_emno_seq")
	@SequenceGenerator(sequenceName = "event_emno_seq", allocationSize = 1, name = "event_emno_seq")
	private Long evNo;
	private String evTitle;
	private String evContents;
	private  LocalDateTime evStartDate;
	private LocalDateTime evEndDate; 
	private LocalDateTime evRegDate;
	private  int evStatus;
	
	@ManyToOne
	@JoinColumn(name="mng_no")
	private Management management;
}