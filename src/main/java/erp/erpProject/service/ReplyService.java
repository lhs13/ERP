package erp.erpProject.service;

import java.util.List;

import erp.erpProject.model.Criteria;
import erp.erpProject.model.ReplyPageDTO;
import erp.erpProject.model.ReplyVO;

public interface ReplyService {

	public int register(ReplyVO vo);
	
	public ReplyVO get(Long rno);
	
	public int modify(ReplyVO vo);
	
	public int remove(Long rno);
	
	public ReplyPageDTO getListPage(Criteria cri,Long bno);
	
}
