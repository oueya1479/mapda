package kosta.mapda.domain.map;

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
@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
public class Map {
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "map_mapno_seq")
	@SequenceGenerator(sequenceName = "map_mapno_seq", allocationSize = 1, name = "map_mapno_seq")
	private Long mapNo;
	
	private String mapTitle;
	private String mapContent;
	private String mapImg;
	private String mapImgPath;
	private int mapSubQty;
	private int mapReadNum;
	private int mapLike;
	
	@CreationTimestamp
	private LocalDateTime mapRegDate;
	
	private int mapStatus;
	private int mapIsOpen;
	
	@ManyToOne
	@JoinColumn(name="mng_no")
	private Management management;
	
	@ManyToOne
	@JoinColumn(name="category_no")
	private MapCategory mapCategory;
	
	@ManyToOne
	@JoinColumn(name="mem_no")
	private Member member;
	

}
