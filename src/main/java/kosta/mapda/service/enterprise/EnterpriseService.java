package kosta.mapda.service.enterprise;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import kosta.mapda.domain.enterprise.Enterprise;
import kosta.mapda.domain.enterprise.EnterprisePost;

public interface EnterpriseService {

	/**
	 * 엔터프라이즈 리스트 가져오기
	 */
	Page<Enterprise> selectAll(Pageable pageable);
	
	/**
	 * 엔터프라이즈 프로필 정보 가져오기
	 */
	Enterprise selectEnterprise(Long memNo);
}
