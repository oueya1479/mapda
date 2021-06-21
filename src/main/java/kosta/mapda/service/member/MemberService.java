package kosta.mapda.service.member;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.ModelAndView;

import kosta.mapda.domain.map.MapStorage;
import kosta.mapda.domain.map.PlaceReview;
import kosta.mapda.domain.map.Theme;
import kosta.mapda.domain.member.Member;

public interface MemberService {

	Member findMemberById(String memId);
	
	ModelAndView findMember(HttpServletRequest request);
	
	Member login(Member member);

	void updateMember(Member member);

	void registerMember(Member member);

	String idcheck(String memId);
	
	void delete(Member member);
	/**
	 * 로그인된 사용자의 지도를 날짜 기준으로 내림차순 정렬
	 * */
	List<Theme> myRecenMaps(Long memNo);
	
	List<PlaceReview> myRecenPlaceReviews(Long memNo);
	
	
/**
 *  정기결제 - memPayStatus
 */
	void updatePayStatus(Long memNo);

	Member getMember(Long memNo); 

}
