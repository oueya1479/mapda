package kosta.mapda.controller.member;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kosta.mapda.domain.member.Member;
import kosta.mapda.domain.service.Event;
import kosta.mapda.domain.service.EventLike;
import kosta.mapda.domain.service.EventPost;
import kosta.mapda.repository.member.LikesRepository;
import kosta.mapda.service.event.EventService;


@Controller
@RequestMapping("/event")
public class EventController {

	@Autowired
	private EventService eventService;
  
	private final String SAVE_PATH = "/Users/baeeunjin/Desktop/fileSave";	

	/**
	 * 이벤트 글 등록폼 
	 * */
	@RequestMapping("/posting/{evNo}")
	public String write(Model model, @PathVariable Long evNo, String title, String content, Long evpNo) {
		model.addAttribute("evNo", evNo);
		if(title != null) {
			model.addAttribute("title", title);
		}
		if(content != null) {
			model.addAttribute("content", content);
		}
		if(evpNo != null) {
			model.addAttribute("evpNo", evpNo);
		}
		return "event/posting";
	}
	
	
	/**
	 *  이벤트 글 등록하기 
	 * */
		@RequestMapping("/insertPosting/{evNo}")
		public String insert(EventPost eventPost, @PathVariable Long evNo, Long evpNo, Model model)throws IOException {
			
			Member mem = (Member)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			Event event = eventService.getEvent(evNo);
			
			eventPost.setEvent(event);
			eventPost.setMember(mem);
			
			MultipartFile file = eventPost.getFile();
			if(file.getSize() > 0 ) {
				String fileName = file.getOriginalFilename();
				eventPost.setEvpImg(fileName);
			    file.transferTo(new File(SAVE_PATH + "/" + fileName));
			}
			//Event dbEvent = new Event(file, null, event.getEvTitle(), event.getEvContent(), event.getEvStartDate(), event.getEvEndDate(), null, 0, null, null);
			String content = eventPost.getEvpContent().replace("<","&lt;");
			
			if(evpNo != null) {
				eventPost.setEvpNo(evpNo);
			}
			
			model.addAttribute("event", event);
			eventService.insert(eventPost);
			
			return "redirect:/event/list";
			
	}
	
	
		
		/**
		 * 이벤트 참여자 등록 게시물 목록 전체 가져오기
		 */
		@RequestMapping("/list")
		public void list(Model model, Event event, @RequestParam(defaultValue="0") int nowPage) {
			//List<Event> list =eventService.selectAll();
			Pageable pageable = PageRequest.of(nowPage, 10, Direction.DESC, "evNo");
					//eventService.selectAll(null);
					Page<Event> eventList = eventService.selectAll(pageable);
					List<Event> list = eventList.getContent();
					for(int i = 0; i < list.size(); i++) {
						System.out.println(list);
					}
					model.addAttribute("eventList", eventList); // 뷰페이지에서 ${pageList.메소드이름}
					
				
		}
	
		
		/**
		 * 이벤트 참여자 게시물 상세보기
		 */
		@RequestMapping("/singlePosting/{evNo}")  //뒤에 무슨 수가 들어오는 지 몰라? 변수를 써주는 거야 
		public ModelAndView singlePosting(@PathVariable Long evNo, String flag) {
			boolean state = flag==null? true : false; //조회수 기능 할 때 넣기
			Event event = eventService.selectBy(evNo); // state가 true이면 조회수 증가, false이면 조회수 증가 X
			
			ModelAndView mv = new ModelAndView();
			mv.setViewName("event/singlePosting");
			mv.addObject("event", event);
			
			return mv; 
		}
		
		
	/**
	 * 이벤트 게시물 수정
	 * */
		@RequestMapping("/updateForm")
		public void updateForm() {}
		
		/**
		 * 수정 완료  
		 * */
		@RequestMapping("/update")
		public String update(Event event) { //내용, 비번, 제목, 글번호 
			Event dbEvent = eventService.update(event);
			return "redirect:/event/posting";
		}
	
	/**
	 * 이벤트 게시물 삭제
	 * */
	@RequestMapping("/delete")
	public String delete() {
      eventService.delete();
		return "redirect:/event/list";
	
	}
	
	/**
	 *게시물 삭제하기 
	 **/
	@RequestMapping("/deletePost")
	public String deletePost(Long evNo, Long evpNo) {
		eventService.deletePost(evpNo);
		return "redirect:/event/postingList/" + evNo;
		
	}
	
	/**
	 * postListing 으로 이동
	 */
	
	@RequestMapping("/postingList/{evNo}")
	public String postingList(Model model, @RequestParam(defaultValue="0") int nowPage, @PathVariable Long evNo) {
		Pageable pageable = PageRequest.of(nowPage, 10, Direction.DESC, "evpNo");
		Page<EventPost> eventPostList = eventService.selectAllPost(pageable, evNo);
		model.addAttribute("eventPostList", eventPostList); // 뷰페이지에서 ${pageList.메소드이름}
		
		Member mem = (Member)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		//현재 로그인한 멤버의 정보 가져오기 
		
		
		//postinglist로 가기 전에 . memNo
		model.addAttribute("memNo", mem.getMemNo());   
		
		return "event/postingList";
	}
	
	/**
	 * 한 사람 당 게시물을 하나씩만 작성할 수 있도록 제한하기 
	 * ---------->AjaxEventController
	 */
	
	
	/**
	 * 상세페이지로 이동 (개별게시물) 
	 */
	
	@RequestMapping("/detail/{evpNo}")
	public String detail(Model model, @PathVariable Long evpNo) {
		EventPost eventPost = eventService.getEventPost(evpNo);
		model.addAttribute("eventPost", eventPost);
		Member mem = (Member)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		int result = eventService.checkLike(eventPost, mem);
		model.addAttribute("curLike", result);
		return "event/detail";
	}

	
	
}
