package kosta.mapda.repository.admin;

import org.springframework.data.jpa.repository.JpaRepository;

import kosta.mapda.domain.member.Member;

public interface AdminMemberRepository extends JpaRepository<Member, Long> {

}
