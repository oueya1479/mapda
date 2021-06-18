package kosta.mapda.service.place;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import kosta.mapda.domain.map.Place;
import kosta.mapda.domain.map.PlacePhoto;
import kosta.mapda.repository.place.PlacePhotoRepository;
import kosta.mapda.repository.place.PlaceRepository;

@Service
@Transactional
public class PlaceServiceImpl implements PlaceService {
	
	@Autowired
	private PlaceRepository placeRepository;
	
	@Autowired
	private PlacePhotoRepository placePhotoRepository;

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

	@Override
	public Place selectBy(Long placeNo) {
		return placeRepository.findById(placeNo).orElse(null);
	}

	@Override
	public Place update(Place place) {
		System.out.println("PlaceService update place = " + place);
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
//		LocalDateTime validRegdate = dbPlace.getPlaceRegdate().plusDays(30);
//		LocalDateTime nowRegdate = dbPlace.getPlaceRegdate();
//		if(nowRegdate.isBefore(validRegdate)) {
//			throw new RuntimeException("30일 이후에 삭제가 가능합니다.");
//		}else {
//			placeRepository.deleteById(placeNo);
//		}
//		
		placeRepository.deleteById(placeNo);
	}

	@Override
	public List<PlacePhoto> selectAllPlacePhoto(Long placeNo) {
		return placePhotoRepository.selectPlacePhotoByPlaceNo(placeNo);
	}

//	@Override
//	public void insertPlacePhoto(List<PlacePhoto> photoList) {
//		placePhotoRepository.saveAll(photoList);
//	}
	
}
