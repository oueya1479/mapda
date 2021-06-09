package kosta.mapda.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import kosta.mapda.domain.enterprise.EnterprisePost;

public interface EnterprisePostRepository extends JpaRepository<EnterprisePost, Long> {

}