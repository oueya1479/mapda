package kosta.mapda.controller.young;

import java.io.File;
import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import kosta.mapda.domain.map.Theme;
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
		
		mapService.insertMap(theme);
		
		return"redirect:/map/list";
	}
	/**
	 * 테마지도 전체 목록 가져오기
	 */
	@RequestMapping("/mapList")
	public void list(Model model, @RequestParam(defaultValue = "0") int nowPage) {
		Pageable pageable = PageRequest.of(nowPage, 10, Direction.DESC, "mapNo");
		Page<Theme> mapList = mapService.selectAll(pageable);
		model.addAttribute("mapList", mapList);
		
	}
}
