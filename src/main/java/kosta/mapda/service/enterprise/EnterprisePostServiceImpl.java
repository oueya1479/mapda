package kosta.mapda.service.enterprise;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import kosta.mapda.domain.enterprise.Enterprise;
import kosta.mapda.domain.enterprise.EnterpriseCategory;
import kosta.mapda.domain.enterprise.EnterprisePost;
import kosta.mapda.domain.enterprise.EnterprisePostImage;
import kosta.mapda.repository.enterprise.EnterpriseCategoryRepository;
import kosta.mapda.repository.enterprise.EnterprisePostImageRepository;
import kosta.mapda.repository.enterprise.EnterprisePostRepository;
import kosta.mapda.repository.enterprise.EnterpriseRepository;

@Service
@Transactional
public class EnterprisePostServiceImpl implements EnterprisePostService {
	
	@Autowired
	private EnterprisePostRepository postRepository;
	
	@Autowired
	private EnterpriseRepository enterpriseRepository;
	
	@Autowired
	private EnterpriseCategoryRepository categoryRepository;
	
	@Autowired
	private EnterprisePostImageRepository imageRepository;

	@Override
	public Page<EnterprisePost> selectAll(Pageable pageable) {
		return postRepository.findAll(pageable);
	}

	@Override
	public void insertPost(EnterprisePost post) {
		postRepository.save(post);
	}

	@Override
	public Enterprise getEnterprise() {
		return enterpriseRepository.getById(1L);
	}

	@Override
	public EnterprisePost getPost(Long epNo) {
		return postRepository.findById(epNo).orElse(null);
	}

	@Override
	public List<EnterpriseCategory> getCategory() {
		return categoryRepository.findAll();
	}

	@Override
	public void insertPostImage(EnterprisePostImage image) {
		imageRepository.save(image);		
	}
}
