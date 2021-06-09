package kosta.mapda.service.young;

import javax.transaction.Transactional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import kosta.mapda.domain.map.Map;

@Service
@Transactional
public class MapService {

	public void insertMap(Map map) {
		
		
	}

	public Page<Map> selectAll(Pageable pageable) {
		
		return null;
	}

}
