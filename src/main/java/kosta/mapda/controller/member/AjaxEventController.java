package kosta.mapda.controller.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import kosta.mapda.domain.member.Member;
import kosta.mapda.domain.service.Event;
import kosta.mapda.repository.member.EventRepository;

@RestController
public class AjaxEventController {
	
	@Autowired
	private EventRepository eventRepository;

	/**
	 * 후기게시물 좋아요
	 */
	@RequestMapping("/event/like")
	public String like(Long evNo) {
		return null;
	}

	/**
	 * 이벤트 참여 1회 제한
	 */
	@RequestMapping("event/isDuplicate")
	public void isDuplicate(Long evNo) throws Exception {
		Event event = eventRepository.findById(evNo).orElse(null);
		Member member = (Member) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		Long memNo = member.getMemNo();
		for(int i = 0; i < event.getPostList().size(); i++) {
			if (event.getPostList().get(i).getMember().getMemNo().equals(memNo)) {
				throw new Exception("이미 참가하셨습니다. 다음회차에 다시 참여해주세요.");
			}
		}
	}
}
