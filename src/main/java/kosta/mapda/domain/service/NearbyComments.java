package kosta.mapda.domain.service;

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
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class NearbyComments {

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "nc_no_seq")
	@SequenceGenerator(sequenceName = "nc_no_seq", initialValue = 1, name = "nc_no_seq")
	private Long ncNo;
	@ManyToOne
	@JoinColumn(name = "nb_no")
	private NearbyBoard nbBoard;
	@ManyToOne
	@JoinColumn(name = "mng_no")
	private Management management;
	private String ncContent;
	@CreationTimestamp
	private LocalDateTime ncRegdate;
	private int ncStatus;
}
