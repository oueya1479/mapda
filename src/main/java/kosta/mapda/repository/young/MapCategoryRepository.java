package kosta.mapda.repository.young;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import kosta.mapda.domain.map.MapCategory;

public interface MapCategoryRepository extends JpaRepository<MapCategory, Long> {

	@Query("select m from MapCategory m where m.categoryNo = ?1")
	MapCategory getByCategory(Long categoryNo);
}
