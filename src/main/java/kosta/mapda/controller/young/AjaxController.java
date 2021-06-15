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
	
//	/**
//	 * 테마지도 구독
//	 */
//	@RequestMapping("/map/subscribe")
//	public Map<String, Object> subscribe(@RequestParam Map<String,Object> commandMap) {
//		//logger.info("request:/map/subscribe");
//		int resultCode = 1;
//		int subcheck = 1;
//		Map<String, Object>map = new HashMap<>();
//		Map<String, Object>subcntMap = new HashMap<>();
//		Map<String, Object>resultMap = new HashMap<>();
//		
//		try {
//			map=mapService.subcheck(commandMap);
//			if(map == null) {
//				//처음 구독버튼 눌렀을 때
//				mapService.insertSubscribe(commandMap);//구독 테이블 인서트
//				resultCode = 1;
//			}else if(Integer.parseInt(map.get("subcheck").toString())==0) {
//				//구독취소 했다가 다시 눌렀을 때
//				commandMap.put("subcheck", subcheck);
//				mapService.updateSubscribe(commandMap);//구독테이블 업데이트
//				resultCode = 1;
//			}else {
//				//구독 취소
//				subcheck=0;
//				commandMap.put("subcheck", subcheck);
//				mapService.updateSubscribe(commandMap);
//				resultCode = 0;
//			}
//			resultMap = mapService.getSubCnt(commandMap);
//			resultMap.put("subcheck", subcheck);
//		}catch(Exception e) {
//			//logger.debug(e.getMessage());
//			resultCode=-1;
//		}
//		resultMap.put("resultCode", resultCode);
//		return resultMap;
//	}
	
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
			System.out.println("실행완료오오오오오오");
			if(mapStorage == null) {
				//처음 구독버튼 눌렀을 때
				mapService.insertSubscribe(memNo, mapNo);//구독 테이블 인서트
				resultCode = 1;
			} else {
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
