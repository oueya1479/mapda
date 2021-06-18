package kosta.mapda.controller.point;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kosta.mapda.domain.map.Place;
import kosta.mapda.domain.map.PlacePhotoReview;
import kosta.mapda.domain.map.Theme;
import kosta.mapda.domain.member.Member;
import kosta.mapda.domain.service.MyPoint;
import kosta.mapda.domain.service.SavingHistory;
import kosta.mapda.domain.service.UsingHistory;
import kosta.mapda.service.service.PointService;

@Controller
@RequestMapping("/point")
public class PointController {
	
	@Autowired
	private PointService pointService;
	
	/**
	 * 마이페이지 - 적립 가능한 포인트 리스트 가져오기
	 */
	@RequestMapping("/myPoint")
	public String myPoint(Model model) {
		
		Member mem = (Member)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		
		List<Theme> myThemeList = pointService.selectMyThemeMyPoint(mem.getMemNo());
		
		List<Place> myPlaceList = pointService.selectMyPlaceMyPoint(mem.getMemNo()); 
		
		List<PlacePhotoReview> myPhotoReviewList = pointService.selectMyPlacePhotoMyPoint(mem.getMemNo());
		
		model.addAttribute("myThemeList" , myThemeList);
		model.addAttribute("myPlaceList" , myPlaceList);
		model.addAttribute("myPhotoReviewList" , myPhotoReviewList);
		
		
		return "point/myPoint";
	}
	
	/**
	 * 마이페이지 - 포인트 내역 리스트 가져오기
	 * */
	@RequestMapping("/myPointHistory")
	public String myPointHistory(Model model) {
		
		Member mem = (Member)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		
		MyPoint myPoint = pointService.selectMyPoint(mem.getMemNo());
		
		List<SavingHistory> mySavingList = pointService.selectSavingHistory(mem.getMemNo());
		
		List<UsingHistory> myHistoryList = pointService.selectUsingHistory(mem.getMemNo());
		
		model.addAttribute("myPoint", myPoint);
		model.addAttribute("mySavingList", mySavingList);
		model.addAttribute("myHistoryList", myHistoryList);
		
		return "point/myPointHistory";
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
