package kosta.mapda.service;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import kosta.mapda.domain.enterprise.Enterprise;
import kosta.mapda.domain.enterprise.EnterprisePost;
import kosta.mapda.repository.EnterpriseRepository;

@Service
@Transactional
public class EnterpriseServiceImpl implements EnterpriseService {
	
	@Autowired
	private EnterpriseRepository repository;

	@Override
	public Page<Enterprise> selectAll(Pageable pageable) {
		return repository.findAll(pageable);
	}

	@Override
	public Enterprise selectEnterprise(Long memNo) {
		return repository.findById(memNo).orElse(null);
	}
}
