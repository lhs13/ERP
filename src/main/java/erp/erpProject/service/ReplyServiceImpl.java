package erp.erpProject.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import erp.erpProject.mapper.BoardMapper;
import erp.erpProject.mapper.ReplyMapper;
import erp.erpProject.model.Criteria;
import erp.erpProject.model.ReplyPageDTO;
import erp.erpProject.model.ReplyVO;
import lombok.Setter;

@Service
public class ReplyServiceImpl implements ReplyService{

	@Setter(onMethod_ = @Autowired)
	private ReplyMapper mapper;
	
	@Setter(onMethod_ = @Autowired)
	private BoardMapper bMapper;
	
	@Override
	@Transactional
	public int register(ReplyVO vo) {
		// TODO Auto-generated method stub
		if(mapper.insert(vo)==1) {
			return bMapper.increaseReply(vo.getBno()); 
		}
		else {
			return 0;
		}
	}

	@Override
	public ReplyVO get(Long rno) {
		// TODO Auto-generated method stub
		return mapper.read(rno);
	}

	@Override
	public int modify(ReplyVO vo) {
		// TODO Auto-generated method stub
		return mapper.update(vo);
	}

	@Override
	public int remove(Long rno) 
	{
		return mapper.delete(rno);
	}
	
	@Override
	public ReplyPageDTO getListPage(@Param("cri") Criteria cri, Long bno) 
	{
		int im = cri.getPageNum();
		cri.setPageNum((cri.getPageNum()-1)*cri.getAmount());
		int replyCnt = mapper.getCountByBno(bno);
		List<ReplyVO> list = mapper.getListWithPaging(cri, bno);
		cri.setPageNum(im);
		ReplyPageDTO rpd = new ReplyPageDTO(replyCnt, list);
		return rpd;
	}
	
}
