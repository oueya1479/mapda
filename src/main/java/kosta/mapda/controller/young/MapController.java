package kosta.mapda.controller.young;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kosta.mapda.domain.map.Map;
import kosta.mapda.service.young.MapService;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/map")
public class MapController {

	@Autowired
	private final MapService mapService;
	
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
	public String insertMap(Map map) {
		mapService.insertMap(map);
		return"redirect:/map/list";
	}
	/**
	 * 테마지도 전체 목록 가져오기
	 */
	@RequestMapping("/list")
	public void list(Model model, @RequestParam(defaultValue = "0") int nowPage) {
		Pageable pageable = PageRequest.of(nowPage, 10, Direction.DESC, "mapNo");
		Page<Map> mapList = mapService.selectAll(pageable);
		model.addAttribute("mapList", mapList);
		
	}
}
