package kosta.mapda.controller.enterprise;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kosta.mapda.domain.Management;
import kosta.mapda.domain.enterprise.Enterprise;
import kosta.mapda.domain.enterprise.EnterpriseCategory;
import kosta.mapda.domain.enterprise.EnterprisePost;
import kosta.mapda.domain.enterprise.EnterprisePostImage;
import kosta.mapda.domain.enterprise.EnterpriseReply;
import kosta.mapda.domain.member.Member;
import kosta.mapda.service.enterprise.EnterprisePostService;
import kosta.mapda.service.enterprise.EnterpriseReplyService;

@Controller
@RequestMapping("/enterprise")
public class EnterprisePostController {
	
	@Autowired
	private EnterprisePostService postService;
	
	@Autowired
	private EnterpriseReplyService replyService;
	
	private final String SAVE_PATH="/Users/oueya/Desktop/PHOTO/test";
	
	@RequestMapping("/list")
	public String postList(Model model, @RequestParam(defaultValue = "0") int nowpage) {
		Pageable pageable = PageRequest.of(nowpage, 10, Direction.DESC, "epNo");
		Page<EnterprisePost> enterprisePostList = postService.selectAll(pageable);
		List<EnterprisePost> list = enterprisePostList.getContent();
		for(int i = 0; i < list.size(); i++) {
			if(list.get(i).getEpTag() != null) {
				String [] args = list.get(i).getEpTag().split("/");
				String str = "";
				if(args.length != 1) {
					for(int j = 0; j < args.length; j++) {
						str += "#" + args[j] + " ";
					}
					list.get(i).setEpTag(str);
				}
			}
		}
		List<EnterpriseCategory> categories = postService.getCategory();
		model.addAttribute("enterprisePostList", enterprisePostList);
		model.addAttribute("categories", categories);
		return "enterprise/list";
	}
	
	@RequestMapping("/writeForm")
	public void writeForm() {}
	
	@RequestMapping("/write")
	public ModelAndView write(EnterprisePost post, EnterprisePostImage image) throws IllegalStateException, IOException {
		
		Member mem = (Member)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		Long memNo = mem.getMemNo();
		Enterprise enterprise = new Enterprise();
		enterprise.setMemNo(memNo);
		post.setEnterprise(enterprise);
		image.setEnterprisePost(post);
		
		EnterpriseCategory category = new EnterpriseCategory();
		category.setCgNo(1L);
		Management management = new Management();
		management.setMngNo(1L);
		post.setCategory(category);
		post.setManagement(management);
		
		List<MultipartFile> file = image.getFiles();
		for(MultipartFile m : file) {
			if(m.getSize()>0) {
				String fileName = m.getOriginalFilename();
				image.setImageSource(fileName);
				m.transferTo(new File(SAVE_PATH+"/"+fileName));
				postService.insertPostImage(image);
			}
		}
		postService.insertPost(post);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/enterprise/list");
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