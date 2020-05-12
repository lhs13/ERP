package erp.erpProject.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import erp.erpProject.model.ClientVO;
import erp.erpProject.model.Criteria;
import erp.erpProject.model.MemberVO;
import erp.erpProject.model.PageDTO;
import erp.erpProject.service.BoardService;
import erp.erpProject.service.ClientService;
import lombok.Setter;

@Controller
@RequestMapping(value = "/client/*")
public class ClientController {
   
   @Setter(onMethod_ = @Autowired)
   private ClientService serivce;
   
   @Setter(onMethod_ = @Autowired)
   private BoardService bService;
   
   @GetMapping(value = "/list")
   public String cliList(Model model,Criteria cri) {
	  int num = cri.getPageNum();
      List<ClientVO> list = serivce.list(cri);
      cri.setPageNum(num);
      int total = bService.getTotalCount(cri);
      model.addAttribute("list",list);
      model.addAttribute("page",new PageDTO(cri, total));
      return "/client/clientList";
   }
   
   @GetMapping(value = "register")
   public String register() {
      return "/client/register";
   }
   
   @PostMapping(value = "register")
   public String register(ClientVO vo) {
      serivce.insert(vo);
      return "redirect:/client/list";
   }
   
   @GetMapping(value = "get")
   public String get(Model model,Long cnum)
   {
      List<MemberVO> list = serivce.memList();
      ClientVO vo = serivce.get(cnum);
      model.addAttribute("cli",vo);
      model.addAttribute("list",list);
      return "/client/get";
   }
   @GetMapping(value = "modify")
   public String modify(ClientVO vo) {
      serivce.update(vo);
      return "redirect:/client/list";
   }
   
   @GetMapping(value = "reset")
   @ResponseBody
   public void reset() {
      serivce.disReset();
   }
}