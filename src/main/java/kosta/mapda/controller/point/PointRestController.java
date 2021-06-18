package kosta.mapda.controller.point;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import kosta.mapda.domain.map.Place;
import kosta.mapda.domain.map.PlacePhotoReview;
import kosta.mapda.domain.map.Theme;
import kosta.mapda.domain.member.Member;
import kosta.mapda.domain.service.SavingHistory;
import kosta.mapda.service.service.PointService;

/**
 *  비동기화
 * */
@RestController
@RequestMapping("/point")
public class PointRestController {

	@Autowired
	private PointService pointService;
	
	
	/**
	 *  포인트 적립처리 
	 * */
	@RequestMapping(value= "/pointPlus")
	public int pointPlus(Theme theme, Place place, PlacePhotoReview review, Model model) {
	
		Member mem = (Member)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		
		int resultCode = 1;
		
		
		try {
		if(theme != null) {
			SavingHistory sh = new SavingHistory();
			sh.setShPay(100);
			sh.setShWhere(theme.getMapTitle());
			sh.setMyPoint(pointService.selectMyPoint(mem.getMemNo()));
			System.out.println(1);
			pointService.pointSum(sh.getShPay(), 0, mem.getMemNo());
			
			resultCode = 1;
			
		}else if(place != null) {
			SavingHistory sh = new SavingHistory();
			sh.setShPay(50);
			sh.setShWhere(place.getPlaceTitle());
			sh.setMyPoint(pointService.selectMyPoint(mem.getMemNo()));
			
			System.out.println(2);
			pointService.pointSum(sh.getShPay(), 0, mem.getMemNo());
			
			resultCode = 1;
		}else if(review != null) {
			SavingHistory sh = new SavingHistory();
			sh.setShPay(10);
			sh.setShWhere(review.getPlace().getPlaceTitle());
			sh.setMyPoint(pointService.selectMyPoint(mem.getMemNo()));
			
			System.out.println(3);
			pointService.pointSum(sh.getShPay(), 0, mem.getMemNo());
			
			resultCode = 1;
		}
		}catch(Exception e) {
			e.printStackTrace();
			resultCode = -1;
		}
		
		
		return resultCode;
	}
}
