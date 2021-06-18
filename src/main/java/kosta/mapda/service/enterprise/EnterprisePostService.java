package kosta.mapda.service.enterprise;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import kosta.mapda.domain.enterprise.Enterprise;
import kosta.mapda.domain.enterprise.EnterpriseCategory;
import kosta.mapda.domain.enterprise.EnterprisePost;
import kosta.mapda.domain.enterprise.EnterprisePostImage;

public interface EnterprisePostService {

	/**
	 * 엔터프라이즈 포스트 리스트 가져오기
	 */
	Page<EnterprisePost> selectAll(Pageable pageable);
	
	/**
	 * 엔터프라이즈 포스트 작성하기
	 */
	void insertPost(EnterprisePost post);
	
	/**
	 * 임시용 엔터프라이즈 가져오기
	 */
	Enterprise getEnterprise();
	
	/**
	 * 포스트 가져오기
	 */
	EnterprisePost getPost(Long epNo);
	
	/**
	 * 카테고리 리스트 가져오기
	 */
	List<EnterpriseCategory> getCategory();

	void insertPostImage(List<EnterprisePostImage> imageList);
}
