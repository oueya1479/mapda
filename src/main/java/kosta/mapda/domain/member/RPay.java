package kosta.mapda.domain.member;

import java.time.LocalDateTime;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.SequenceGenerator;

import kosta.mapda.domain.map.Theme;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class RPay {

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "rpay_rpayno_seq")
	@SequenceGenerator(sequenceName = "rpay_rpayno_seq", allocationSize = 1, name = "rpay_rpayno_seq")
	private Long rpayNo;
	private LocalDateTime rpayReqdate;
	private String rpayStatus;
	
	@OneToOne
	@JoinColumn(name="mem_no")
	private Member member;
}
