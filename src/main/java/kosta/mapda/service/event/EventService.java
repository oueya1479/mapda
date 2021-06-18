package kosta.mapda.service.event;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import kosta.mapda.domain.service.Event;
import kosta.mapda.domain.service.EventPost;

public interface EventService {

	List<Event> list();
	
	/**
	 * 이벤트 등록 
	 */

	/**
	 *  이벤트 목록 출력
	 * */
	List<Event> selectAll();
	
	/**
	 *  이벤트 글 등록하기 
	 * */
	void insert(EventPost event);
	
	
	/**
	 * 이벤트 참여자 등록 게시물 목록 전체 가져오기
	 */
	Page<Event> selectAll(Pageable pageable);
	
	
	/**
	 * 이벤트 참여자 게시물 상세보기
	 */
	Event selectBy(Long evNo);
	
	
	/**
	 * 이벤트 게시물 수정
	 * */
	Event update(Event event);
	
	/**
	 * 이벤트 게시물 삭제
	 * */
	void delete();

	Page<EventPost> selectAllPost(Pageable pageable, Long evNo);

	Event getEvent(Long evNo);

	void deletePost(Long evpNo);

	
	
}
