package kosta.mapda.domain;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.SequenceGenerator;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class Member {

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "mem_no_seq")
	@SequenceGenerator(sequenceName = "mem_no_seq", allocationSize = 1, name = "mem_no_seq" )
	private Long memNo;
	private String memId;
	private int memPw;
	private String memName;
	private String memAddr;
	private int memAge;
	private int memGrade;
	private int memAccount;
	private int memStatus;
	private int memFollower;
	private int memFollowing;
	private String memImage;
	
	@CreationTimestamp
	private LocalDateTime memRegDate;
	
//	@OneToMany(mappedBy = "member")
//	private List<Map> list = new ArrayList<Map>();

}
