package kosta.mapda.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BasicController {
	
	@RequestMapping("/")
	public String base() {
		return "main/index";
	}
	
	@RequestMapping("/about")
	public String about() {
		return "main/about";
	}
	
	@RequestMapping("/blog")
	public String blog() {
		return "main/blog";
	}
	
	@RequestMapping("/blog-details")
	public String blogDetails() {
		return "main/blog-details";
	}
	
	@RequestMapping("/contact")
	public String contact() {
		return "main/contact";
	}
	
	@RequestMapping("/main/index")
	public void index() {
	}
	
	@RequestMapping("/listing")
	public String listing() {
		return "main/listing";
	}
	
	@RequestMapping("/listing-details")
	public String listingDetails() {
		return "main/listing-details";
	}
}
