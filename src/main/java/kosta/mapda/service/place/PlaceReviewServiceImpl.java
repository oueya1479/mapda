package kosta.mapda.service.place;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kosta.mapda.domain.map.PlacePhotoReview;
import kosta.mapda.domain.map.PlacePhotoReviewPhoto;
import kosta.mapda.domain.map.PlaceReview;
import kosta.mapda.repository.place.PlacePhotoReviewPhotoRepository;
import kosta.mapda.repository.place.PlacePhotoReviewRepository;
import kosta.mapda.repository.place.PlaceReviewRepository;

@Service
@Transactional
public class PlaceReviewServiceImpl implements PlaceReviewService {
	
	@Autowired
	private PlaceReviewRepository prRepository;
	
	@Autowired
	private PlacePhotoReviewRepository pprRepository;
	
	@Autowired
	private PlacePhotoReviewPhotoRepository pprpRepository;
	
	@Override
	public void insert(PlaceReview placeReview) {
		// TODO Auto-generated method stub

	}

	@Override
	public void delete(Long id) {
		// TODO Auto-generated method stub

	}

	@Override
	public List<PlaceReview> selectAllPlaceReview(Long placeNo) {
		return prRepository.selectByPlaceNo(placeNo);
	}

	@Override
	public List<PlacePhotoReview> selectAllPhotoReview(Long placeNo) {
		return pprRepository.selectByPlaceNo(placeNo);
	}

	@Override
	public List<PlacePhotoReviewPhoto> selectAllPhotoReviewPhoto(Long pprNo) {
		return pprpRepository.selectBypprNo(pprNo);
	}

	@Override
	public int selectStarScore(Long placeNo) {
		 List<PlacePhotoReview> pprList= pprRepository.selectStarScore(placeNo);
		 
		 for(PlacePhotoReview ppr : pprList) {
			// Integer.parseInt(ppr);
		 }
		return 0;
	}
	


	
	
	
}
