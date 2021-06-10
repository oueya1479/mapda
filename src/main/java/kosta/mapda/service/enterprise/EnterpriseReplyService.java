package kosta.mapda.service.enterprise;

import java.util.List;

import kosta.mapda.domain.enterprise.EnterpriseReply;

public interface EnterpriseReplyService {
	
	/**
	 * 해당 게시물에 대한 댓글을 가져오는 기능
	 */
	List<EnterpriseReply> getReply(Long epNo);

}
