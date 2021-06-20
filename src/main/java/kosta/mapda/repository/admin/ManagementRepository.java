package kosta.mapda.repository.admin;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import kosta.mapda.domain.Management;
import kosta.mapda.domain.member.Member;

public interface ManagementRepository extends JpaRepository<Management, Long> {
	
}
