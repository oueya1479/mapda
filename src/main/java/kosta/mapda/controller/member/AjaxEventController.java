package kosta.mapda.controller.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import kosta.mapda.domain.member.Member;
import kosta.mapda.domain.service.Event;
import kosta.mapda.domain.service.EventLike;
import kosta.mapda.domain.service.EventPost;
import kosta.mapda.repository.member.EventPostRepository;
import kosta.mapda.repository.member.EventRepository;
import kosta.mapda.repository.member.LikesRepository;
import kosta.mapda.service.event.EventService;

@RestController
public class AjaxEventController {
	
	@Autowired
	private EventRepository eventRepository;

	@Autowired
	private EventService eventService;
	
	@Autowired
	private LikesRepository likesRepository;
	/**
	 * 후기게시물 좋아요
	 */
	@RequestMapping("/event/like")
	public String like(Long evpNo, String isLike) { //게시물 번호와 현재 자신이 이 게시물의 좋아요를 눌렀는지 안눌렀는지의 상태를 받아온다. 눌렀을 때 1, 안눌렀을때 0
		if(isLike.equals("1")) { //1일 경우 누른상태
 			
			//좋아요수에서 1을 빼고
			eventService.decreaseLikes(evpNo); 
			//삭제
			EventPost eventPost = eventService.getEventPost(evpNo);//해당 게시물을 찾고
			Member member = (Member) SecurityContextHolder.getContext().getAuthentication().getPrincipal(); //현재 접속중인 로그인유저를 찾
 			eventService.deleteLike(eventPost, member); // 해당 포스트의 좋아요 데이터를 삭제한다.
			
			return "0"; 
		} else {
			//좋아요수에서 1을 더하고
			eventService.increaseLikes(evpNo); 
			
			//insert
			EventPost eventPost = eventService.getEventPost(evpNo);  // 해당 게시물 찾기 
			Member member = (Member) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			likesRepository.save(new EventLike(null, eventPost, member));  //데이터 들어가 

			//return "1";
			return "1";
		}
	}

	/**
	 * 이벤트 참여 1회 제한
	 */
	@RequestMapping("event/isDuplicate")
	public int isDuplicate(Long evNo) throws Exception {
		Event event = eventRepository.findById(evNo).orElse(null);
		Member member = (Member) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		Long memNo = member.getMemNo();
		for(int i = 0; i < event.getPostList().size();i++) {
			if (event.getPostList().get(i).getMember().getMemNo().equals(memNo)) {
				return 0;
			}
		}
		return 1;
	}
}
