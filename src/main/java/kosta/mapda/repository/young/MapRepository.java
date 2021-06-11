package kosta.mapda.repository.young;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import kosta.mapda.domain.map.Theme;

public interface MapRepository extends JpaRepository<Theme, Long> {
	/**
	 * 조회수 증가
	 */
	@Query("update Theme m set m.mapReadnum=m.mapReadnum+1 where m.mapNo=?1")
	@Modifying
	void readnumUpdate(Long mapNo);
}
