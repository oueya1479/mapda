package kosta.mapda.service.young;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;


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
	
}
