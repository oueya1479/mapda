package kosta.mapda.service.young;

import javax.transaction.Transactional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import kosta.mapda.domain.map.Theme;
import kosta.mapda.repository.young.MapRepository;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Transactional
@Service
public class MapServiceImpl implements MapService {
	
	private final MapRepository maprepository;

	/**
	 * 등록
	 */
	@Override
	public void insertMap(Theme theme) {
		maprepository.save(theme);
	}

	/**
	 * 전체검색
	 */
	@Override
	public Page<Theme> selectAll() {
		
		return null;
	}

	/**
	 * 전체검색 - 페이징
	 */
	@Override
	public Page<Theme> selectAll(Pageable pageable) {
		// TODO Auto-generated method stub
		return null;
	}

}
