package kosta.mapda.domain.member;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.SequenceGenerator;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Entity
@Getter
@Setter
//@ToString
@AllArgsConstructor
@NoArgsConstructor
@RequiredArgsConstructor
public class MemberRole {
	
	@Id
	@GeneratedValue
	@Column(name = "role_no")
	private Long roleNo;
	
	@NonNull
	private String roleName;
	
	@ManyToOne
	@JoinColumn(name="mem_No")
	private Member member;

		
	

}
