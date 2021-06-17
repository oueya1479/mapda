package kosta.mapda.domain.enterprise;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.SequenceGenerator;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class EnterpriseCategory {

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "category_cgno_seq")
	@SequenceGenerator(sequenceName = "category_cgno_seq", allocationSize = 1, name = "category_cgno_seq")
	private Long cgNo;
	private String category;
	
	@OneToMany(mappedBy = "category")
	private List<EnterprisePost> enterprisePostList;
}
