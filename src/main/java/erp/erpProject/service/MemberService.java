package erp.erpProject.service;

import java.util.List;

import erp.erpProject.model.Criteria;
import erp.erpProject.model.MemberVO;

public interface MemberService {
	
	//사원추가
	public void memInsert(MemberVO memVO);
	
	//
	//public void mem_perInsert(MemberVO memVO);
	
	//사원삭제
	public void memDel(int emp_num);
	
	//사원정보수정
	public void memModify(MemberVO memVO);
	
	//사원list
	public List<MemberVO> memList(Criteria cri);
	
	//사원list paging
	public int getTotalCount(Criteria cri);
	
	//상세보기(my page)
	public MemberVO memGet(String emp_id);
	
	//id중복체크
	public int IDcheck(String checkedID);

	//태영추가(부서별 목록)
	public List<MemberVO> dirList(String emp_dir);
	
}
