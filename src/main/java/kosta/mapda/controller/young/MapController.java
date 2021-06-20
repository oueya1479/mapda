package kosta.mapda.controller.young;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kosta.mapda.domain.Management;
import kosta.mapda.domain.map.MapCategory;
import kosta.mapda.domain.map.MapStorage;
import kosta.mapda.domain.map.Place;
import kosta.mapda.domain.map.Theme;
import kosta.mapda.domain.member.Member;
import kosta.mapda.service.young.MapService;

@Controller

@RequestMapping("/map")
public class MapController {

	@Autowired
	private  MapService mapService;
	
	private final String path = "/Users/soyoung/Desktop/fileSave";	

	/**
	 * 테마지도 등록 폼
	 * -> 정기결제 payStatus 1 or 0 
	 */
	@RequestMapping("/insertForm")
	public String insertForm() {
		Member mem = (Member) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		Member member = mapService.getMember(mem.getMemNo());
		System.out.println("@@@@@@@@@@");
		System.out.println(member.getMemNo());
		System.out.println(member.getMapList());
		if(member.getMemPaystatus()==1) {
			return "map/insertForm"; 
		}else if(member.getMapList().size() >= 3) {
			return "member/pay";
		}else {
			return "map/insertForm"; 
		}
		
	}
	
	/**
	 * 테마지도 등록하기
	 */
	@RequestMapping("/insertMap")
	public String insertMap(Theme theme, Long mno, Long categoryNo, HttpSession session) throws IOException{
		Member member = new Member();
		member.setMemNo(mno);
		theme.setMember(member);
		//관리번호 임의로 넣어주기
		Management manage = new Management();
		manage.setMngNo(2L);
		theme.setManagement(manage);
		//카테고리번호 객체로
		MapCategory category = new MapCategory();
		category.setCategoryNo(categoryNo);
		theme.setMapCategory(category);
		
		
		MultipartFile file=theme.getFile();
		if(file.getSize()>0) {
			
			String fileName = file.getOriginalFilename();
			theme.setMapImg(fileName);
			ServletContext application = session.getServletContext();
			
//			String webPath = "/static/save";
//			String realPath = application.getRealPath(webPath);
//			
//			File f = new File(realPath);
//			if(f.exists()) 
//				f.mkdirs();
//			realPath += File.separator +fileName;
//			File saveFile = new File(realPath);
			
			file.transferTo(new File(path+"/"+fileName));
		}
		
//		String content = theme.getMapContent().replace("<", "&lt;");
//		theme.setMapContent(content);
		
		mapService.insertMap(theme);
		
		return"redirect:/map/mapList";
	}
	
	/**
	 * 테마지도 전체 목록 가져오기
	 */
	@RequestMapping("/mapList")
	public void list(HttpServletRequest request, Model model, @RequestParam(defaultValue = "0") int nowPage) {
		
		Pageable pageable = PageRequest.of(nowPage, 10, Direction.DESC, "mapNo");
		Page<Theme> mapList = mapService.selectAll(pageable);
		
		Member mem = (Member)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		Long memNo = mem.getMemNo();
		
		List<MapStorage> mapStorage = mapService.selectByMapNo(memNo);
		
		model.addAttribute("mapList", mapList);
		model.addAttribute("mapStorage", mapStorage);	
		
	}
	/**
	 * 상세보기
	 */
	@RequestMapping("/mapRead/{mapNo}")
	public ModelAndView mapRead(@PathVariable Long mapNo, String flag, Place place) {
		//조회수
		boolean state = flag==null?true : false;
		Theme theme = mapService.selectBy(mapNo, true);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("map/mapRead");
		mv.addObject("themeMap", theme);
		
		return mv;
	}
	
	/**
	 * 수정 폼
	 */
	@RequestMapping("/modifyForm")
	public ModelAndView modifyMap(Long mapNo, HttpSession session/*, Theme theme*/)throws IOException {
//		MultipartFile file=theme.getFile();
//		if(file.getSize()>0) {
//			String fileName = file.getOriginalFilename();
//			theme.setMapImg(fileName);
//			ServletContext application = session.getServletContext();
//			String path = application.getRealPath("/img/save");
//			file.transferTo(new File(path+"/"+fileName));
//		}
		
		Theme theme= mapService.selectBy(mapNo, false);
		return new ModelAndView("map/modifyMap", "theme", theme);
	}
	
	/**
	 * 수정 완료
	 */
	@RequestMapping("/modifyMap")
	public ModelAndView modifyMap(Theme theme) {
		Theme mapInfo = mapService.modifyMap(theme);
		return new ModelAndView("redirect:/map/mapList", "theme", mapInfo);
	}
	
	/**
	 * 삭제 
	 */
	@RequestMapping("/deleteMap")
	public String delete(Long mapNo,  String pwd ) throws Exception {
		mapService.deleteMap(mapNo);
		return "redirect:/map/mapList";
	}
	
	
	/**
	 * 지도 관리 페이지 - 로그인한 회원이 등록한 전체 테마지도 출력
	 */
	@RequestMapping("/manageMap/{memNo}")
	public ModelAndView myMaps(@PathVariable Long memNo) {
		List<Theme> themeList = mapService.myMaps(memNo);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("map/manageMap");
		mv.addObject("themeList", themeList);
		return mv;
		
	}
	
	
	/**
	 * 좋아요한 지도 목록 출력
	 */
	@RequestMapping("/likeMaps")
	public void likeMaps(Long memId, HttpServletRequest request, Model model, @RequestParam(defaultValue = "0") int nowPage) {
		
	}
	
	/**
	 * 구독하는 지도 목록 출력
	 */
	@RequestMapping("/subMaps")
	public void subMaps(Model model) {
		Member mem = (Member)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		Long memNo = mem.getMemNo();
		List<MapStorage> mapStorage = mapService.selectByMapNo(memNo);
		String memId = mapStorage.get(0).getMember().getMemId();
		model.addAttribute("mapStorage", mapStorage);
		model.addAttribute("memId", memId);
			
	}
	
	/**
	 * 지도 검색 - 카테고리별
	 */
	@RequestMapping("/selectedMaps")
	public void selectByCategory(Long categoryNo, Model model, String keyWord) {
		System.out.println("categoryNo = "+categoryNo);
		System.out.println("keyWord = "+keyWord);
		
		List<Theme> mapList=null;
		if(categoryNo!=0 && keyWord.equals("")) {
			mapList = mapService.selectByCategory(categoryNo);
		}else if(categoryNo==0 && !keyWord.equals("")) {
			mapList = mapService.selectByKeyWord(keyWord);
		}else {
			mapList = mapService.selectByKeyAndCategory(keyWord, categoryNo);
		}
		model.addAttribute("mapList", mapList);
	}

	
}



