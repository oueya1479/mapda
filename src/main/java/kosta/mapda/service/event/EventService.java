package kosta.mapda.service.event;

import java.util.List;

import kosta.mapda.domain.service.Event;

public interface EventService {

	List<Event> list();
	
	/**
	 * 이벤트 등록 
	 */
	void insert(Event event);
	
	
	/**
	 * 이벤트 수정
	 */
	 int update(Event event); 
	 
	 
	 /**
	  * 이벤트 삭제 
	  */
	  int delete(Long evNo);
	  
	  
}
