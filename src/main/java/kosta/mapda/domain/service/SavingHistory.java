package kosta.mapda.domain.service;

import java.time.LocalDateTime;

import javax.annotation.Generated;
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

@Entity
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class SavingHistory {

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "sh_no_seq")
	@SequenceGenerator(sequenceName = "sh_no_seq", allocationSize = 1, name = "sh_no_seq")
	private Long shNo;
	private String shWhere;
	private int shPay;
	
	@CreationTimestamp
	private LocalDateTime shWhen;
	
	@ManyToOne
	@JoinColumn(name = "mem_no")
	private MyPoint myPoint;
	
	
}
