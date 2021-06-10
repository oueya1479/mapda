package kosta.mapda.repository.young;

import org.springframework.data.jpa.repository.JpaRepository;

import kosta.mapda.domain.map.Theme;

public interface MapRepository extends JpaRepository<Theme, Long> {

}
