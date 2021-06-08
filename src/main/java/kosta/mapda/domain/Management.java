package kosta.mapda.domain;

import java.time.LocalDateTime;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
public class Management {
	
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "management_mngno_seq")
	@SequenceGenerator(sequenceName = "management_mngno_seq", allocationSize = 1, name = "management_mngno_seq")
	private Long mngNo;
	private String mngBoard;
}
