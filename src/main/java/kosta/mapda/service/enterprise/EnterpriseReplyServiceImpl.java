package kosta.mapda.service.enterprise;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kosta.mapda.domain.Management;
import kosta.mapda.domain.enterprise.EnterprisePost;
import kosta.mapda.domain.enterprise.EnterpriseReply;
import kosta.mapda.domain.member.Member;
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

	@Override
	public void addReply(Long epNo, EnterpriseReply enterpriseReply, Member member) {
		EnterprisePost e = new EnterprisePost();
		Management m = new Management();
		e.setEpNo(epNo);
		m.setMngNo(6L);
		enterpriseReply.setEnterprisePost(e);
		enterpriseReply.setManagement(m);
		enterpriseReply.setMember(member);
		repository.save(enterpriseReply);		
	}
}
