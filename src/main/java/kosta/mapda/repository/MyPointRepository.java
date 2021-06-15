package kosta.mapda.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import kosta.mapda.domain.member.Member;
import kosta.mapda.domain.service.MyPoint;

public interface MyPointRepository extends JpaRepository<MyPoint, Long> {

	//MyPoint findbymember(Member member);
}
