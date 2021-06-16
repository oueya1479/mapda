package kosta.mapda.repository.young;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import kosta.mapda.domain.map.MapStorage;
import kosta.mapda.domain.map.Theme;
import kosta.mapda.domain.member.Member;

public interface MapStorageRepository extends JpaRepository<MapStorage, Long> {

	@Query("select m from MapStorage m where m.member.memNo = ?1 and m.theme.mapNo = ?2")
	MapStorage findStorage(Long memNo, Long mapNo);


	@Modifying
	@Query("delete from MapStorage m where m.member.memNo = ?1 and m.theme.mapNo = ?2")
	void deleteSub(Long memNo, Long mapNo);
	
	
//	@Query("insert into Mapstorage m (m.memNo, m.mapNo) values (?1, ?2)")
//	@Modifying
//	void insertSubscribe(Long memNo, Long mapNo);
//	
//	@Query("delete m from MapStorage m where m.member.memNo = ?1 and m.theme.mapNo = ?2")
//	@Modifying
//	void deleteSubscribe(Long memNo, Long mapNo);
}
