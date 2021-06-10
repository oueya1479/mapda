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
	public void insert(Place place) {
		// TODO Auto-generated method stub

	}

	@Override
	public Place selectBy(Long placeNo) {
		return placeRepository.findById(placeNo).orElse(null);
	}

	@Override
	public Place update(Place place) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void delete(Long placeNo) {
		// TODO Auto-generated method stub

	}

	@Override
	public List<PlacePhoto> selectAllPlacePhoto() {
		
		return placePhotoRepository.findAll();
	}

}
