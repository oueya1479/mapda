package kosta.mapda.repository.young;

import java.util.List;

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
	
	/**
	 * 마이페이지 - 나의 게시 맵 조회 (마이포인트 메뉴에서 사용목적)
	 * */
	List<Theme> findBymember_memNo(Long memNo);
}
