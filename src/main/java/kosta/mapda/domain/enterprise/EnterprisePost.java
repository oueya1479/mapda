package kosta.mapda.domain.enterprise;

import java.time.LocalDateTime;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.SequenceGenerator;
import javax.persistence.Transient;

import org.hibernate.annotations.CreationTimestamp;
import org.springframework.web.multipart.MultipartFile;

import kosta.mapda.domain.Management;
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
	
	@Transient
	private MultipartFile file; 

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "enterPost_epno_seq")
	@SequenceGenerator(sequenceName = "enterPost_epno_seq", allocationSize = 1, name = "enterPost_epno_seq")
	private Long epNo;
	private String epTitle;
	private String epTag;
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
	
	@OneToMany(mappedBy = "enterprisePost", cascade = CascadeType.ALL)
	private List<EnterprisePostImage> imageList;
}