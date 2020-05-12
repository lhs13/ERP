package erp.erpProject.model;

import java.util.List;

import lombok.Data;

@Data
public class MemberVO {
	private int emp_num;
	private String emp_name;
	private String emp_addr;
	private String emp_tel;
	private String emp_dir;
	private String emp_id;
	private String emp_pass;
	private String emp_grade;
	private List<AuthVO> authList;
}
