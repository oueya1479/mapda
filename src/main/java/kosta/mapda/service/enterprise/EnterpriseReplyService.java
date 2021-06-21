package kosta.mapda.service.enterprise;

import java.util.List;

import kosta.mapda.domain.enterprise.EnterpriseReply;
import kosta.mapda.domain.member.Member;

public interface EnterpriseReplyService {
	
	/**
	 * 해당 게시물에 대한 댓글을 가져오는 기능
	 */
	List<EnterpriseReply> getReply(Long epNo);

	void addReply(Long epNo, EnterpriseReply enterpriseReply, Member member);

}
