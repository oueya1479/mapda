package kosta.mapda.domain.service;

import java.time.LocalDateTime;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Transient;

import org.springframework.web.multipart.MultipartFile;

import kosta.mapda.domain.Management;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
public class Event {
	
	@Transient
	private MultipartFile file; 
	
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "event_emno_seq")
	@SequenceGenerator(sequenceName = "event_emno_seq", allocationSize = 1, name = "event_emno_seq")
	private Long evNo;
	private String evTitle;
	private String evContent;
	private  LocalDateTime evStartDate;
	private LocalDateTime evEndDate; 
	private LocalDateTime evRegdate;
	private  int evStatus;
    private String evImg; 
    
	@ManyToOne
	@JoinColumn(name="mng_no")
	private Management management;
}