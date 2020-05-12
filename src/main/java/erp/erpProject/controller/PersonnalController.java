package erp.erpProject.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import erp.erpProject.model.Criteria;
import erp.erpProject.model.MemberVO;
import erp.erpProject.model.PageDTO;
import erp.erpProject.model.PersonVO;
import erp.erpProject.service.MemberService;
import erp.erpProject.service.PersonService;
import lombok.Setter;

@Controller
@RequestMapping("/personnalTeamOnly/*")
public class PersonnalController {
	
	@Setter(onMethod_ = @Autowired)
	private MemberService mService;
	
	@Setter(onMethod_ = @Autowired)
	private PersonService pService;
	
	@Resource(name="uploadPath")
	private String uploadPath;
	
	@GetMapping("personListPage")
	public String personListPage(Model model, Criteria cri) {
		int pageCri = cri.getPageNum();
		List<MemberVO> list = mService.memList(cri);
		List<PersonVO> plist = pService.perList(cri);
		
		cri.setPageNum(pageCri);
		int total = mService.getTotalCount(cri);
		
		model.addAttribute("list", list);
		model.addAttribute("plist", plist);
		model.addAttribute("page", new PageDTO(cri, total));
		return "/personnalTeamOnly/personListPage";
	}
	
	
	  @GetMapping("personDetail")
	  public String personDetailForm(Model model, int emp_num) {
		  PersonVO pvo = pService.personDetail(emp_num);
		  model.addAttribute("perVO", pvo);
		  return "/personnalTeamOnly/personDetail";
	 }
	  
	  @PostMapping("personUP")
	  public String personDetailUpdate(PersonVO perVO) throws IOException, Exception {
		  
		  UUID uuid = UUID.randomUUID();
		  
		  String fileName = uuid.toString()+"_"+perVO.getMfile().getOriginalFilename();
		  File target = new File(uploadPath+"/"+fileName);

		  if(perVO.getMfile() != null) {
			  FileCopyUtils.copy(perVO.getMfile().getBytes(), target);
		  }
		  
		  perVO.setPer_fileName(fileName);
		  pService.personUP(perVO);
		  return "redirect:/personnalTeamOnly/personListPage";
	  }
	 
}
