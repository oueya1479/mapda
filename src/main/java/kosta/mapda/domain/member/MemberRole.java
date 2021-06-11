//package kosta.mapda.domain.member;
//
//import java.util.ArrayList;
//import java.util.List;
//
//import javax.persistence.Entity;
//import javax.persistence.GeneratedValue;
//import javax.persistence.GenerationType;
//import javax.persistence.Id;
//import javax.persistence.OneToMany;
//import javax.persistence.SequenceGenerator;
//
//import lombok.AllArgsConstructor;
//import lombok.Getter;
//import lombok.NoArgsConstructor;
//import lombok.NonNull;
//import lombok.RequiredArgsConstructor;
//import lombok.Setter;
//import lombok.ToString;
//
//@Entity
//@Getter
//@Setter
//@ToString
//@AllArgsConstructor
//@NoArgsConstructor
//@RequiredArgsConstructor
//public class MemberRole {
//	
//	@Id
//	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "mem_no_seq")
//	@SequenceGenerator(sequenceName = "mem_no_seq", allocationSize = 1, name = "mem_no_seq" )
//	private Long memNo;
//	
//	@NonNull
//	private String roleName;
//	
//	@OneToMany(mappedBy = "memRole")
//	private List<Member> list = new ArrayList<Member>();
//
//		
//	
//
//}
