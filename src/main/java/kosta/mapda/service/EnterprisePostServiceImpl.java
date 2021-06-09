package kosta.mapda.service;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import kosta.mapda.domain.enterprise.EnterprisePost;
import kosta.mapda.repository.EnterprisePostRepository;

@Service
@Transactional
public class EnterprisePostServiceImpl implements EnterprisePostService {
	
	@Autowired
	private EnterprisePostRepository repository;

	@Override
	public Page<EnterprisePost> selectAll(Pageable pageable) {
		return repository.findAll(pageable);
	}
}
