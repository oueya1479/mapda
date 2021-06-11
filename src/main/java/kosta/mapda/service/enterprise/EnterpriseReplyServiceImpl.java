package kosta.mapda.service.enterprise;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kosta.mapda.domain.enterprise.EnterpriseReply;
import kosta.mapda.repository.enterprise.EnterpriseReplyRepository;

@Service
@Transactional
public class EnterpriseReplyServiceImpl implements EnterpriseReplyService {
	
	@Autowired
	private EnterpriseReplyRepository repository;

	@Override
	public List<EnterpriseReply> getReply(Long epNo) {
		return repository.getReply(epNo);
	}

}
