package kosta.mapda.controller.place;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import kosta.mapda.domain.Management;
import kosta.mapda.domain.map.Place;
import kosta.mapda.domain.map.PlacePhoto;
import kosta.mapda.domain.map.PlacePhotoReview;
import kosta.mapda.domain.map.PlaceReview;
import kosta.mapda.domain.map.Theme;
import kosta.mapda.domain.member.Member;
import kosta.mapda.service.place.PlaceReviewService;
import kosta.mapda.service.place.PlaceService;

@Controller
@RequestMapping("/place")
public class PlaceController {

	@Autowired
	private PlaceService placeService;
	
	@Autowired
	private PlaceReviewService prService;
	
	@Autowired
	private PlacePhoto placePhoto;
	
	private final String SAVE_PATH = "C:\\KostaEdu\\thirdProject\\fileSave";
	
	/**
	 * 		상세보기
	 * */
	@RequestMapping("/read/{placeNo}")
	public ModelAndView read(@PathVariable Long placeNo) {
		int starAvg=0;
		int starAvgPer=0;
		
		Place place = placeService.selectBy(placeNo);
		List<PlacePhoto> ppList = placeService.selectAllPlacePhoto(placeNo);
		List<PlaceReview> prList = prService.selectAllPlaceReview(placeNo);
		List<PlacePhotoReview> pprList = prService.selectAllPhotoReview(placeNo);
		
		//포토리뷰 평점 구하기
		for(PlacePhotoReview ppr : pprList) {
			System.out.println("ppr.getPprStar() = " + ppr.getPprStar());
			starAvg+=ppr.getPprStar();
		}
		
		if(pprList.size()==0) {
			starAvg=0;
		}else {
			starAvg=starAvg/pprList.size();
		}
		
		starAvgPer=starAvg*10;
				
		// 해쉬태그 #기준으로 나눔
		List<String> tagStr=new ArrayList<String>();
		String str = place.getPlaceTag();	//#kosta#한식#맛#강추#꼭가요#가즈아#다있어
		String [] hashStr = str.split("#");
		for(int i=1; i<hashStr.length; i++) {
			tagStr.add(hashStr[i]);
		}
		
		//총 리뷰수
		int totalReviewCount=(prList.size() + pprList.size());
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("place/read");
		
		mv.addObject("ppList", ppList);
		mv.addObject("place", place);
		mv.addObject("tagStr",tagStr);
		mv.addObject("prList", prList);
		mv.addObject("pprList", pprList);
		mv.addObject("starAvg", starAvg);
		mv.addObject("starAvgPer", starAvgPer);
		mv.addObject("totalReviewCount", totalReviewCount);
		
		return mv;
	}
	
	/**
	 * 		댓글 등록하기
	 * */
	@RequestMapping("/replyWrite")
	public String insert(PlaceReview placeReview, Long placeNo, Member member, Management management,HttpServletRequest request, HttpServletResponse response) {
		Long memNo =Long.valueOf(request.getParameter("memNo"));
		String prContent = request.getParameter("prContent");

		placeReview.setPlace(new Place(placeNo));
		placeReview.setMember(new Member(memNo));
		placeReview.setManagement(new Management(4L));

		if(prContent=="") {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out;
			try {
				out = response.getWriter();
				out.println("<script>alert('댓글을 작성해주세요!'); history.back(); </script>");
				out.flush();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}else {
			prService.insert(placeReview);
		}
		return "redirect:/place/read/"+placeNo;
	}
	
	/**
	 * 		플레이스 등록하기 폼
	 * */
	@RequestMapping("/placeInsertForm")
	public String placeInsertForm() {
		return "place/placeInsertForm";
	}
	
	/**
	 * 		플레이스 등록하기
	 * */
	@RequestMapping("/placeInsert")
	public String placeInsert(Place place, Long mapNo, HttpServletRequest request) {
		String t1 = request.getParameter("hashTag1");
		String t2 = request.getParameter("hashTag2");
		String t3 = request.getParameter("hashTag3");
		String t4 = request.getParameter("hashTag4");
		String t5 = request.getParameter("hashTag5");
		String t6 = request.getParameter("hashTag6");
		String t7 = request.getParameter("hashTag7");
		String t8 = request.getParameter("hashTag8");
		
		String[] tagArr = {t1, t2, t3, t4, t5, t6, t7, t8};
		String totalTag="";
		for(int i=0; i<8; i++) {
			System.out.println("tagArr["+i +"] = " + tagArr[i]);
				if(tagArr[i]=="") {
					tagArr[i]="";
				}else{
					tagArr[i]= "#"+tagArr[i];
				}
				if(!tagArr[i].equals("#")) {
					totalTag+=tagArr[i];
				}
		}
		place.setPlaceTag(totalTag);
		
		switch(place.getPlaceIconNo()) {
			case 1: place.setPlaceIconName("맛집"); place.setPlaceIconPath("img/placeicon/food1.png"); break;
			case 2: place.setPlaceIconName("여행"); place.setPlaceIconPath("img/placeicon/travel1.png"); break;
			case 3: place.setPlaceIconName("카페"); place.setPlaceIconPath("img/placeicon/cafe1.png"); break;
			case 4: place.setPlaceIconName("힐링"); place.setPlaceIconPath("img/placeicon/healing1.png"); break;
			case 5: place.setPlaceIconName("자연"); place.setPlaceIconPath("img/placeicon/nature1.png"); break;
			case 6: place.setPlaceIconName("액티비티"); place.setPlaceIconPath("img/placeicon/activity1.png"); break;
			case 7: place.setPlaceIconName("쇼핑"); place.setPlaceIconPath("img/placeicon/shopping1.png"); break;
			case 8: place.setPlaceIconName("문화"); place.setPlaceIconPath("img/placeicon/culture1.png"); break;
			case 9: place.setPlaceIconName("산책"); place.setPlaceIconPath("img/placeicon/walking1.png"); break;
			case 10: place.setPlaceIconName("야경"); place.setPlaceIconPath("img/placeicon/night1.png"); break;
			case 11: place.setPlaceIconName("명소"); place.setPlaceIconPath("img/placeicon/attraction1.png"); break;
			case 12: place.setPlaceIconName("반려동물"); place.setPlaceIconPath("img/placeicon/pet1.png"); break;
			case 13: place.setPlaceIconName("데이트"); place.setPlaceIconPath("img/placeicon/date1.png"); break;
			case 14: place.setPlaceIconName("드라이브"); place.setPlaceIconPath("img/placeicon/drive1.png"); break;
			default: System.out.println("오류"); break;
		}
		//System.out.println(place.getPlaceIconName());
		//System.out.println(place.getPlaceIconPath());
		//mapNo
		//mngNo
		//memNo
		place.setManagement(new Management(3L));
		
		/*임시용 mapNo => 앞에서 받아오기*/
		place.setTheme(new Theme(183L));
		place.setMember(new Member(81L));
		///////////////////////////////////////////////
		
		// 플레이스 사진 등록
		List<MultipartFile> fileList = place.getFile();
		
		for(MultipartFile file : fileList) {
			String fileName = file.getOriginalFilename();
			long fileSize =  file.getSize();
		}
		
		//placePhoto.setPpPath(totalTag);
		
		
		
		
		/////////////////////////////////////////////////
		placeService.insert(place);
		
		//return "redirect:/map/mapList"+mapNo;	//나중에 테마지도 페이지
		//return "redirect:/place/placeInsertForm";	//임시용
		return "redirect:/map/mapRead/183";	//임시용
	}
	
	
	/**
	 * 		내가 작성한 댓글 / 포토후기
	 * */
	@RequestMapping("/myReplyReview/placeNo={placeNo}&memId={memId}")
	public ModelAndView myReplyReview(@PathVariable Long placeNo, @PathVariable String memId) {
		 List<PlaceReview> prList= prService.selectByPlaceNoMemId(placeNo, memId);
		 List<PlacePhotoReview> pprList = prService.selectByMemIdPlaceNo(placeNo, memId);
		 Place place = placeService.selectBy(placeNo);
		 
		 ModelAndView mv = new ModelAndView();
		mv.setViewName("place/myReplyReview");
		mv.addObject("prList", prList);
		mv.addObject("pprList", pprList);
		mv.addObject("place", place);
		
		return mv;
	}
	
	/**
	 * 	 내 댓글 삭제하기
	 * */
	@RequestMapping("/placeReplyDelete/placeNo={placeNo}&memId={memId}/{prNo}")
	public String placeReplyDelete(@PathVariable Long placeNo, @PathVariable String memId,@PathVariable Long prNo) {
		prService.delete(prNo);
		return "redirect:/place/myReplyReview/placeNo="+placeNo+"&memId="+memId;
	}
	/**
	 * 		내 포토후기 삭제하기
	 * */
	@RequestMapping("/photoReviewDelete/placeNo={placeNo}&memId={memId}/{pprNo}")
	public String photoReviewDelete(@PathVariable Long placeNo, @PathVariable String memId, @PathVariable Long pprNo) {
		prService.prDelete(pprNo);
		return "redirect:/place/myReplyReview/placeNo="+placeNo+"&memId="+memId;
	}
	
	/**
	 * 		내 댓글 수정하기
	 * */
	@RequestMapping("/placeReplyUpdate/placeNo={placeNo}&memId={memId}/{prNo}")
	public String placeReplyUpdate(@PathVariable Long placeNo, @PathVariable String memId,@PathVariable Long prNo, PlaceReview placeReview) {
		PlaceReview dbPlaceReview = prService.prUpdate(placeReview);
		System.out.println("placeReview = " + placeReview.getPrNo());
		System.out.println("dbPlaceReview.getPrNo() = " +dbPlaceReview.getPrNo());
		System.out.println("dbPlaceReview.getPrContent() = "+dbPlaceReview.getPrContent());
		return "redirect:/place/myReplyReview/placeNo="+placeNo+"&memId="+memId;
	}
	
	/**
	 * 		내 포토후기 수정하기
	 * */
	@RequestMapping("/placePhotoReviewUpdate/placeNo={placeNo}&memId={memId}/{pprNo}")
	public String placePhotoReviewUpdate(@PathVariable Long placeNo, @PathVariable String memId,@PathVariable Long pprNo, PlacePhotoReview placePhotoReview) {
		PlacePhotoReview dbPpr = prService.prrUpdate(placePhotoReview);
//		System.out.println("placePhotoReview = " + placePhotoReview.getPprNo());
//		System.out.println("dbPpr.getPprNo() = " +dbPpr.getPprNo());
//		System.out.println("dbPpr.getPprContent() = "+dbPpr.getPprContent());
		return "redirect:/place/myReplyReview/placeNo="+placeNo+"&memId="+memId;
	}
	

	
}
