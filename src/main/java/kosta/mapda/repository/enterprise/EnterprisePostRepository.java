package kosta.mapda.repository.enterprise;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import kosta.mapda.domain.enterprise.EnterprisePost;

public interface EnterprisePostRepository extends JpaRepository<EnterprisePost, Long> {

	@Query("select count(e) from EnterprisePost e where e.epRegdate between ?1 and ?2")
	int getEnterpriseDateBetween(LocalDateTime startDatetime, LocalDateTime endDatetime);

}