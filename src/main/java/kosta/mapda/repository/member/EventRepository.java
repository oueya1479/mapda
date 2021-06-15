package kosta.mapda.repository.member;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import kosta.mapda.domain.service.Event;

public interface EventRepository extends JpaRepository<Event, Long> {

}
