package kosta.mapda.service.enterprise;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import kosta.mapda.domain.enterprise.Enterprise;
import kosta.mapda.domain.enterprise.EnterprisePost;
import kosta.mapda.repository.enterprise.EnterprisePostRepository;
import kosta.mapda.repository.enterprise.EnterpriseRepository;

@Service
@Transactional
public class EnterprisePostServiceImpl implements EnterprisePostService {
	
	@Autowired
	private EnterprisePostRepository repository;
	
	@Autowired
	private EnterpriseRepository re;

	@Override
	public Page<EnterprisePost> selectAll(Pageable pageable) {
		return repository.findAll(pageable);
	}

	@Override
	public void insertPost(EnterprisePost post) {
		repository.save(post);
	}

	@Override
	public Enterprise getEnterprise() {
		return re.getById(1L);
	}

	@Override
	public EnterprisePost getPost(Long epNo) {
		return repository.findById(epNo).orElse(null);
	}
}
