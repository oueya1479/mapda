package kosta.mapda.domain.map;

import java.time.LocalDateTime;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;

import org.hibernate.annotations.CreationTimestamp;

import kosta.mapda.domain.Management;
import kosta.mapda.domain.member.Member;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class PlaceReview {	// Place Review
	
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "PR_PRNo_seq")
	@SequenceGenerator(sequenceName = "PR_PRNo_seq",allocationSize = 1,name = "PR_PRNo_seq")
	private Long prNo;
	private String prContent;
	
	@CreationTimestamp
	private LocalDateTime prRegDate;
	private int prStatus;
	
	@ManyToOne
	@JoinColumn(name="place_no")
	private Place place;
	
	@ManyToOne
	@JoinColumn(name = "mem_no")
	private Member member;
	
	@ManyToOne
	@JoinColumn(name = "mng_no")
	private Management mng;
}
