package kosta.mapda.controller.place;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import kosta.mapda.domain.map.PhotoReviewDTO;
import kosta.mapda.domain.map.PlacePhotoReview;
import kosta.mapda.domain.map.PlacePhotoReviewPhoto;
import kosta.mapda.domain.map.PlaceReview;
import kosta.mapda.domain.map.ReviewDTO;
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
	public List<PhotoReviewDTO> reviewAjax(@PathVariable Long placeNo) {
		List<PhotoReviewDTO> dbList = new ArrayList<PhotoReviewDTO>();
		List<PlacePhotoReview> pprList = prService.selectAllPhotoReview(placeNo);
		
		for(PlacePhotoReview ppr:pprList) {
			System.out.println("ppr.getPprRegdate() = " + ppr.getPprRegdate());
			System.out.println("ppr.getMember().getMemName() = " + ppr.getMember().getMemName());
			System.out.println("ppr.getPprContent(); = " + ppr.getPprContent());
			System.out.println("ppr.getPprStar(); = " + ppr.getPprStar());
			System.out.println("ppr.getPprpList().size(); = " + ppr.getPprpList().size());
			
			 List<PlacePhotoReviewPhoto> dbppprList = ppr.getPprpList();
			 for(PlacePhotoReviewPhoto pprp : dbppprList) {
				 System.out.println("pprp.getPprpPath() = " +pprp.getPprpPath());
			 }
			dbList.add(new PhotoReviewDTO(ppr.getPprRegdate(), ppr.getMember().getMemName(), 
					ppr.getPprContent(), ppr.getPprStar(), ppr.getPprpList().size(), ppr.getPprpList()));
		}
		return dbList;
	}
	
	@RequestMapping("/replyAjax/{placeNo}")
	public List<ReviewDTO> replyAjax(@PathVariable Long placeNo) {
		List<ReviewDTO> dbList = new ArrayList<ReviewDTO>();
		List<PlaceReview> prList = prService.selectAllPlaceReview(placeNo);
		
		for(PlaceReview pr : prList) {
			dbList.add(new ReviewDTO(pr.getPrRegdate(), pr.getPrContent(), pr.getMember().getMemName(), prList.size()));
		}
		return dbList;
	}
}