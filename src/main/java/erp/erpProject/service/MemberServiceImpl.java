package erp.erpProject.service;

import java.util.List;

import org.apache.ibatis.jdbc.SQL;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import erp.erpProject.mapper.MemberMapper;
import erp.erpProject.model.Criteria;
import erp.erpProject.model.MemberVO;
import lombok.Setter;

@Service
public class MemberServiceImpl implements MemberService{
	
	@Autowired
	private MemberMapper mapper;
	@Setter(onMethod_ = @Autowired)
	private PasswordEncoder pwencoder;
	
	@Transactional
   @Override
   public void memInsert(MemberVO memVO) {
      // TODO Auto-generated method stub
      String memPW = memVO.getEmp_pass();
      memVO.setEmp_pass(pwencoder.encode(memPW));
      mapper.memInsert(memVO);
      
      int number = mapper.perNum(memVO);      
      memVO.setEmp_num(number);
      
      mapper.mem_perInsert(memVO);
      mapper.disInsert(number);
   }

	@Override
	public void memDel(int emp_num) {
		// TODO Auto-generated method stub
		mapper.memDel(emp_num);
	}

	@Override
	public void memModify(MemberVO memVO) {
		// TODO Auto-generated method stub
		mapper.memModify(memVO);
	}

	@Override
	public List<MemberVO> memList(Criteria cri) {
		// TODO Auto-generated method stub
		cri.setPageNum((cri.getPageNum()-1)*cri.getAmount());
		return mapper.memList(cri);
	}
	
	@Override
	public int getTotalCount(Criteria cri) {
		// TODO Auto-generated method stub
		return mapper.getTotalCount(cri);
	}

	@Override
	public MemberVO memGet(String emp_id) {
		// TODO Auto-generated method stub
		return mapper.memGet(emp_id);
	}

	@Override
	public int IDcheck(String checkedID) {
		// TODO Auto-generated method stub
		return mapper.IDcheck(checkedID);
	}

	
	//태여추가
	@Override
	public List<MemberVO> dirList(String emp_dir) {
		// TODO Auto-generated method stub
		return mapper.dirList(emp_dir);
	}


}
