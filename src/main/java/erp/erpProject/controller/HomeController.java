package erp.erpProject.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.apache.ibatis.annotations.Param;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import erp.erpProject.model.MemberVO;
import erp.erpProject.model.NoticeVO;
import erp.erpProject.service.BoardService;
import erp.erpProject.service.MemberService;
import lombok.Setter;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Setter(onMethod_ = @Autowired)
	private MemberService mService;
	
	@Setter(onMethod_ = @Autowired)
	private BoardService bService;
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {
		NoticeVO vo = bService.reNotice();
		model.addAttribute("reNotice",vo);
		return "home";
	}
	
	@GetMapping(value = "/map")
	public String map() {
		return "map";
	}
	
	@RequestMapping("/chat")
	public String chat(Model model){
		User user = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		System.out.println("user name :" + user.getUsername());
		
		System.out.println("normal chat page");
		
		model.addAttribute("userid",user.getUsername());
		return "/chat/chattingview";
	}
	
	@RequestMapping("/chat/chat_team")
	@ResponseBody
	public List<MemberVO> chat(@Param("emp_dir")String emp_dir) {
		List<MemberVO> chatList = mService.dirList(emp_dir);
		return chatList;
	}
	/*
	 * @RequestMapping("/chat/getId")
	 * 
	 * @ResponseBody public String chatGet(emp_num) { MemberVO vo =
	 * mService.memGet(emp_id); }
	 */
	
}
