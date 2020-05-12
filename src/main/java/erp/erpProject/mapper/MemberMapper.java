package erp.erpProject.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import erp.erpProject.model.AuthVO;
import erp.erpProject.model.Criteria;
import erp.erpProject.model.MemberVO;


public interface MemberMapper {
	//memInsert
	public void memInsert(MemberVO memVO);
	
	//중간에 emp_num 세팅
	public int perNum(MemberVO memVO);
	
	//personnal insert
	public void mem_perInsert(MemberVO memVO);
	
	//memDel
	public void memDel(int emp_num);
	
	//memModify
	public void memModify(MemberVO memVO);
	
	//memList
	public List<MemberVO> memList(Criteria cri);
	
	//memList paging
	public int getTotalCount(Criteria cri);
	
	//상세보기	
	public MemberVO memGet(String emp_id);
	
	//id 중복체크
	public int IDcheck(String checkedID);


	//태영추가
	public List<MemberVO> dirList(String emp_dir);
	
	//태영추가
	public void disInsert(int number);

}
