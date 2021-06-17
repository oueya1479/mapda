package kosta.mapda.service.young;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import kosta.mapda.domain.map.MapCategory;
import kosta.mapda.domain.map.MapStorage;
import kosta.mapda.domain.map.Theme;
import kosta.mapda.domain.member.Member;
import kosta.mapda.repository.member.MemberRepository;
import kosta.mapda.repository.young.MapRepository;
import kosta.mapda.repository.young.MapStorageRepository;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Transactional
@Service
public class MapServiceImpl implements MapService {
	
	private final MapRepository maprepository;
	
	private final MapStorageRepository mapStorageRepository;

	private final MemberRepository memberRepository;

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
	public void deleteMap(Long mapNo) {
		Theme themeMap = maprepository.findById(mapNo).orElse(null);
		if(themeMap==null) {
			throw new RuntimeException("지도 삭제 오류. 다시 시도해주세요");
		}
		maprepository.deleteById(mapNo);
	}
	/**
	 * 멤버 정보 받아오기 위한 메소드
	 */
	@Override
	public Member findInform(String memId) {
		return memberRepository.findMemberById(memId);
	}


	/**
	 * 구독 체크
	 */
	@Override
	public MapStorage subcheck(Long memNo, Long mapNo) {

		return mapStorageRepository.findStorage(memNo, mapNo);
	}
	
	/**
	 * 구독 insert
	 */
	@Override
	public void insertSubscribe(Long memNo, Long mapNo) {
		Member member = new Member();
		Theme theme = new Theme();
		
		member.setMemNo(memNo);
		theme.setMapNo(mapNo);
		MapStorage mapStorage = new MapStorage();
		
		mapStorage.setMember(member);
		mapStorage.setTheme(theme);
		
		
		mapStorageRepository.save(mapStorage);
		
	}

	/**
	 * 구독 delete
	 */
	@Override
	public void deleteSubscribe(Long memNo, Long mapNo) {
		
		mapStorageRepository.deleteSub(memNo,mapNo);
		
	}

	/**
	 * 로그인한 회원이 등록한 지도 목록
	 */
	@Override
	public List<Theme> myMaps(Long memNo) {
		return maprepository.selectByMemId(memNo);
	}
	
	
	/**
	 * 로그인한 멤버의 MapStorage목록 받아오기
	 */
	@Override
	public List<MapStorage> selectByMapNo(Long memNo) {
		return mapStorageRepository.selectByMapNo(memNo);
	}


	/**
	 * 카테고리 별 지도 검색
	 */
	@Override
	public List<Theme> selectByCategory(MapCategory category) {
		return maprepository.selectByCategory(category);
	}

	
	

}
