package kosta.mapda.controller.point;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import kosta.mapda.domain.map.Place;
import kosta.mapda.domain.map.PlacePhotoReview;
import kosta.mapda.domain.map.Theme;
import kosta.mapda.domain.member.Member;
import kosta.mapda.domain.service.MyPoint;
import kosta.mapda.domain.service.SavingHistory;
import kosta.mapda.repository.place.PlacePhotoReviewRepository;
import kosta.mapda.repository.place.PlaceRepository;
import kosta.mapda.repository.young.MapRepository;
import kosta.mapda.service.service.PointService;
import kosta.mapda.service.young.MapService;

/**
 *  비동기화
 * */
@RestController
@RequestMapping("/point")
public class PointRestController {

	@Autowired
	private PointService pointService;
	
	@Autowired
	private MapRepository mrepository;
	
	@Autowired
	private PlaceRepository prepository;
	
	@Autowired
	private PlacePhotoReviewRepository rrepository;
	
	
	/**
	 *  포인트 적립처리 
	 * */
	@RequestMapping(value= "/pointPlus")
	public int pointPlus(String classNo, String className, Model model) {
	
		Member mem = (Member)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		int resultCode = 1;
		
		Long classNum = Long.parseLong(classNo);
		
		try {
		if(className.equals("theme")) {
			Theme theme = mrepository.findById(classNum).orElse(null);
			theme.setMapPoint(1); //적립상태 변경
			
			mrepository.save(theme);
			
			SavingHistory sh = new SavingHistory();
			sh.setShPay(100);
			sh.setShWhere(theme.getMapTitle()); 
			sh.setMyPoint(pointService.selectMyPoint(mem.getMemNo()));
			System.out.println(1);
			pointService.pointPlus(sh); //사용이력으로 값 전달
			
			pointService.updateMyPoint(mem.getMemNo(), 100);
			
			                                                                       
			resultCode = 1;
			
		}else if(className.equals("place")) {
			Place place = prepository.findById(classNum).orElse(null);
			place.setPlacePoint(1); //적립상태변경
			
			prepository.save(place);
			
			SavingHistory sh = new SavingHistory();
			sh.setShPay(50);
			sh.setShWhere(place.getPlaceTitle());
			sh.setMyPoint(pointService.selectMyPoint(mem.getMemNo()));
			
			System.out.println(2);
			pointService.pointPlus(sh);
			
			pointService.updateMyPoint(mem.getMemNo(), 50);
			//pointService.pointSum(sh.getShPay(), 0, mem.getMemNo());
			
			resultCode = 1;
		}else{
			PlacePhotoReview review = rrepository.findById(classNum).orElse(null);
			
			review.setPprPoint(1);//적립상태변경
			
			rrepository.save(review);
			
			SavingHistory sh = new SavingHistory();
			sh.setShPay(10);
			sh.setShWhere(review.getPlace().getPlaceTitle());
			sh.setMyPoint(pointService.selectMyPoint(mem.getMemNo()));
			
			System.out.println(3);
			pointService.pointPlus(sh);
			
			pointService.updateMyPoint(mem.getMemNo(), 10);
			//pointService.pointSum(sh.getShPay(), 0, mem.getMemNo());
			
			resultCode = 1;
		}
		}catch(Exception e) {
			e.printStackTrace();
			resultCode = -1;
		}
		
		
		return resultCode;
	}
}
