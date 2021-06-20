package kosta.mapda.repository.young;

import java.time.LocalDateTime;
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

	
	@Query("select t from Theme t where t.member.memNo=?1")
	List<Theme> selectByMemId(Long memNo);

	/**
	 * 카테고리 별 지도 검색
	 */
	@Query("select t from Theme t where t.mapCategory.categoryNo=?1")
	List<Theme> selectByCategory(Long categoryNo);

	/**
	 * 키워드 별 지도 검색
	 */
	@Query("select t from Theme t where t.mapTitle like %?1% or t.mapContent like %?1%")
	List<Theme> selectByKeyWord(String keyWord);

	/**
	 * 키워드 + 카테고리 검색
	 */
	@Query("select t from Theme t where t.mapTitle like %?1% or t.mapContent like %?1% and t.mapCategory.categoryNo=?2")
	List<Theme> selectByKeyAndCategory(String keyWord, Long categoryNo);
	
	/**
	 * 최근 테마지도 리스트_김성희
	 * */
	@Query("select t from Theme t where t.member.memNo=?1 order by t.mapRegdate desc")
	List<Theme> selectByMemNoOrderRegDesc(Long memNo);

  /**
	 * 조회수 10위 지도 목록
	 */
	@Query("select t from Theme t order by t.mapReadnum desc")
	List<Theme> selectByRead();

	@Query("select count(t) from Theme t where t.mapRegdate between ?1 and ?2")
	int getThemeDateBetween(LocalDateTime startDatetime, LocalDateTime endDatetime);
}
