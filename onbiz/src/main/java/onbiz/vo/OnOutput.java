package onbiz.vo;

// 산출물 VO
public class OnOutput {
	String opt_no;
	String opt_name;
	String opt_doctype;
	int task_no;

	public OnOutput() {
		super();
	}
	
	public OnOutput(String opt_name) {
	  super();
	  this.opt_name= opt_name;
	}

	public OnOutput(String opt_name, int task_no) {
		super();
		this.opt_name = opt_name;
		this.task_no = task_no;
	}

	public String getOpt_no() {
		return opt_no;
	}

	public void setOpt_no(String opt_no) {
		this.opt_no = opt_no;
	}

	public String getOpt_name() {
		return opt_name;
	}

	public void setOpt_name(String opt_name) {
		this.opt_name = opt_name;
	}

	public String getOpt_doctype() {
		return opt_doctype;
	}

	public void setOpt_doctype(String opt_doctype) {
		this.opt_doctype = opt_doctype;
	}

	public int getTask_no() {
		return task_no;
	}

	public void setTask_no(int task_no) {
		this.task_no = task_no;
	}
}
