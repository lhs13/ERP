package erp.erpProject.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import erp.erpProject.model.CheckNoticeVO;
import erp.erpProject.model.Criteria;
import erp.erpProject.model.NoticeVO;

public interface BoardMapper {

	public List<NoticeVO> NoticeList(Criteria cri);
	
	public NoticeVO getNotice(long bno);
	
	public boolean createdNotice(NoticeVO vo);
	
	public boolean updateNotice(NoticeVO vo);
	
	public boolean delNotice(long bno);
	
	public int getTotalCount(Criteria cri);
	
	public int increaseReply(Long bno);
	
	public Integer checkNotice(@Param("bno")Long bno,@Param("emp_id")String emp_id); 
	
	public void checkInsertNotice(@Param("bno")Long bno,@Param("emp_id")String emp_id);
	
	public List<CheckNoticeVO> checkList();
	
	//main page 가장 최근 게시글
	public NoticeVO reNotice();
}
