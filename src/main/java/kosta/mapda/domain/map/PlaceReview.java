package kosta.mapda.domain.map;

import java.time.LocalDateTime;

import javax.persistence.Entity;
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

@Entity
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
	private LocalDateTime prRegdate;
	private int prStatus;
	
	@ManyToOne
	@JoinColumn(name="placeNo")
	private Place place;
	
	@ManyToOne
	@JoinColumn(name = "memNo")
	private Member member;
	
	@ManyToOne
	@JoinColumn(name = "mngNo")
	private Management mng;
}
