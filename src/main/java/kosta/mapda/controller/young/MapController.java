package kosta.mapda.controller.young;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.security.sasl.AuthenticationException;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kosta.mapda.domain.Management;
import kosta.mapda.domain.map.MapCategory;
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

	private final PasswordEncoder passwordEncoder;
	
	
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
	public String insertMap(Theme theme, Long mno, Long categoryNo) throws IOException{
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
			
			file.transferTo(new File(SAVE_PATH+"/"+fileName));
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
		model.addAttribute("mapList", mapList);
		
				
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
		
		return new ModelAndView("redirect:/map/mapList", "theme", mapInfo);
	}
	
	/**
	 * 삭제
	 */
	@RequestMapping("/deleteMap")
	public String delete(Long mapNo, String password) {
		mapService.deleteMap(mapNo, password);
		return "redirect:/map/mapList";
	}
	
	
	/**
	 * 지도 관리 페이지 - 로그인한 회원이 등록한 전체 테마지도 출력
	 */
	@RequestMapping("/manageMap/{memId}")
	public ModelAndView myMaps(Long memNo) {
		List<Theme> themeList = mapService.myMaps(memNo);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("map/manageMap");
		mv.addObject("themeList", themeList);
		return mv;
	}
	
	
	

	
	
}



