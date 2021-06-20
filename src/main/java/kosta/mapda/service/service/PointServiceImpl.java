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
import kosta.mapda.domain.service.SavingHistory;
import kosta.mapda.domain.service.UsingHistory;
import kosta.mapda.repository.MyPointRepository;
import kosta.mapda.repository.SavingHistoryRepository;
import kosta.mapda.repository.UsingHistoryRepository;
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
	
	@Autowired
	private SavingHistoryRepository savingHistoryRepository;
	
	@Autowired
	private UsingHistoryRepository usingHistoryRepository;
	
	@Autowired
	private MemberRepository memberRepository;
	
	@Override
	public MyPoint selectMyPoint(Long memNo) {
		
				
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

	@Override
	public void pointSum(int savePoint, int usePoint, Long memNo) {
		int myPoint = savePoint - usePoint;
		
		MyPoint mp = new MyPoint();
		mp.setMemNo(memNo);
		mp.setMyPoint(myPoint);
		
		myPointRepository.save(mp);
		
	}

	@Override
	public void pointPlus(SavingHistory savePoint) {
		
		savingHistoryRepository.save(savePoint);
		
	}

	@Override
	public void pointMinus(UsingHistory usingPoint) {
		
		usingHistoryRepository.save(usingPoint);
		
	}

	@Override
	public List<SavingHistory> selectSavingHistory(Long memNo) {
		
		return savingHistoryRepository.findBymyPoint_memNo(memNo);
	}

	@Override
	public List<UsingHistory> selectUsingHistory(Long memNo) {
		
		return usingHistoryRepository.findBymyPoint_memNo(memNo);
	}

	@Override
	public void createMyPoint(Long memNo) {
		
		MyPoint mp = new MyPoint();
		
		mp.setMyPoint(0);
		
		mp.setMember(memberRepository.findBymemNo(memNo));
		
		System.out.println(memNo);
		
		myPointRepository.save(mp);
		
	}

	@Override
	public void updateMyPoint(Long memNo, int point) {
		
		MyPoint mp = myPointRepository.findBymember_memNo(memNo);
		int originPoint = mp.getMyPoint();
		int newPoint = originPoint + point;
		mp.setMyPoint(newPoint);
		
		myPointRepository.save(mp);
		
		
	}
	
	
	
	

}
