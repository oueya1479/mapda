package kosta.mapda.controller.point;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kosta.mapda.domain.service.MyPoint;

@Controller
@RequestMapping("/point")
public class PointController {
	/**
	 * 누적된 포인트 리스트 가져오기
	 */
	public ModelAndView mapPointList() {
		
		
		List<MyPoint> myPointList;
		ModelAndView mv = new ModelAndView();
		
		return mv;
	}
	
}
