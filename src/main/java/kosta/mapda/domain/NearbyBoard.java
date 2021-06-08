package kosta.mapda.domain;

import java.time.LocalDateTime;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;

import org.hibernate.annotations.CreationTimestamp;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class NearbyBoard {

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "nb_nbno_seq")
	@SequenceGenerator(sequenceName = "nb_nbno_seq", initialValue = 1, name = "nb_nbno_seq")
	private Long nbNo;
	
	@ManyToOne
	@JoinColumn(name="mem_no")
	private Member member;
	
	@ManyToOne
	@JoinColumn(name = "mng_no")
	private Management management;
	
	private String nbCategory;
	private String nbTitle;
	private String nbContent;
	private int nbLikes;
	
	@CreationTimestamp
	private LocalDateTime nbRegdate;
	private int nbStatus;
	
}
