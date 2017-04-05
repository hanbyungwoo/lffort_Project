package model.domain;

import java.util.Date;

public class Todo {
	String usrId;
	String todoType;
	Date start;
	Date end;
	String desc;
	int flag;
	int percent;
	int total;
	
	
	public Todo() {
		super();
	}
	
	public Todo(String usrId, String todoType, Date start, Date end, String desc, int flag, int percent, int total) {
		super();
		this.usrId = usrId;
		this.todoType = todoType;
		this.start = start;
		this.end = end;
		this.desc = desc;
		this.flag = flag;
		this.percent = percent;
		this.total = total;
	}
	public String getUsrId() {
		return usrId;
	}
	public void setUsrId(String usrId) {
		this.usrId = usrId;
	}
	public String getTodoType() {
		return todoType;
	}
	public void setTodoType(String todoType) {
		this.todoType = todoType;
	}
	public Date getStart() {
		return start;
	}
	public void setStart(Date start) {
		this.start = start;
	}
	public Date getEnd() {
		return end;
	}
	public void setEnd(Date end) {
		this.end = end;
	}
	public String getDesc() {
		return desc;
	}
	public void setDesc(String desc) {
		this.desc = desc;
	}
	public int getFlag() {
		return flag;
	}
	public void setFlag(int flag) {
		this.flag = flag;
	}
	public int getPercent() {
		return percent;
	}
	public void setPercent(int percent) {
		this.percent = percent;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}

	
	
	
}
