package kosta.mapda.controller.member;

import org.springframework.web.bind.annotation.RequestMapping;

public class AjaxController {
/**
 * 후기게시물 좋아요
 * */
	@RequestMapping("/event/like")
	public String like(Long evNo) {
		return null;
	}
}
