package kosta.mapda.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import kosta.mapda.domain.member.Member;
import kosta.mapda.domain.service.MyPoint;
import kosta.mapda.domain.service.SavingHistory;
import kosta.mapda.domain.service.UsingHistory;

public interface UsingHistoryRepository extends JpaRepository<UsingHistory, Long> {

	List<UsingHistory> findBymyPoint_memNo(Long memNo);
}
