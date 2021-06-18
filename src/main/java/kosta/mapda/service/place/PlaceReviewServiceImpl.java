package kosta.mapda.service.place;

import java.time.LocalDateTime;
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
			prRepository.save(placeReview);
	}
	
	@Override
	public void delete(Long id) {
		prRepository.deleteById(id);
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
	public List<PlacePhotoReview> selectStarScore(Long placeNo) {	
		return pprRepository.selectStarScore(placeNo);
	}

	@Override
	public List<PlaceReview> selectByPlaceNoMemId(Long placeNo, String memId) {
		return prRepository.selectByPlaceNoMemId(placeNo, memId);
	}

	@Override
	public List<PlacePhotoReview> selectByMemIdPlaceNo(Long placeNo, String memId) {
		return pprRepository.selectByPlaceNoMemId(placeNo, memId);
	}

	@Override
	public void prInsert(PlacePhotoReview placePhotoReview, List<PlacePhotoReviewPhoto> pprpList) {
		pprRepository.save(placePhotoReview);
		pprpRepository.saveAll(pprpList);
	}

	@Override
	public void prDelete(Long id) {
		//pprpRepository.deletePprp(id);
		PlacePhotoReview ppr =pprRepository.findById(id).orElse(null);
		LocalDateTime validRegdate =ppr.getPprRegdate().plusDays(30);
		LocalDateTime nowRegdate = ppr.getPprRegdate();
		if(nowRegdate.isBefore(validRegdate)) {//nowRegdate <validRegdate
			throw new RuntimeException("30일 이후에 삭제가 가능합니다.");
		}else {
			pprRepository.deleteById(id);	
		}
	}

	@Override
	public PlaceReview prUpdate(PlaceReview placeReview) {
		PlaceReview dbPlaceReview = prRepository.findById(placeReview.getPrNo()).orElse(null);
		dbPlaceReview.setPrContent(placeReview.getPrContent().replace("<", "&lt;"));
		return dbPlaceReview;
	}

	@Override
	public PlacePhotoReview prrUpdate(PlacePhotoReview placePhotoReview) {
		PlacePhotoReview dbPpr = pprRepository.findById(placePhotoReview.getPprNo()).orElse(null);
		dbPpr.setPprContent(placePhotoReview.getPprContent().replace("<", "&lt;"));
		return dbPpr;
	}
	
	// 사용 안됨
	@Override
	public void insertPprPhoto(List<PlacePhotoReviewPhoto> pprpList) {
		 List<PlacePhotoReviewPhoto> pppp= pprpRepository.saveAll(pprpList);
	}

//	@Override
//	public List<PlacePhotoReviewPhoto> selectAllPhotoReviewPhotoPlaceNo(Long placeNo) {
//		return null;
//	}
	
	
	
}
