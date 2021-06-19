package kosta.mapda.service.place;

import java.time.LocalDateTime;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import kosta.mapda.domain.map.Place;
import kosta.mapda.domain.map.PlacePhoto;
import kosta.mapda.domain.map.PlaceStorage;
import kosta.mapda.domain.member.Member;
import kosta.mapda.repository.member.MemberRepository;
import kosta.mapda.repository.place.PlacePhotoRepository;
import kosta.mapda.repository.place.PlaceRepository;
import kosta.mapda.repository.place.PlaceStorageRepository;

@Service
@Transactional
public class PlaceServiceImpl implements PlaceService {
	
	@Autowired
	private PlaceRepository placeRepository;
	
	@Autowired
	private PlacePhotoRepository placePhotoRepository;
	
	@Autowired
	private MemberRepository memberRepository;
	
	@Autowired
	private PlaceStorageRepository placeStorageRepository;

	@Override
	public List<Place> selectAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Page<Place> selectAll(Pageable pageable) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void insert(Place place, List<PlacePhoto> ppList) {
		placeRepository.save(place);
		placePhotoRepository.saveAll(ppList);
	}

	/**
	 * 		열람!!
	 * 
	 * 		1. 히든인지 여부 판단한다.
	 * 			1-1) 히든이 아니면 return placeRepository.findById(placeNo).orElse(null)
	 * 			1-2)	히든이 맞으면 2번 단계로 넘어간다.
	 * 		2. 회원의 등급을 판단한다.
	 * 			2-1) 유료결제
	 * 
	 * 		히든 
	 * */
	@Override
	public Place selectBy(Long placeNo) {
/*
		boolean yesORno = isHidden(placeNo); // false 면 히든 아님  true 면 히든임

		Place place = placeRepository.isHiddenPlace(placeNo);
		if(place==null){//히든 아님
			return placeRepository.findById(placeNo).orElse(null);
		}else {// 히든임
			
		}
*/		
		
		return placeRepository.findById(placeNo).orElse(null);
	}

	@Override
	public Place update(Place place) {
		System.out.println("PlaceService update place = " + place +" ,  "+ place.getPlaceNo());
		Place dbPlace = placeRepository.findById(place.getPlaceNo()).orElse(null);
		
		System.out.println("PlaceService update dbPlace = " + dbPlace);
		if(dbPlace == null) {
			throw new RuntimeException("플레이스 번호가 일치하지 않아 수정될 수 없습니다.");
		}
		
		dbPlace.setPlaceContent(place.getPlaceContent().replace("<", "&lt;"));
		
		return dbPlace;
	}

	@Override
	public void delete(Long placeNo) {
		Place dbPlace = placeRepository.findById(placeNo).orElse(null);
		LocalDateTime validRegdate = dbPlace.getPlaceRegdate().plusDays(30);
		LocalDateTime nowRegdate = dbPlace.getPlaceRegdate();
		if(nowRegdate.isBefore(validRegdate)) {
			throw new RuntimeException("30일 이후에 삭제가 가능합니다.");
		}else {
			placeRepository.deleteById(placeNo);
		}
		placeRepository.deleteById(placeNo);
	}

	@Override
	public List<PlacePhoto> selectAllPlacePhoto(Long placeNo) {
		return placePhotoRepository.selectPlacePhotoByPlaceNo(placeNo);
	}

	@Override	// 이건 안쓸거같은데 ...
	public List<Place> selectByHidden(Long mapNo) {
		List<Place> hiddenPlaceList = placeRepository.selectByHiddenMapNo(mapNo);
		return hiddenPlaceList;
	}

	@Override
	public boolean findMemberMemNo(Long memNo) {
		Member mem = memberRepository.findById(memNo).orElse(null);
		String mG = mem.getMemGrade();
		if(mG.equals("Influencer")) {
			return true;	//Influencer 이다
		}else {
			return false;	// Influencer 아니다
		}
	}

	@Override
	public List<PlaceStorage> selectByMemPlace(Long memNo) {
		return placeStorageRepository.selectByMemPlace(memNo);
	}

	@Override
	public PlaceStorage likeCheck(Long placeNo, Long memNo) {
		return placeStorageRepository.findStorage(placeNo, memNo);
	}

	@Override
	public void insertPlaceStorage(Long placeNo, Long memNo) {
		Member member = new Member();
		Place place = new Place();
		
		member.setMemNo(memNo);
		place.setPlaceNo(placeNo);
		PlaceStorage placeStorage = new PlaceStorage();
		
		placeStorage.setMember(member);
		placeStorage.setPlace(place);
		
		placeStorageRepository.save(placeStorage);
	}

	@Override
	public void deletePlaceStorage(Long placeNo, Long memNo) {
		placeStorageRepository.deleteSub(placeNo, memNo);
	}

//	@Override
//	public void insertPlacePhoto(List<PlacePhoto> photoList) {
//		placePhotoRepository.saveAll(photoList);
//	}
	
}
