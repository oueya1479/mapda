package kosta.mapda.controller.young;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import kosta.mapda.domain.map.MapStorage;
import kosta.mapda.domain.member.Member;
import kosta.mapda.repository.member.MemberRepository;
import kosta.mapda.service.young.MapService;
import lombok.RequiredArgsConstructor;


@RequiredArgsConstructor
@RestController
public class AjaxController {
	
	@Autowired
	private MapService mapService;
	
	/**
	 * 테마지도 구독
	 */
	@RequestMapping("/map/subscribe")
	public int subscribe(String mapNoStr, String memNoStr) {
		Long mapNo = Long.parseLong(mapNoStr);
		Long memNo = Long.parseLong(memNoStr);
		
		int resultCode = 1;
		try {
			MapStorage mapStorage = mapService.subcheck(memNo, mapNo);
			if(mapStorage == null) {
				//처음 구독버튼 눌렀을 때
				mapService.insertSubscribe(memNo, mapNo);//구독 테이블 인서트
				resultCode = 1;
			} else if(mapStorage!=null) {
				//구독상태에서 다시 버튼을 누르면
				mapService.deleteSubscribe(memNo, mapNo);//구독 테이블 delete
				resultCode = 0;
			}
		}catch(Exception e) {
			System.out.println(e.getMessage());
			resultCode=-1;
		}
		return resultCode;
	}
	
	/**
	 * 테마지도 좋아요
	 */
	@RequestMapping("/map/like")
	public String like(Long mapNo) {
		return null;
	}
}
