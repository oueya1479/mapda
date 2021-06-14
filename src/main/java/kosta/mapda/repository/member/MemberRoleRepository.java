package kosta.mapda.repository.member;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import kosta.mapda.domain.member.MemberRole;

public interface MemberRoleRepository extends JpaRepository<MemberRole, Long> {

	/**
	 * 사용자 권한 등록
	 * (한 USER(아이디)가 여러개의 권한을 가질 수 있다.
	 * */
	//int insertAuthority(MemberRole memberRole);
	
	/**
	 * id에 해당하는 권한 검색.
	 * */
	//List<MemberRole> selectAuthorityByUserName(String memName);
}
