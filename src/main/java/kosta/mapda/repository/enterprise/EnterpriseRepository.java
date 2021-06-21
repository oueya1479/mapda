package kosta.mapda.repository.enterprise;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import kosta.mapda.domain.enterprise.Enterprise;

public interface EnterpriseRepository extends JpaRepository<Enterprise, Long> {

	Enterprise findByEntName(String entName);

}
