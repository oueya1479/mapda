package kosta.mapda.service.young;


import java.util.List;
import java.util.Map;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import kosta.mapda.domain.map.MapStorage;
import kosta.mapda.domain.map.Theme;

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
	void deleteMap(Long mapNo, String password);

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

	

}
