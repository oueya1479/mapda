package kosta.mapda.controller.place;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kosta.mapda.domain.map.Place;
import kosta.mapda.domain.map.PlacePhoto;
import kosta.mapda.service.place.PlaceService;

@Controller
@RequestMapping("/place")
public class PlaceController {

	@Autowired
	private PlaceService placeService;
	
	/**
	 * 		상세보기
	 * */
	@RequestMapping("/read/{placeNo}")
	public ModelAndView read(@PathVariable Long placeNo) {
		Place place = placeService.selectBy(placeNo);
		List<PlacePhoto> ppList = placeService.selectAllPlacePhoto();
		
		
		//System.out.println("place" + place.get);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("place/read");
		
		mv.addObject("ppList", ppList);
		mv.addObject("place", place);
		
		return mv;
	}
}
