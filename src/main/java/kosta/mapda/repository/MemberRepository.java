package kosta.mapda.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import kosta.mapda.domain.member.Member;

public interface MemberRepository extends JpaRepository<Member, Long>{
	
	@Query("update Member m set m.memPaystatus = 1 where m.memNo = ?1")
	@Modifying
	void start(Long memNo);

}
