package kosta.mapda.controller.point;

import java.util.List;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

/**
 *  비동기화
 * */
@RestController
@RequestMapping("/point")
public class PointRestController {

	/**
	 * 각 게시물들의 객체값을 받아 포인트 적립처리 
	 * */
	@RequestMapping(value= "/pointPlus", produces = "text/html;charset=UTF-8")
	public void pointPlus(@RequestParam(value= "id") List<String> values, Model model) {
		System.out.println(values);
	}
}
