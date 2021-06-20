package kosta.mapda.repository.admin;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import kosta.mapda.domain.member.InfluenceReq;

public interface InfluenceReqRepositiry extends JpaRepository<InfluenceReq, Long> {

	@Query("select i from InfluenceReq i where i.irStatus = '신청대기'")
	List<InfluenceReq> getReq();

	@Query("update InfluenceReq i set i.irStatus = '완료' where i.member.memNo = ?1")
	@Modifying
	void setState(Long memNo);

	@Query("delete from InfluenceReq i where i.member.memNo = ?1")
	@Modifying
	void deleteRecord(Long memNo);

}
