package erp.erpProject.service;

import java.util.List;

import erp.erpProject.model.ClientVO;
import erp.erpProject.model.Criteria;
import erp.erpProject.model.MemberVO;

public interface ClientService {

   public int insert(ClientVO vo);
   
   public List<ClientVO> list(Criteria cri);
   
   public ClientVO get(Long cnum);
   
   public void update(ClientVO vo);
   
   public void delete(Long cnum);
   
   public int getTotal();

   public List<MemberVO> memList();
   
   public void disReset();
}
