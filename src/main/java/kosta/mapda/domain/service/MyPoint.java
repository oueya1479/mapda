package kosta.mapda.domain.service;

import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.MapsId;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.SequenceGenerator;

import org.hibernate.annotations.CreationTimestamp;

import kosta.mapda.domain.member.Member;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor       
public class MyPoint{
	
	@Id
	private Long memNo;
	
	@MapsId
	@OneToOne
	@JoinColumn(name="mem_no")
	private Member member;

	private int myPoint;
		
	@OneToMany(mappedBy = "myPoint")
	private List<MyPoint> myPointList;
	
	@OneToMany(mappedBy = "myPoint")
	private List<SavingHistory> savingHistoryList;
	
	@OneToMany(mappedBy = "myPoint")
	private List<UsingHistory> usingHistoryList; 

}
