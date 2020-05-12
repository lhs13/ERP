package erp.erpProject.model;

import java.sql.Date;

import lombok.Data;

@Data
public class DispatchVO {

   private String emp_num,dis_field;
   private Date dis_reg,dis_day;
   private Long cnum;
}