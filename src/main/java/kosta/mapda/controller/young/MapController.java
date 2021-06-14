package kosta.mapda.controller.young;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kosta.mapda.domain.map.Place;
import kosta.mapda.domain.map.Theme;
import kosta.mapda.domain.member.Member;
import kosta.mapda.service.young.MapService;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/map")
public class MapController {

	@Autowired
	private final MapService mapService;
	
	private final String SAVE_PATH="/Users/soyoung/Desktop/fileSave";

	
	/**
	 * 테마지도 등록 폼
	 */
	@RequestMapping("/insertForm")
	public void insertForm() {
		
	}
	/**
	 * 테마지도 등록하기
	 */
	@RequestMapping("/insertMap")
	public String insertMap(Theme theme) throws IOException{
		MultipartFile file=theme.getFile();
		if(file.getSize()>0) {
			String fileName = file.getOriginalFilename();
			theme.setMapImg(fileName);
			
			file.transferTo(new File(SAVE_PATH+"/"+fileName));
		}
		
		Member member = new Member();
		member.setMemNo(1L);
		theme.setMember(member);
		
		mapService.insertMap(theme);
		
		return"redirect:/map/list";
	}
	/**
	 * 테마지도 전체 목록 가져오기
	 */
	@RequestMapping("/mapList")
	public void list(HttpServletRequest request, Model model, @RequestParam(defaultValue = "0") int nowPage) {
		Pageable pageable = PageRequest.of(nowPage, 10, Direction.DESC, "mapNo");
		Page<Theme> mapList = mapService.selectAll(pageable);
		model.addAttribute("mapList", mapList);
		
		//나중에 제거하세요
		HttpSession session = request.getSession();
		Member member = new Member();
		member.setMemNo(1L);
		session.setAttribute("member", member);
		//
		
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
	public ModelAndView modifyMap(Long mapNo) {
		Theme theme= mapService.selectBy(mapNo, false);
		return new ModelAndView("map/modifyMap", "theme", theme);
	}
	
	/**
	 * 수정 완료
	 */
	@RequestMapping("/modifyMap")
	public ModelAndView modifyMap(Theme theme) {
		Theme mapInfo = mapService.modifyMap(theme);
		
		return new ModelAndView("map/mapList", "theme", mapInfo);
	}
	
	/**
	 * 삭제
	 */
	@RequestMapping("/deleteMap")
	public String delete(Long mapNo, String password) {
		mapService.deleteMap(mapNo, password);
		return "redirect:/map/mapList";
	}
	
	
	
}
