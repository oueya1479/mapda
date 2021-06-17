package kosta.mapda.controller.point;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kosta.mapda.domain.map.Place;
import kosta.mapda.domain.map.PlacePhotoReview;
import kosta.mapda.domain.map.Theme;
import kosta.mapda.domain.member.Member;
import kosta.mapda.domain.service.MyPoint;
import kosta.mapda.service.service.PointService;

@Controller
@RequestMapping("/point")
public class PointController {
	
	@Autowired
	private PointService pointService;
	
	/**
	 * 적립 가능한 포인트 리스트 가져오기
	 */
	@RequestMapping("/myPoint")
	public String myPoint(HttpServletRequest request, Model model) {
		
		
		HttpSession session = request.getSession();
		Member member = new Member();
		member.setMemNo(11L);
		member.setMemId("seo");
		member.setMemPw("1234");
		session.setAttribute("member", member);
		
		List<Theme> myThemeList = pointService.selectMyThemeMyPoint(member.getMemNo());
		
		List<Place> myPlaceList = pointService.selectMyPlaceMyPoint(member.getMemNo()); 
		
		List<PlacePhotoReview> myPhotoReviewList = pointService.selectMyPlacePhotoMyPoint(member.getMemNo());
		
		model.addAttribute("myThemeList" , myThemeList);
		model.addAttribute("myPlaceList" , myPlaceList);
		model.addAttribute("myPhotoReviewList" , myPhotoReviewList);
		
		
		return "point/myPoint";
	}
	
	/**
	 * 포인트 적립하기
	 * */
	/*@RequestMapping(value="/pointPlus",method=RequestMethod.POST)
	@ResponseBody
	public String pointPlus(Model model) {
		
		
		return null;
	}*/
	
}
