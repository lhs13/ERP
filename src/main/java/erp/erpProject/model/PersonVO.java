package erp.erpProject.model;



import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class PersonVO {
	private int emp_num;
	private String per_sal;
	private String per_pos;
	private String per_day;
	private String per_reg;
	private String per_acc;
	private String emp_dir;
	private String emp_name;
	private String emp_grade;
	
	private MultipartFile Mfile;
	private String per_fileName;
}
