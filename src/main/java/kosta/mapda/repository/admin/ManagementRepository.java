package kosta.mapda.repository.admin;

import org.springframework.data.jpa.repository.JpaRepository;

import kosta.mapda.domain.Management;

public interface ManagementRepository extends JpaRepository<Management, Long> {
}
