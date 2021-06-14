package kosta.mapda.controller.place;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class KakaoApiController {
	/**
	 * 		place=>  kakao api 를 통해서 찾는 폼
	 * */
	@RequestMapping("/kakaoMapApi/searchPlace")
	public String searchPlace() {
		return "kakaoMapApi/searchPlace";
	}
}
