package kosta.mapda.service.event;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kosta.mapda.domain.service.Event;
import kosta.mapda.repository.EventRepository;

@Service
@Transactional
public class EventServiceImpl implements EventService {


	@Autowired
	private EventRepository eventRepository;

	@Override
	public List<Event> list() {
		return eventRepository.findAll();
	}


	@Override
	public int update(Event event) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(Long evNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void insert(Event event) {
		eventRepository.save(event);
	}
	
	
}
