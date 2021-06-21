package kosta.mapda.controller.enterprise;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

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
	public void writeForm(Model model) {
		List<EnterpriseCategory> categories = postService.getCategory();
		model.addAttribute("categories", categories);
	}
	
	@RequestMapping("/write")
	public ModelAndView write(HttpSession session, EnterprisePost post, EnterprisePostImage image, EnterpriseCategory category) throws IllegalStateException, IOException {
		
		Member mem = (Member)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		Long memNo = mem.getMemNo();
		Enterprise enterprise = new Enterprise();
		enterprise.setMemNo(memNo);
		post.setEnterprise(enterprise);
		
		Management management = new Management();
		management.setMngNo(1L);
		post.setCategory(category);
		post.setManagement(management);
		
		ServletContext application = session.getServletContext();
		String path = application.getRealPath("/resources");
		List<MultipartFile> file = image.getFiles();
		List<EnterprisePostImage> imageList = new ArrayList<EnterprisePostImage>();
		
		for(MultipartFile m : file) {
			if(m.getSize()>0) {
				EnterprisePostImage test = new EnterprisePostImage();
				test.setEnterprisePost(post);
				String fileName = m.getOriginalFilename();
				test.setImageSource(fileName);
				m.transferTo(new File(path+"/"+fileName));
				imageList.add(test);
			}
		}
		
		MultipartFile f = post.getFile();
		String fileName = f.getOriginalFilename();
		post.setEpLogo(fileName);
		f.transferTo(new File(path + "/" + fileName));
		
		postService.insertPostImage(imageList);
		postService.insertPost(post);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/enterprise/list");
		return mv;
	}
	
	@RequestMapping("/post/{epNo}")
	public String post(Model model, @PathVariable Long epNo, @RequestParam(defaultValue = "0") int nowpage) {
		EnterprisePost post = postService.getPost(epNo);
		Member member = (Member) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		List<EnterpriseReply> replyList = replyService.getReply(epNo);
		Pageable pageable = PageRequest.of(nowpage, 10, Direction.DESC, "epNo");
		Page<EnterprisePost> enterprisePostList = postService.selectAll(pageable);
		List<EnterpriseCategory> categories = postService.getCategory();
		model.addAttribute("post", post);
		model.addAttribute("replyList", replyList);
		model.addAttribute("enterprisePostList", enterprisePostList);
		model.addAttribute("name", member.getMemName());
		model.addAttribute("categories", categories);
		return "enterprise/post";
	}
	
	@RequestMapping("/addReply/{epNo}")
	public String addReply(@PathVariable Long epNo, EnterpriseReply enterpriseReply) {
		Member member = (Member) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		replyService.addReply(epNo, enterpriseReply, member);
		return "redirect:/enterprise/post/" + epNo;
	}
}