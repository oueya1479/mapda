package kosta.mapda.controller.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
	public void list() {
		
		
	}
	
	/**
	 * 이벤트 등록 
	 * */
	@RequestMapping("/insert")
	public void insert() {
	}
	
	
	
	/**
	 * 이벤트 게시무 수정
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
