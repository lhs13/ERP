package erp.erpProject.controller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import erp.erpProject.model.MemberVO;
import erp.erpProject.service.MemberService;

@Controller
@RequestMapping("/sign/*")
public class SignController {
	
	@Autowired
	private MemberService mem;
	
	@GetMapping("join")
		public String join() {
			return "/sign/join";
		}
	
	@GetMapping("jusoPopup")
		public String jusoPopup() {
			return "/sign/jusoPopup";
		}

	@PostMapping("jusoPopup")
		public String jusoPopup1() {
			return "/sign/jusoPopup";
		}
	
	@PostMapping("memberInsert")
	public String memberInsert(MemberVO memVO) {
		mem.memInsert(memVO);
		return "redirect:/";
	}
	
	@PostMapping("memModify")
	public String memMO(MemberVO memVO) {
		mem.memModify(memVO);
		return "redirect:/";
	}
	
	@GetMapping("/customLogin")
	public String login() {
		return "/sign/customLogin";
	}
	
	@GetMapping("mypage")
	public String mypage(Principal principal, Model model) {
		MemberVO vo = mem.memGet(principal.getName());
		model.addAttribute("user", vo);
		return "/sign/mypage";
	}
	
	@GetMapping("/checkID")
	@ResponseBody
	public String idcheck(String checkedID){
		String flag = "";
		if(mem.IDcheck(checkedID)==0) {
			flag = "true";
		}
		else if(mem.IDcheck(checkedID)==1) {
			flag = "false";	
		}
		return flag;
	}

}
