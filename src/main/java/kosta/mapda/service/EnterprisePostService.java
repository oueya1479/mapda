package kosta.mapda.service;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import kosta.mapda.domain.enterprise.Enterprise;
import kosta.mapda.domain.enterprise.EnterprisePost;

public interface EnterprisePostService {

	/**
	 * 엔터프라이즈 포스트 리스트 가져오기
	 */
	Page<EnterprisePost> selectAll(Pageable pageable);
}
