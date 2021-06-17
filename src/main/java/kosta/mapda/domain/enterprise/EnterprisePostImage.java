package kosta.mapda.domain.enterprise;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Transient;

import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class EnterprisePostImage {
	
	@Transient
	private List<MultipartFile> files; 
	
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "enterImage_imageno_seq")
	@SequenceGenerator(sequenceName = "enterImage_imageno_seq", allocationSize = 1, name = "enterImage_imageno_seq")
	private Long imageNo;
	private String imageSource;
	
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "epNo")
	private EnterprisePost enterprisePost;
}
