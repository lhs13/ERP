package erp.erpProject.model;

import java.sql.Date;

import lombok.Data;

@Data
public class ClientVO {

   private Long cnum,price;
   private String cname,cfield,scale,emp_num;
   private Date regdate;
}