package kosta.mapda.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kosta.mapda.domain.enterprise.EnterprisePost;
import kosta.mapda.service.EnterprisePostService;

@Controller
public class EnterprisePostController {
	
	@Autowired
	private EnterprisePostService service;
	
	@RequestMapping("/list")
	public String postList(Model model, @RequestParam(defaultValue = "0") int nowpage) {
		Pageable pageable = PageRequest.of(nowpage, 10, Direction.DESC, "epNo");
		Page<EnterprisePost> enterprisePostList = service.selectAll(pageable);
		model.addAttribute("enterprisePostList", enterprisePostList);
		return "enterprise/list";
	}
}