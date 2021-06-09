package kosta.mapda.domain.enterprise;

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
public class EnterprisePost {

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "enterPost_epno_seq")
	@SequenceGenerator(sequenceName = "enterPost_epno_seq", allocationSize = 1, name = "enterPost_epno_seq")
	private Long epNo;
	private String epTitle;
	private String epContent;
	private String epAddress;
	private int epLike;
	private int epHits;
	
	@CreationTimestamp
	private LocalDateTime epRegdate;
	private String epLogo;
	
	@ManyToOne
	@JoinColumn(name = "mem_no")
	private Enterprise enterprise;
	
	@ManyToOne
	@JoinColumn(name = "cg_no")
	private EnterpriseCategory category;
	
	@ManyToOne
	@JoinColumn(name = "mng_no")
	private Management management;
}
