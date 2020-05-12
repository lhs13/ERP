package erp.erpProject.service;


import java.util.List;

import erp.erpProject.model.Criteria;
import erp.erpProject.model.PersonVO;


public interface PersonService {
	//리스트
	public List<PersonVO> perList(Criteria cri);
	
	//수정
	public void personUP(PersonVO perVO);
	
	//삭제
	//public void personDEL (int emp_num);
	
	//상세보기
	public PersonVO personDetail(int emp_num);
	
}
