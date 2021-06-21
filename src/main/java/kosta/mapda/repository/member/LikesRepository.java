package kosta.mapda.repository.member;

import java.sql.SQLException;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import kosta.mapda.domain.member.Member;
import kosta.mapda.domain.service.EventLike;
import kosta.mapda.domain.service.EventPost;

public interface LikesRepository extends JpaRepository<EventLike, Long>{
	@Modifying
	@Query(value= "DELETE FROM EVENT_LIKE e WHERE e.EVP_NO = ?1 AND e.MEM_NO = ?2", nativeQuery = true)
	void deleteLike(EventPost eventPost, Member member);
	
	
	@Query(value="SELECT COUNT(*) FROM EVENT_LIKE e WHERE e.EVP_NO =?1 AND e.MEM_NO=?2", nativeQuery = true)
	int checkLike(EventPost eventPost, Member member);
	
	
}


