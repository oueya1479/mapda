package kosta.mapda.service.event;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import kosta.mapda.domain.service.Event;
import kosta.mapda.repository.member.EventRepository;

@Service
@Transactional
public class EventServiceImpl implements EventService {


	@Autowired
	private EventRepository eventRepository;

	@Override

	public List<Event> selectAll() {
		
		return null;
	}

	@Override
	public void insert(Event event) {
		eventRepository.save(event);
		
	}

	@Override
	public Page<Event> selectAll(Pageable pageable) {
	
		return eventRepository.findAll(pageable);
	}

	@Override
	public Event selectBy(Long evNo) {
		return eventRepository.findById(null).orElse(null);
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
	
	
}
