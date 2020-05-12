package erp.erpProject.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import erp.erpProject.model.Criteria;
import erp.erpProject.model.MemberVO;
import erp.erpProject.model.NoticeVO;
import erp.erpProject.model.PageDTO;
import erp.erpProject.service.BoardService;
import erp.erpProject.service.MemberService;
import lombok.Setter;

@Controller
@RequestMapping("/board/*")
public class BoardController {

	@Setter(onMethod_ = @Autowired)
	private BoardService service;
	
	@Setter(onMethod_ = @Autowired)
	private MemberService mService;
	
	@GetMapping("notice")
	public String notice(Model model,Criteria cri) {
		int pageCri = cri.getPageNum();
		List<NoticeVO> list =  service.NoticeList(cri);
		
		cri.setPageNum(pageCri);
		int total = service.getTotalCount(cri);
		model.addAttribute("list",list);
		model.addAttribute("page",new PageDTO(cri, total));
		model.addAttribute("checkList",service.checkList());
		return "/board/notice";
	}
	
	@PostMapping("register")
	public String register(NoticeVO vo){
		service.createdNotice(vo);
		return "redirect:/board/notice";
	}
	
	@GetMapping("register")
	public void register(Principal prin, Model model) {
		MemberVO memVO = mService.memGet(prin.getName());
		System.out.println(prin.getName());
		model.addAttribute("memVO", memVO);
	}
	
	@GetMapping("get")
	//@PreAuthorize("hasRole('ROLE_ADMIN') or ")
	public void get(Model model,long bno,Principal prin) {
		NoticeVO vo =  service.getNotice(bno);
		service.checkNotice(bno, prin.getName());
		model.addAttribute("board",vo);
	}
	
	@PostMapping("modify")
	public String modfiy(NoticeVO vo) 
	{
		service.updateNotice(vo);
		return "redirect:/board/notice";
	}
	
	
}
