package kosta.mapda.controller.member;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.ModelAndView;

import kosta.mapda.domain.member.Member;
import kosta.mapda.service.member.LikesService;
//
//@Controller
//public class LikesController {
//
//	@Autowired
//	private LikesService likesService; 
//	
//	@Override
//	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response)
//			throws ServletException, IOException {
//		return null;
//	}
//	
//	public ModelAndView selectLikes(HttpServletRequest request, HttpServletResponse response) throws Exception{
//		HttpSession session = request.getSession();
//		Member dbMember = (Member) session.getAttribute("member");
//		
//		List<Likes> list = likesService.selectLikes(dbMember.getMbCode());
//		session.setAttribute("list", list);
//		ModelAndView mv = new ModelAndView();
//		mv.setViewName("/like.jsp");
//		
//		return mv;
//	}
//
//}
