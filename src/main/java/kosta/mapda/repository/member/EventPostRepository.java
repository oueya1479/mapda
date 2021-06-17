package kosta.mapda.repository.member;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import kosta.mapda.domain.service.EventPost;

public interface EventPostRepository extends JpaRepository<EventPost, Long> {
	
	@Query("select e from EventPost e where e.event.evNo = ?1")
	Page<EventPost> selectAllPost(Pageable pageable, Long evNo);

}
