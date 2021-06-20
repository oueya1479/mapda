package kosta.mapda.repository.admin;

import java.time.LocalDateTime;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import kosta.mapda.domain.member.Member;

public interface AdminMemberRepository extends JpaRepository<Member, Long> {
	List<Member> findAllByMemGrade(String memGrade);

	@Query("select m from Member m where m.memRegdate between ?1 and ?2")
	List<Member> getDateBetween(LocalDateTime startDatetime, LocalDateTime endDatetime);

	@Query("update Member m set m.memGrade = 'Influencer' where m.memNo = ?1")
	@Modifying
	void levelUp(Long memNo);

	@Query("update Member m set m.memGrade = 'User' where m.memNo = ?1")
	@Modifying
	void levelDown(Long memNo);

	@Query("update Member m set m.memPaystatus = 0 where m.memNo = ?1")
	@Modifying
	void cancelRpay(Long memNo);

	@Query("select m from Member m where m.memPaystatus = ?1")
	List<Member> getRegular(int paystatus);
}
