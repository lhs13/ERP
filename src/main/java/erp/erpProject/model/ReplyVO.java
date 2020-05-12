package erp.erpProject.model;

import java.sql.Date;

import lombok.Data;

@Data
public class ReplyVO {
	
	private long rno,bno;
	
	private String reply,replyer;
	
	private Date replyDate,updateDate;
}
