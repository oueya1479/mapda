package kosta.mapda.domain.enterprise;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

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
public class Enterprise {

	@Id
	@GeneratedValue
	@Column(name = "mem_no")
	private Long memNo;
	private String entName;
	private String entTag;
	private String entLike;
	private String entHits;
	private String entContent;
	
	@OneToOne
	@JoinColumn(name = "mem_no")
	private Member member;
	
	@OneToMany(mappedBy = "epNo")
	private List<EnterprisePost> enterprisePostList = new ArrayList<EnterprisePost>();
}
