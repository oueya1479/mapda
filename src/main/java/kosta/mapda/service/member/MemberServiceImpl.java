package kosta.mapda.service.member;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import kosta.mapda.domain.map.PlaceReview;
import kosta.mapda.domain.map.Theme;
import kosta.mapda.domain.member.Member;
import kosta.mapda.domain.service.MyPoint;
import kosta.mapda.repository.MyPointRepository;
//import kosta.mapda.domain.member.MemberRole;
import kosta.mapda.repository.member.MemberRepository;
import kosta.mapda.repository.place.PlaceReviewRepository;
import kosta.mapda.repository.young.MapRepository;

@Service
@Transactional
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberRepository memRepository;
	
	@Autowired
	private MapRepository mapRepository;
	
	@Autowired
	private PlaceReviewRepository placeReviewRepository;
	
	//마이포인트 테이블 생성
	@Autowired
	private MyPointRepository myPointRepository;
	
	/*
	 * 비밀번호 암호화를 위한 객체를 주입받는다
	 */
	@Autowired
	private PasswordEncoder passwordEncoder;

	@Override
	public Member findMemberById(String memId) {
		return memRepository.findMemberById(memId);
	}

	@Override
	public ModelAndView findMember(HttpServletRequest request) {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public Member login(Member member) {
		return memRepository.login(member.getMemId(), member.getMemPw());
	}


	@Override
	public void updateMember(Member member) {
		memRepository.updateMember(member);
 
	}
	



	@Override
	public void registerMember(Member member) {
		// 비밀번호 암호화
		String encodedPassword = passwordEncoder.encode(member.getMemPw());
		member.setMemPw(encodedPassword);
		Member m = memRepository.save(member);
		
		MyPoint mp = new MyPoint();
		mp.setMyPoint(0);
		mp.setMember(m);
		
		//System.out.println("mem_no=" + m.getMemNo());
		
		myPointRepository.save(mp);
		
		// 권한등록
		/*
		 * AuthorityVO authority=new AuthorityVO(vo.getId(),"ROLE_MEMBER");
		 * memberDAO.registerRole(authority);
		 */
//		authoritiesDAO.insertAuthority(new AuthorityVO(vo.getId(), Constants.ROLE_MEMBER));
//		if (vo.getUserType().equals("1")) {
//			authoritiesDAO.insertAuthority(new AuthorityVO(vo.getId(), Constants.ROLE_ADMIN));
//		}
	}

	@Override
	public String idcheck(String memId) {
	 Member member = memRepository.findMemberById(memId);
		return (member == null) ? "ok" : "fail";
	}


	@Override
	public void updatePayStatus(Long memNo) {
	memRepository.updatePayStatus(memNo);

		
	}

	@Override
	public Member getMember(Long memNo) {
		return memRepository.findById(memNo).orElse(null);
	}

	@Override
	public void delete(Member member) {
		memRepository.deleteById(member.getMemNo());
		
	}

	@Override
	public List<Theme> myRecenMaps(Long memNo) {
		return mapRepository.selectByMemNoOrderRegDesc(memNo);
		
	}

	@Override
	public List<PlaceReview> myRecenPlaceReviews(Long memNo) {
		return placeReviewRepository.selectByMemNoReviewOrderRegDesc(memNo);
	}



}
