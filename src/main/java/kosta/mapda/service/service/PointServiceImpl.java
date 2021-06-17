package kosta.mapda.service.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import kosta.mapda.domain.map.Place;
import kosta.mapda.domain.map.PlacePhotoReview;
import kosta.mapda.domain.map.Theme;
import kosta.mapda.domain.member.Member;
import kosta.mapda.domain.service.MyPoint;
import kosta.mapda.repository.MyPointRepository;
import kosta.mapda.repository.member.MemberRepository;
import kosta.mapda.repository.place.PlacePhotoRepository;
import kosta.mapda.repository.place.PlacePhotoReviewPhotoRepository;
import kosta.mapda.repository.place.PlacePhotoReviewRepository;
import kosta.mapda.repository.place.PlaceRepository;
import kosta.mapda.repository.young.MapRepository;

@Service
@Transactional
public class PointServiceImpl implements PointService {

	@Autowired
	private MyPointRepository myPointRepository;
	
	@Autowired
	private MapRepository mapRepository;
	
	@Autowired
	private PlaceRepository placeRepository;
	
	@Autowired
	private PlacePhotoReviewRepository placePhotoReviewRepository;
	
	@Override
	public List<MyPoint> selectMyPoint(Long memNo) {
		
				
		return myPointRepository.findBymember_memNo(memNo);
	}

	@Override
	public List<Theme> selectMyThemeMyPoint(Long memNo) {
		
		return mapRepository.findBymember_memNo(memNo);
		
	}

	@Override
	public List<Place> selectMyPlaceMyPoint(Long memNo) {
		
		return placeRepository.findBymember_memNo(memNo);
	}

	@Override
	public List<PlacePhotoReview> selectMyPlacePhotoMyPoint(Long memNo) {
		
		return placePhotoReviewRepository.findBymember_memNo(memNo);
	}

}
