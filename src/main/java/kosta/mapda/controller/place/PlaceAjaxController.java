package kosta.mapda.controller.place;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import kosta.mapda.domain.map.PlacePhotoReview;
import kosta.mapda.domain.map.PlaceReview;
import kosta.mapda.service.place.PlaceReviewService;

@RestController
@RequestMapping("/place")
public class PlaceAjaxController {
	
	@Autowired
	private PlaceReviewService prService;
	
	/**
	 * 		상세보기
	 * */
	@RequestMapping("/reviewAjax/{placeNo}")
	public List<PlacePhotoReview> reviewAjax(@PathVariable Long placeNo) {
		List<PlacePhotoReview> pprList = prService.selectAllPhotoReview(placeNo);
		return pprList;
	}
	
	@RequestMapping("/replyAjax/{placeNo}")
	public List<PlaceReview> replyAjax(@PathVariable Long placeNo) {
		List<PlaceReview> prList = prService.selectAllPlaceReview(placeNo);
		return prList;
	}
}
