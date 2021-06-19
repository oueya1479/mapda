package kosta.mapda.controller.place;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kosta.mapda.domain.Management;
import kosta.mapda.domain.map.Place;
import kosta.mapda.domain.map.PlacePhoto;
import kosta.mapda.domain.map.PlacePhotoReview;
import kosta.mapda.domain.map.PlacePhotoReviewPhoto;
import kosta.mapda.domain.map.PlaceReview;
import kosta.mapda.domain.map.PlaceStorage;
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
	
	//private final String SAVE_PATH = "C:\\KostaEdu\\thirdProject\\fileSave";
	//C:\KostaEdu\Spring\SpringWork\mapda\src\main\resources\static\img\placeimges
	
	/**
	 * 		상세보기
	 * */
	@RequestMapping("/read/{placeNo}")
	public ModelAndView read(@PathVariable Long placeNo) {
		int starAvg=0;
		int starAvgPer=0;
		
		// hidden place 인지 확인
		Member mem = (Member)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		System.out.println("mem.getMemId() =  " + mem.getMemId());
		System.out.println("mem.getMemPaystatus() = " + mem.getMemPaystatus());

		
		Place place = placeService.selectBy(placeNo);
		
		if(mem.getMemPaystatus()==0 && place.getPlaceHidden()==1) {
			throw new RuntimeException("히든플레이스의 경우, 결제회원만 접근 가능합니다!");
		}
		
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
		mv.addObject("ppListSize", ppList.size());
		return mv;
	}
	
	/**
	 * 		댓글 등록하기
	 * */
	@RequestMapping("/replyWrite")
	public String insert(PlaceReview placeReview, Long placeNo, Member member, Management management,
			HttpServletRequest request, HttpServletResponse response) {
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
	 * 		포토리뷰 등록하기 폼
	 * */
	@RequestMapping("/photoReviewForm")
	public void photoReviewForm(Model model, Long placeNo, Long memNo) {
		model.addAttribute("placeNo", placeNo);
		model.addAttribute("memNo", memNo);
	}
	
	/**
	 * 		포토리뷰 등록하기
	 * */
	@RequestMapping("/photoReviewInsert")
	public String photoReviewInsert(
			PlacePhotoReview placePhotoReview, Long placeNo, HttpServletRequest request,
			PlacePhotoReviewPhoto pprp, HttpSession session) throws IOException, IllegalStateException{
		
		placePhotoReview.setManagement(new Management(5L));
		placePhotoReview.setPlace(new Place(placeNo));
		Member member = (Member)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		System.out.println("memNo= " + member.getMemNo());
		placePhotoReview.setMember(member);
		System.out.println("memId = " + member.getMemId());
		placePhotoReview.setPprStatus(1);
		System.out.println("placeNo = " + placeNo);
		
		List<MultipartFile> fileList = pprp.getFiles();
		
		List<PlacePhotoReviewPhoto> pprpList = new ArrayList<PlacePhotoReviewPhoto>();
		
		ServletContext application = session.getServletContext();
		String path = application.getRealPath("/WEB-INF/save");
		for(MultipartFile mf : fileList) {
			if(mf.getSize()>0) {
				PlacePhotoReviewPhoto photo = new PlacePhotoReviewPhoto();
				photo.setPpr(placePhotoReview);
				String fileName = mf.getOriginalFilename();
				photo.setPprpPath(fileName);
				mf.transferTo(new File(path + "/" + fileName));
				pprpList.add(photo);
			}
		}
		System.out.println("pprpList = " + pprpList);
		
		prService.prInsert(placePhotoReview , pprpList);//부모
		
		//prService.insertPprPhoto(pprpList);
		
		
		
		return "redirect:/place/read/"+placeNo;
	}
	
	/**
	 * 		플레이스 등록하기 폼
	 * */
	@RequestMapping("/placeInsertForm")
	public void placeInsertForm(Model model, Long mapNo , Long memNo) {
		model.addAttribute("mapNo", mapNo);
		model.addAttribute("memNo", memNo);
	}
	
	/**
	 * 		플레이스 수정하기 폼
	 * */
	@RequestMapping("/placeUpdateForm")
	public ModelAndView placeUpdateForm(Model model ,Long placeNo) {
		Place place = placeService.selectBy(placeNo);	//db에서 꺼내옴
		
		// 해쉬태그 #기준으로 나눔
		List<String> tagStr=new ArrayList<String>();
		String dbTag =place.getPlaceTag();	//db에서 꺼낸거 //#kosta#한식#맛#강추#꼭가요#가즈아#다있어
		String [] hashStr = dbTag.split("#");
		for(int i=1; i<hashStr.length; i++) {
			tagStr.add(hashStr[i]);
		}
		model.addAttribute("tagStrLen", tagStr.size());
		model.addAttribute("tagStr", tagStr);
		return new ModelAndView("place/placeUpdateForm", "place", place);
	}
	
	/**
	 * 		플레이스 수정하기 완료
	 * */
	@RequestMapping("/placeUpdate")
	public String placeUpdate(Place place) {
		place.setManagement(new Management(3L));
		
		System.out.println("PlaceController placeUpdate place = " + place);
		Place dbPlace = placeService.update(place);
		
		
		System.out.println("PlaceController placeUpdate dbPlace = " + dbPlace);
		System.out.println("dbPlace.getPlaceNo() = " + dbPlace.getPlaceNo() );
		//"place/read/"+dbPlace.getPlaceNo()
		//return new ModelAndView("place/read", "place", dbPlace);
		return "redirect:/place/read/"+dbPlace.getPlaceNo();
	}
	
	/**
	 * 		플레이스 등록하기
	 * */
	@RequestMapping("/placeInsert")
	public String placeInsert(Place place, Long mapNo, HttpServletRequest request, Member member, 
			PlacePhoto placePhoto,HttpSession session) throws IllegalStateException, IOException{
		
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
			case 1: place.setPlaceIconName("맛집"); place.setPlaceIconPath("food1.png"); break;
			case 2: place.setPlaceIconName("여행"); place.setPlaceIconPath("travel1.png"); break;
			case 3: place.setPlaceIconName("카페"); place.setPlaceIconPath("cafe1.png"); break;
			case 4: place.setPlaceIconName("힐링"); place.setPlaceIconPath("healing1.png"); break;
			case 5: place.setPlaceIconName("자연"); place.setPlaceIconPath("nature1.png"); break;
			case 6: place.setPlaceIconName("액티비티"); place.setPlaceIconPath("activity1.png"); break;
			case 7: place.setPlaceIconName("쇼핑"); place.setPlaceIconPath("shopping1.png"); break;
			case 8: place.setPlaceIconName("문화"); place.setPlaceIconPath("culture1.png"); break;
			case 9: place.setPlaceIconName("산책"); place.setPlaceIconPath("walking1.png"); break;
			case 10: place.setPlaceIconName("야경"); place.setPlaceIconPath("night1.png"); break;
			case 11: place.setPlaceIconName("명소"); place.setPlaceIconPath("attraction1.png"); break;
			case 12: place.setPlaceIconName("반려동물"); place.setPlaceIconPath("pet1.png"); break;
			case 13: place.setPlaceIconName("데이트"); place.setPlaceIconPath("date1.png"); break;
			case 14: place.setPlaceIconName("드라이브"); place.setPlaceIconPath("drive1.png"); break;
			default: System.out.println("오류 place.getPlaceIconNo()"); break;
		}
		
		place.setManagement(new Management(3L));
		place.setTheme(new Theme(mapNo));
		place.setMember(new Member(member.getMemNo()));
		place.setPlaceStatus(1);
		// 플레이스 사진 등록
		
		List<MultipartFile> fileList = placePhoto.getFiles();
		List<PlacePhoto> photoList = new ArrayList<PlacePhoto>();
		
		ServletContext application = session.getServletContext();
		String path = application.getRealPath("/WEB-INF/save");
		
		for(MultipartFile mf : fileList) {
			if(mf.getSize()>0) {
				PlacePhoto photo = new PlacePhoto();
				photo.setPlace(place);
				
				String fileName = mf.getOriginalFilename();
				photo.setPpPath(fileName);
				//mf.transferTo(new File(SAVE_PATH + "/" + fileName));
				mf.transferTo(new File(path + "/" + fileName));
				photoList.add(photo);
			}
		}
		
		placeService.insert(place, photoList);
		//placeService.insertPlacePhoto(photoList);
		return "redirect:/map/mapRead/"+mapNo;
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
	 * 		플레이스 삭제하기
	 * */
	@RequestMapping("/placeDelete")
	public String placeDelete(Long placeNo) {
		placeService.delete(placeNo);
		
		//return "redirect:/map/mapRead/"+mapNo;		//수정하기
		return "redirect:/";		//수정하기
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
		return "redirect:/place/read/"+placeNo;
	}
	
	/**
	 * 		내 포토후기 수정하기
	 * */
	@RequestMapping("/placePhotoReviewUpdate/placeNo={placeNo}&memId={memId}/{pprNo}")
	public String placePhotoReviewUpdate(@PathVariable Long placeNo, @PathVariable String memId,@PathVariable Long pprNo, PlacePhotoReview placePhotoReview) {
		prService.prrUpdate(placePhotoReview);
		return "redirect:/place/read/"+placeNo;
	}
	
	/**
	 * 		좋아요(구독한) 플레이스 목록 출력
	 * */
	@RequestMapping("/likePlaces")
	public void likePlaces(Model model) {
		Member mem = (Member)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		Long memNo = mem.getMemNo();
		List<PlaceStorage> psList = placeService.selectByMemPlace(memNo);
		String memId = psList.get(0).getMember().getMemId();
		model.addAttribute("psList", psList);
		model.addAttribute("memId", memId);
	}
}
