package kosta.mapda.domain;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
public class Point {

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "pt_no_seq")
	@SequenceGenerator(sequenceName = "pt_no_seq", allocationSize = 1, name = "pt_no_seq")
	private Long ptNo; //포인트번호
	private int ptAmount; //포인트점수
	private int ptState; // 적립여부 , 0:미적립, 1: 적립
	
	@ManyToOne
	@JoinColumn(name = "mng_no") //관리번호
	private Management management;
	
	@ManyToOne
	@JoinColumn(name = "mem_no") //회원번호
	private Member member;
	
	public Point(Long ptNo) {
		this.ptNo = ptNo; 
		
	}
	
}
