package kosta.mapda.controller.enterprise;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kosta.mapda.domain.enterprise.Enterprise;
import kosta.mapda.domain.enterprise.EnterprisePost;
import kosta.mapda.service.enterprise.EnterpriseService;

@Controller
@RequestMapping("/enterprise")
public class EnterpriseController {
	
	@Autowired
	private EnterpriseService service;
	
	/**
	 * 엔터프라이즈 리스트를 가져오는 메소드
	 */
//	@RequestMapping("list")
//	public void list(Model model, @RequestParam(defaultValue = "0") int nowpage) {
//		Pageable pageable = PageRequest.of(nowpage, 10, Direction.DESC, "bno");
//		Page<Enterprise> enterpriseList = service.selectAll(pageable);
//		model.addAttribute("enterpriseList", enterpriseList);
//	}
	
	/**
	 * 엔터프라이즈 프로필 출력 메소드
	 */
	@RequestMapping("/profile/{memNo}")
	public ModelAndView selectEnterprise(@PathVariable Long memNo) {
		Enterprise enterprise = service.selectEnterprise(memNo);
		ModelAndView mv = new ModelAndView("enterprise/profile", "enterprise", enterprise);
		return mv;
	}
}
