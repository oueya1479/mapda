package kosta.mapda.repository.member;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import kosta.mapda.domain.service.Event;


public interface EventRepository extends JpaRepository<Event, Long> {

	/*
	 * @Query(value= "SELECT * FROM event WHERE ev_status=1") List<Event>
	 * findAllByEventStatus();
	 */

	
}
