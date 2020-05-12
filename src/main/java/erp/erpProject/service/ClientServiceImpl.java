package erp.erpProject.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import erp.erpProject.mapper.ClientMapper;
import erp.erpProject.model.ClientVO;
import erp.erpProject.model.Criteria;
import erp.erpProject.model.DispatchVO;
import erp.erpProject.model.MemberVO;
import lombok.Setter;

@Service
public class ClientServiceImpl implements ClientService{

   @Setter(onMethod_ = @Autowired)
   private ClientMapper mapper;
   
   @Override
   public int insert(ClientVO vo) {
      // TODO Auto-generated method stub
      return mapper.insert(vo);
   }

   @Override
   public List<ClientVO> list(Criteria cri) {
      // TODO Auto-generated method stub
      cri.setPageNum((cri.getPageNum()-1)*cri.getAmount());
      return mapper.list(cri);
   }

   @Override
   public ClientVO get(Long cnum) {
      // TODO Auto-generated method stub
      return mapper.get(cnum);
   }

   @Override
   @Transactional
   public void update(ClientVO vo) {
      // TODO Auto-generated method stub
      mapper.update(vo);
      String[] toEmp = vo.getEmp_num().split("/");
      for(int i=0;i<toEmp.length;i++) 
      {
         DispatchVO dis = new DispatchVO();
         dis.setCnum(vo.getCnum());
         dis.setDis_reg(vo.getRegdate());
         dis.setDis_field(vo.getCfield());
         dis.setEmp_num(toEmp[i]);
         mapper.disUpdate(dis);
      }
   }

   @Override
   @Transactional
   public void delete(Long cnum) {
      // TODO Auto-generated method stub
      mapper.delete(cnum);
      ClientVO cli = mapper.get(cnum);
      
   }

   @Override
   public int getTotal() {
      // TODO Auto-generated method stub
      return mapper.getTotal();
   }

   @Override
   public List<MemberVO> memList() {
      // TODO Auto-generated method stub
      return mapper.memList();
   }

   @Override
   public void disReset() {
      // TODO Auto-generated method stub
      List<DispatchVO> list = mapper.disList();
      for (int i = 0; i < list.size(); i++) 
      {
         mapper.disReset(list.get(i).getEmp_num());
      }
   }
   
}