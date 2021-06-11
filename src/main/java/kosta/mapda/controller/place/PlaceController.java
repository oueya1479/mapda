package kosta.mapda.controller.place;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kosta.mapda.domain.map.Place;
import kosta.mapda.domain.map.PlacePhoto;
import kosta.mapda.domain.map.PlacePhotoReview;
import kosta.mapda.domain.map.PlaceReview;
import kosta.mapda.service.place.PlaceReviewService;
import kosta.mapda.service.place.PlaceService;

@Controller
@RequestMapping("/place")
public class PlaceController {

	@Autowired
	private PlaceService placeService;
	
	@Autowired
	private PlaceReviewService prService;
	
	/**
	 * 		상세보기
	 * */
	@RequestMapping("/read/{placeNo}")
	public ModelAndView read(@PathVariable Long placeNo) {
		Place place = placeService.selectBy(placeNo);
		List<PlacePhoto> ppList = placeService.selectAllPlacePhoto(placeNo);
		List<PlaceReview> prList = prService.selectAllPlaceReview(placeNo);
		List<PlacePhotoReview> pprList = prService.selectAllPhotoReview(placeNo);
		
		// 해쉬태그 #기준으로 나눔
		List<String> tagStr=new ArrayList<String>();
		String str = place.getPlaceTag();
		String [] hashStr = str.split("#");
		for(int i=1; i<hashStr.length; i++) {
			tagStr.add(hashStr[i]);
		}
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("place/read");
		
		mv.addObject("ppList", ppList);
		mv.addObject("place", place);
		mv.addObject("tagStr",tagStr);
		mv.addObject("prList", prList);
		mv.addObject("pprList", pprList);
		
		return mv;
	}
}
