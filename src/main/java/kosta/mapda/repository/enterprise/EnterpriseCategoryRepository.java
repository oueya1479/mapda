package kosta.mapda.repository.enterprise;

import org.springframework.data.jpa.repository.JpaRepository;

import kosta.mapda.domain.enterprise.EnterpriseCategory;

public interface EnterpriseCategoryRepository extends JpaRepository<EnterpriseCategory, Long> {

}
