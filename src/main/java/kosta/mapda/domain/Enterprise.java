package kosta.mapda.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class Enterprise {

	@Id
	@GeneratedValue
	@Column(name = "mem_no")
	private Member member;
	private String entName;
	private String entTag;
	private String entLike;
	private String entHits;

}
