package kosta.mapda.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import kosta.mapda.domain.service.SavingHistory;

public interface SavingHistoryRepository extends JpaRepository<SavingHistory, Long> {

	List<SavingHistory> findBymyPoint_memNo(Long memNo);
}
