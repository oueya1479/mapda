package kosta.mapda.controller.point;

import java.util.List;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import kosta.mapda.domain.member.Member;

/**
 *  비동기화
 * */
@RestController
@RequestMapping("/point")
public class PointRestController {

	/**
	 *  포인트 적립처리 
	 * */
	@RequestMapping(value= "/pointPlus")
	public int pointPlus(List<String> postObject , Model model) {
		
		Member mem = (Member)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		
		System.out.println("postObject");
		
		int resultCode = 1;
		
		try {//적립완료
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return resultCode;
	}
}
