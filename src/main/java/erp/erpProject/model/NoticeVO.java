package erp.erpProject.model;

import java.sql.Date;

import lombok.Data;

@Data
public class NoticeVO {

	private Long bno,replyCnt;
	
	private String title,writer,content,department;
	
	private Date created,updatedate;
	
}
