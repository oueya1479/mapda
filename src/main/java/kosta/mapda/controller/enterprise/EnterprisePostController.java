package kosta.mapda.controller.enterprise;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kosta.mapda.domain.Management;
import kosta.mapda.domain.enterprise.Enterprise;
import kosta.mapda.domain.enterprise.EnterpriseCategory;
import kosta.mapda.domain.enterprise.EnterprisePost;
import kosta.mapda.domain.enterprise.EnterpriseReply;
import kosta.mapda.service.enterprise.EnterprisePostService;
import kosta.mapda.service.enterprise.EnterpriseReplyService;

@Controller
@RequestMapping("/enterprise")
public class EnterprisePostController {
	
	@Autowired
	private EnterprisePostService postService;
	
	@Autowired
	private EnterpriseReplyService replyService;
	
	@RequestMapping("/list")
	public String postList(Model model, @RequestParam(defaultValue = "0") int nowpage) {
		Pageable pageable = PageRequest.of(nowpage, 10, Direction.DESC, "epNo");
		Page<EnterprisePost> enterprisePostList = postService.selectAll(pageable);
		model.addAttribute("enterprisePostList", enterprisePostList);
		return "enterprise/list";
	}
	
	@RequestMapping("/writeForm")
	public void writeForm() {}
	
	@RequestMapping("/write")
	public ModelAndView write(EnterprisePost post) {
		
		//임시용
		Enterprise enterprise = postService.getEnterprise();
		post.setEnterprise(enterprise);
		
		EnterpriseCategory c = new EnterpriseCategory();
		c.setCgNo(1L);
		c.setCategory("카페");
		post.setCategory(c);
		
		Management m = new Management(1L, "ENTERPRISE_POST");
		post.setManagement(m);
		//
		
		postService.insertPost(post);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/list");
		return mv;
	}
	
	@RequestMapping("/post/{epNo}")
	public String post(Model model, @PathVariable Long epNo) {
		EnterprisePost post = postService.getPost(epNo);
		List<EnterpriseReply> replyList = replyService.getReply(epNo);
		model.addAttribute("post", post);
		model.addAttribute("replyList", replyList);
		return "enterprise/post";
	}
}