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

import org.hibernate.annotations.CreationTimestamp;
import org.springframework.web.multipart.MultipartFile;

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
public class EventPost {
	
	@Transient
	private MultipartFile file; 
	
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "evp_evpno_seq")
	@SequenceGenerator(sequenceName = "evp_evpno_seq", allocationSize = 1, name = "evp_evpno_seq")
	private Long evpNo;
	private String evpTitle;
	private String evpContent;
	private String evpImg;
	private int evpLikes;
	
	@CreationTimestamp
	private LocalDateTime evpRegdate;
	
	@ManyToOne
	@JoinColumn(name = "ev_no")
	private Event event;
	
	@ManyToOne
	@JoinColumn(name = "mem_no")
	private Member member;
}
