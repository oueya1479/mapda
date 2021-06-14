package kosta.mapda.controller.member;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kosta.mapda.domain.service.Event;
import kosta.mapda.service.event.EventService;

@Controller
@RequestMapping("/event")
public class EventController {

	@Autowired
	private EventService eventService;
	
	/**
	 *  이벤트 목록 출력
	 * */
	@RequestMapping("/list")
	public String list(Model model) {
		List<Event> eventList = eventService.list();
		model.addAttribute("eventList", eventList);
		return "member/event";
	}
	
	/**
	 * 이벤트 등록 페이
	 * */
	@RequestMapping("/insert")
	public String insert(Event event) {
		return "member/posting";
	}
	
	/**
	 * 이벤트 등
	 * */
	@RequestMapping("/insertSubmit")
	public String insertSubmit(Event event) {
		eventService.insert(event);
		return "member/event";
	}
	
	/**
	 * 이벤트 게시물 수정
	 * */
	@RequestMapping("/update")
	public void update() {
		
		
	}

	
	
	/**
	 * 이벤트 게시물 삭제
	 * */
	@RequestMapping("/delete")
	public void delete() {
		
	}
	
}
