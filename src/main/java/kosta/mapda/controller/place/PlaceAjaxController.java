package kosta.mapda.controller.place;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import kosta.mapda.domain.map.PhotoReviewDTO;
import kosta.mapda.domain.map.PlacePhotoReview;
import kosta.mapda.domain.map.PlacePhotoReviewPhoto;
import kosta.mapda.domain.map.PlaceReview;
import kosta.mapda.domain.map.PlaceStorage;
import kosta.mapda.domain.map.ReviewDTO;
import kosta.mapda.service.place.PlaceReviewService;
import kosta.mapda.service.place.PlaceService;

@RestController
@RequestMapping("/place")
public class PlaceAjaxController {
	
	@Autowired
	private PlaceService placeService;
	
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
	
	@RequestMapping("/influencerCheck")
	public String influencerCheck(@RequestParam("memNo")Long memNo) {
		//Member mem = (Member)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		Boolean yesOrNo = placeService.findMemberMemNo(memNo);
		if(yesOrNo) {
			return "yes";	//influencer 이다
		}else {
			return "no";		//influencer 아니다
		}
	}
	
	@RequestMapping("/likelikePlace")
	public int likelikePlace(String placeNo, String memNo) {
		Long pNo = Long.parseLong(placeNo);
		Long mNo = Long.parseLong(memNo);
		
		int resultCode = 1;
		
		try {
			PlaceStorage ps = placeService.likeCheck(pNo, mNo);
			if(ps==null) {
				placeService.insertPlaceStorage(pNo, mNo);
				resultCode=1;
			}else if(ps!=null) {
				placeService.deletePlaceStorage(pNo, mNo);
				resultCode=0;
			}
		}catch(Exception e) {
			resultCode = -1;
		}

		return resultCode;
	}
	
//	@RequestMapping("/pagingReply/{placeNo}")
//	public void replyList(Model model, @RequestParam(defaultValue = "0") int nowPage, @PathVariable Long placeNo) {
//		Pageable pageable = PageRequest.of(nowPage, 5, Direction.DESC, "prRegdate");
//		Page<PlaceReview> pageReplyList = prService.pageSelectAllpr(pageable);
//		model.addAttribute("pageList", pageReplyList);
//	}
	
}