package kosta.mapda.controller.enterprise;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kosta.mapda.domain.enterprise.EnterpriseReply;
import kosta.mapda.service.enterprise.EnterpriseReplyService;

@Controller
@RequestMapping("/enterprise")
public class EnterpriseReplyController {
	
	@Autowired
	private EnterpriseReplyService service;

	@RequestMapping("/reply")
	public ModelAndView getReply() {
		Long epNo = 1L;
		List<EnterpriseReply> replyList = service.getReply(epNo);
		return new ModelAndView("enterprise/post", "replyList", replyList);
	}
}