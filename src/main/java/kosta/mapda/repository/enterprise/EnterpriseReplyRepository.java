package kosta.mapda.repository.enterprise;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import kosta.mapda.domain.enterprise.EnterpriseReply;

public interface EnterpriseReplyRepository extends JpaRepository<EnterpriseReply, Long> {

	@Query("SELECT e FROM EnterpriseReply e WHERE ep_no = ?1")
	List<EnterpriseReply> getReply(Long epNo);

	@Query("select count(e) from EnterpriseReply e where e.erRegdate between ?1 and ?2")
	int getReplyDateBetween(LocalDateTime startDatetime, LocalDateTime endDatetime);
}