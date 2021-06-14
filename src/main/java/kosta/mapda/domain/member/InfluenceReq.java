package kosta.mapda.domain.member;

import java.time.LocalDateTime;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.SequenceGenerator;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
@Entity
@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
public class InfluenceReq {

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "influencer_irno_seq")
	@SequenceGenerator(sequenceName = "influencer_irno_seq", allocationSize = 1, name = "influencer_irno_seq")
	private Long irNo;
	private LocalDateTime irReqdate;
	private String irStatus;
	
	@OneToOne
	@JoinColumn(name="mem_no")
	private Member member;
	
}
