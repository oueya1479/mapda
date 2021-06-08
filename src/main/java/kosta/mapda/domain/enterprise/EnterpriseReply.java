package kosta.mapda.domain.enterprise;

import java.time.LocalDateTime;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;

import org.hibernate.annotations.UpdateTimestamp;

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
public class EnterpriseReply {

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "enterReply_erno_seq")
	@SequenceGenerator(sequenceName = "enterReply_erno_seq", allocationSize = 1, name = "enterReply_erno_seq")
	private Long erNo;
	private String erName;
	private String erContent;
	
	@UpdateTimestamp
	private LocalDateTime erRegDate;
	private int erState;
	
	@ManyToOne
	@JoinColumn(name = "epNo")
	private EnterprisePost enterprisePost;
	
	@ManyToOne
	@JoinColumn(name = "memNo")
	private Member member;
	
	@ManyToOne
	@JoinColumn(name = "mngNo")
	private Management management;
}
