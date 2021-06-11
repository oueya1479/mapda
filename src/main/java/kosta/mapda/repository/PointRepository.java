package kosta.mapda.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import kosta.mapda.domain.service.MyPoint;

public interface PointRepository extends JpaRepository<MyPoint, Long> {

}
