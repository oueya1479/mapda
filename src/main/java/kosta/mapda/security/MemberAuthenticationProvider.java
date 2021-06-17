package kosta.mapda.security;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import kosta.mapda.domain.map.MapStorage;
import kosta.mapda.domain.map.Theme;
import kosta.mapda.domain.member.Member;
//import kosta.mapda.domain.member.MemberRole;
import kosta.mapda.repository.member.MemberRepository;
import kosta.mapda.repository.young.MapRepository;
import kosta.mapda.repository.young.MapStorageRepository;


@Service //id="memberAuthenticationProvider"
public class MemberAuthenticationProvider implements AuthenticationProvider {

	
	
     @Autowired
	 private  PasswordEncoder passwordEncoder; //맴버필로 주입\
     
     @Autowired
     private MemberRepository memberRepository;
     
     @Autowired
     private MapRepository mapRepository;
     
     @Autowired
     private MapStorageRepository mapStorageRepository;
	
	/*public MemberAuthenticationProvider() {
		System.out.println("MemberAuthenticationProvider 생성.....");
	}*/
	
	
	@Bean //생성
	public BCryptPasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}

	@Override
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {//�μ��� ���ܵȰ��� ����ڰ� �Է��� id�� �н����� ������ ������ �ִ� Authentication
		System.out.println("MemberAuthenticationProvider�� authenticate call......");
		
		String memId = authentication.getName(); //전송된 id
		
		//아이디에 해당하는 회원의 정보 검색...
		Member member = memberRepository.findMemberById(memId);
	
		if(member==null) throw new UsernameNotFoundException(memId+"는 존재하지 않아 인증에 실패했습니다wwww.");
		
		//DB에 있는 비번과 인수로 전달된 비번 비교...
		String pass = authentication.getCredentials().toString();
		
		if(!passwordEncoder.matches( pass, member.getMemPw() )) {//평문, 암호화
			throw new UsernameNotFoundException("비밀번호 오류입니다.....");
		}
		
		List<Theme>themeList = mapRepository.selectByMemId(member.getMemNo());
		member.setMapList(themeList);
		
		//성공하면
		//인증된 사용자의 권한을 검색해서  Authentication에 저장한다.
		//List<MemberRole>  memRoleList = memberRole.selectAuthorityByUserName(memId);
		List<GrantedAuthority> roles = (List<GrantedAuthority>) member.getAuthorities();
		//for(MemberRole memberRole : memRoleList) {
	//		simpleAuthList.add(new SimpleGrantedAuthority(memberRole.getRoleName())); //DB의 권한을 Security의 권한타입에 맞게 변환하는과정
	//	}
		
		return new UsernamePasswordAuthenticationToken(member, pass, roles);//인증된 사용자의 정보와 권한을 Authentication에 저장--> SecurityContext에저장 -> SecurityHolder -> 
	}

	
	/**
	 *  인수로전달된 authentication 인증정보가 인증 할수 있는 유효한 객체인지를 판단하는 메소드
	 *   리턴값이 true일때 authenticate()메소드가 호출된다...
	 * */
	@Override
	public boolean supports(Class<?> authentication) {
		System.out.println("MemberAuthenticationProvider�� supports(Class<?> authentication).............");
		
		return UsernamePasswordAuthenticationToken.class.isAssignableFrom(authentication);
	}

}














