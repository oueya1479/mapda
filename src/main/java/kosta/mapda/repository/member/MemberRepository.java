package kosta.mapda.repository.member;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import kosta.mapda.domain.member.Member;

public interface MemberRepository extends JpaRepository<Member, Long> {
	
	@Query("select m from Member m where m.memId=?1 and m.memPw=?2")
	Member login(String memId, String memPw);

	@Query("update Member m set m.memPaystatus = 1 where m.memNo = ?1")
	@Modifying
	void start(Long memNo);
}
