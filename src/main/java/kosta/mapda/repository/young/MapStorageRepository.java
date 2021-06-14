package kosta.mapda.repository.young;

import org.springframework.data.jpa.repository.JpaRepository;

import kosta.mapda.domain.map.MapStorage;
import kosta.mapda.domain.map.Theme;
import kosta.mapda.domain.member.Member;

public interface MapStorageRepository extends JpaRepository<MapStorage, Long> {

	MapStorage findByMemberAndTheme(Member member, Theme theme);
	
	
//	@Query("insert into Mapstorage m (m.memNo, m.mapNo) values (?1, ?2)")
//	@Modifying
//	void insertSubscribe(Long memNo, Long mapNo);
//	
//	@Query("delete m from MapStorage m where m.member.memNo = ?1 and m.theme.mapNo = ?2")
//	@Modifying
//	void deleteSubscribe(Long memNo, Long mapNo);
}
