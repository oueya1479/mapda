package kosta.mapda.controller.young;

import javax.servlet.http.HttpServletRequest;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kosta.mapda.domain.map.Theme;
import lombok.RequiredArgsConstructor;

@RequestMapping("/mapnage")
@RequiredArgsConstructor
@Controller
public class ManageController {

	/**
	 * 좋아요한 지도 목록 출력
	 */
	@RequestMapping("/likeMaps")
	public void likeMaps(Long memId, HttpServletRequest request, Model model, @RequestParam(defaultValue = "0") int nowPage) {
		
//		Pageable pageable = PageRequest.of(nowPage, 10, Direction.DESC, "memNo");
//		Page<Theme> likeList = manageService.likeList(pageable);
//		model.addAttribute("likeList", likeList);
		
				
	}
	
	/**
	 * 구독하는 지도 목록 출력
	 */
	@RequestMapping("/subMaps")
	public void subMaps(Long memId, HttpServletRequest request, Model model, @RequestParam(defaultValue = "0") int nowPage) {
		
//		Pageable pageable = PageRequest.of(nowPage, 10, Direction.DESC, "memNo");
//		Page<Theme> subList = manageService.subList(pageable);
//		model.addAttribute("subList", subList);
		
				
	}
	
}
