package erp.erpProject.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import erp.erpProject.mapper.PersonMapper;
import erp.erpProject.model.Criteria;
import erp.erpProject.model.PersonVO;

@Service
public class PersonServiceImpl implements PersonService {
	@Autowired
	private PersonMapper pMapper;

	@Override
	public void personUP(PersonVO perVO) {
		// TODO Auto-generated method stub
		pMapper.personUP(perVO);
	}

	/*
	 * @Override public void personDEL(int emp_num) { // TODO Auto-generated method
	 * stub pMapper.personDEL(emp_num); }
	 */

	@Override
	public PersonVO personDetail(int emp_num) {
		// TODO Auto-generated method stub
		return pMapper.personDetail(emp_num);
	}

	@Override
	public List<PersonVO> perList(Criteria cri) {
		// TODO Auto-generated method stub
		return pMapper.pList(cri);
	}

}
