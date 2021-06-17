package kosta.mapda.repository.young;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import kosta.mapda.domain.map.MapCategory;
import kosta.mapda.domain.map.Theme;

public interface MapRepository extends JpaRepository<Theme, Long> {
	/**
	 * 조회수 증가
	 */
	@Query("update Theme m set m.mapReadnum=m.mapReadnum+1 where m.mapNo=?1")
	@Modifying
	void readnumUpdate(Long mapNo);

	
	@Query("select t from Theme t where t.member.memNo=?1")
	List<Theme> selectByMemId(Long memNo);


	@Query("select t from Theme t where t.mapCategory.categoryNo=?1")
	List<Theme> selectByCategory(MapCategory category);
}
