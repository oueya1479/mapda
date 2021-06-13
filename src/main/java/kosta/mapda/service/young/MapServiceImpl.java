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
		return maprepository.findAll(pageable);
	}
	
	/**
	 * 상세보기
	 */
	@Override
	public Theme selectBy(Long mapNo, boolean state) {
		if(state) {
			maprepository.readnumUpdate(mapNo);
		}
		return maprepository.findById(mapNo).orElse(null);
	}

	/**
	 * 수정폼
	 */
	@Override
	public Theme modifyMap(Theme theme) {
		Theme themeInfo = maprepository.findById(theme.getMapNo()).orElse(null);
		if(themeInfo==null)
		{
			throw new RuntimeException("테마지도 수정오류.");
		}
		themeInfo.setMapContent(theme.getMapContent());
		themeInfo.setMapTitle(theme.getMapTitle());
		
		return themeInfo;
	}
	
	/**
	 * 삭제
	 */
	@Override
	public void deleteMap(Long mapNo, String password) {
		Theme themeMap = maprepository.findById(mapNo).orElse(null);
		if(themeMap==null) {
			throw new RuntimeException("지도 삭제 오류. 다시 시도해주세요");
		}
		maprepository.deleteById(mapNo);
	}
	
}
