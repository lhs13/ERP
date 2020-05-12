package erp.erpProject.model;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Criteria {
	private int pageNum,amount;
	private String type;
	
	public Criteria() {
		this(1,10,"");
	}
	public Criteria(int pageNum,int amount,String type) {
		this.pageNum = pageNum;
		this.amount = amount;
		this.type = type;
	}
	
}
