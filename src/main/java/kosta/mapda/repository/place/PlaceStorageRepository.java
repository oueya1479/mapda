package kosta.mapda.repository.place;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import kosta.mapda.domain.map.PlaceStorage;

public interface PlaceStorageRepository extends JpaRepository<PlaceStorage, Long> {

	@Query("select m from PlaceStorage m where m.place.placeNo =?1 and m.member.memNo =?2")
	PlaceStorage findStorage(Long placeNo, Long memNo);

	@Modifying
	@Query("delete from PlaceStorage m where m.place.placeNo =?1 and m.member.memNo =?2")
	void deleteSub(Long placeNo, Long memNo);
	
	@Query("select m from PlaceStorage m where m.member.memNo=?1 order by m.place.placeRegdate DESC")
	List<PlaceStorage> selectByMemPlace(Long memNo);
	
	@Query("select m from PlaceStorage m where m.member.memNo=?1 order by m.place.placeRegdate DESC")
	Page<PlaceStorage> selectByMemPage(Long memNo, Pageable pageable);
}
