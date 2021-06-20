package kosta.mapda.service.event;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import kosta.mapda.domain.member.Member;
import kosta.mapda.domain.service.Event;
import kosta.mapda.domain.service.EventLike;
import kosta.mapda.domain.service.EventPost;
import kosta.mapda.repository.member.EventPostRepository;
import kosta.mapda.repository.member.EventRepository;
import kosta.mapda.repository.member.LikesRepository;

@Service
@Transactional
public class EventServiceImpl implements EventService {


	@Autowired
	private EventRepository eventRepository;
	
	@Autowired
	private EventPostRepository postRepository;

	@Autowired
	private LikesRepository likesRepository;
	
	@Override
	public List<Event> selectAll() {
		
		return null;
	}

	@Override
	public void insert(EventPost event) {
		postRepository.save(event);
		
	}

	@Override
	public Page<Event> selectAll(Pageable pageable) {
		return eventRepository.findAll(pageable);
	}

	@Override
	public Event selectBy(Long evNo) {
		return eventRepository.findById(evNo).orElse(null);
	}

	@Override
	public Event update(Event event) {
		
		return eventRepository.save(event);
	}

	@Override
	public void delete() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<Event> list() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Page<EventPost> selectAllPost(Pageable pageable, Long evNo) {
		return postRepository.selectAllPost(pageable, evNo);
	}

	@Override
	public Event getEvent(Long evNo) {
		return eventRepository.findById(evNo).orElse(null);
	}

	@Override
	public void deletePost(Long evpNo) {
		postRepository.deleteById(evpNo);
	}

	@Override
	public EventPost getEventPost(Long evpNo) {
		return postRepository.findById(evpNo).orElse(null);
	}

	@Override
	public void increaseLikes(Long evpNo) {
		postRepository.increaseLikes(evpNo);
		
	}

	@Override
	public void decreaseLikes(Long evpNo) {
		postRepository.decreaseLikes(evpNo);
	}

	@Override
	public void deleteLike(EventPost eventPost, Member member) {
		likesRepository.deleteLike(eventPost, member);
	}

	@Override
	public int checkLike(EventPost eventPost, Member member) {
		int result = likesRepository.checkLike(eventPost, member);
		
		return result;
	}

	
	@Override
	public List<Event> findAllByEventStatus() {
		//return  eventRepository.findAllByEventStatus();
		return null;
	}

	

	
}
