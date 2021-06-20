package kosta.mapda.service.young;


import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import kosta.mapda.domain.map.MapStorage;
import kosta.mapda.domain.map.Place;
import kosta.mapda.domain.map.Theme;
import kosta.mapda.domain.member.Member;

public interface MapService {

	/**
	 * 등록
	 */
	void insertMap(Theme theme);

	/**
	 * 전체검색
	 */
	Page<Theme> selectAll();

	/**
	 * 전체검색 - 페이징처리
	 */
	Page<Theme> selectAll(Pageable pageable);

	/**
	 * 상세보기
	 */
	Theme selectBy(Long mapNo, boolean b);

	/**
	 * 수정폼
	 */
	Theme modifyMap(Theme theme);

	/**
	 * 삭제
	 */
	void deleteMap(Long mapNo);

	/**
	 * 구독 상태 체크
	 */
	MapStorage subcheck(Long memNo, Long mapNo);
	
	/**
	 * 구독 테이블에 인서트
	 */
	void insertSubscribe(Long memNo, Long MapNo);

	/**
	 * 구독 테이블에 삭제
	 */
	void deleteSubscribe(Long memNo, Long MapNo);

	/**
	 * 로그인한 회원이 등록한 지도 목록 보기
	 */
	List<Theme> myMaps(Long memNo);

	/**
	 * 로그인한 회원의 MapStorage가져오기
	 */
	List<MapStorage> selectByMapNo(Long memNo);

	/**
	 * 비밀번호 평문화 위한 메소드
	 */
	Member findInform(String memId);

	/**
	 * 카테고리 별 지도 검색
	 */
	List<Theme> selectByCategory(Long categoryNo);
	
	/**
	 * 키워드로 지도 검색
	 */
	List<Theme> selectByKeyWord(String keyWord);
	
	/**
	 * 키워드로 + 카테고리 검색
	 */
	List<Theme> selectByKeyAndCategory(String keyWord, Long categoryNo);

	/**
	 * 조회수로 지도 출력
	 */
	List<Theme> mainList();

	
}
