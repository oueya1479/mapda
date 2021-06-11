package kosta.mapda.service.event;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kosta.mapda.repository.EventRepository;

@Service
@Transactional
public class EventServiceImpl implements EventService {


	@Autowired
	private EventRepository eventRepository;
	
	
}
