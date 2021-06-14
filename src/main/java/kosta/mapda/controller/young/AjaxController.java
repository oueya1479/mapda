package kosta.mapda.controller.young;

import java.util.Map;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import lombok.RequiredArgsConstructor;


@RequiredArgsConstructor
@RestController
public class AjaxController {
	
	
	/**
	 * 테마지도 구독
	 */
	@RequestMapping("/map/subscribe")
	public Map<String, Object> subscribe(@RequestParam Map<String, Object> commandMap) {

		return null;
	}
	
	/**
	 * 테마지도 좋아요
	 */
	@RequestMapping("/map/like")
	public String like(Long mapNo) {
		return null;
	}
}
