package erp.erpProject.mapper;

import java.util.List;

import erp.erpProject.model.Criteria;
import erp.erpProject.model.PersonVO;

public interface PersonMapper {
	
	//상세보기
	public PersonVO personDetail(int emp_num);
	
	//수정
	public void personUP(PersonVO perVO);
	
	//삭제
	//public void personDEL(int emp_num);
	
	public List<PersonVO> pList(Criteria cri);
}
