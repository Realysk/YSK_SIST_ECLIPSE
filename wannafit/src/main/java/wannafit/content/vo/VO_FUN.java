package wannafit.content.vo;

import java.util.Date;

public class VO_FUN {
	String funding;
	String category_f ;
	String company_id;
	int goal_money;
	Date start_date ;
	Date end_date ;
	String title;
	String content;
	int attend ;
	String state;
	int accumulate_money ;
	String url_pic;
	int report_cnt;
	public VO_FUN(String funding, String category_f, String company_id, int goal_money, Date start_date, Date end_date,
			String title, String content, int attend, String state, int accumulate_money, String url_pic,
			int report_cnt) {
		super();
		this.funding = funding;
		this.category_f = category_f;
		this.company_id = company_id;
		this.goal_money = goal_money;
		this.start_date = start_date;
		this.end_date = end_date;
		this.title = title;
		this.content = content;
		this.attend = attend;
		this.state = state;
		this.accumulate_money = accumulate_money;
		this.url_pic = url_pic;
		this.report_cnt = report_cnt;
	}
	public String getFunding() {
		return funding;
	}
	public void setFunding(String funding) {
		this.funding = funding;
	}
	public String getCategory_f() {
		return category_f;
	}
	public void setCategory_f(String category_f) {
		this.category_f = category_f;
	}
	public String getCompany_id() {
		return company_id;
	}
	public void setCompany_id(String company_id) {
		this.company_id = company_id;
	}
	public int getGoal_money() {
		return goal_money;
	}
	public void setGoal_money(int goal_money) {
		this.goal_money = goal_money;
	}
	public Date getStart_date() {
		return start_date;
	}
	public void setStart_date(Date start_date) {
		this.start_date = start_date;
	}
	public Date getEnd_date() {
		return end_date;
	}
	public void setEnd_date(Date end_date) {
		this.end_date = end_date;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getAttend() {
		return attend;
	}
	public void setAttend(int attend) {
		this.attend = attend;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public int getAccumulate_money() {
		return accumulate_money;
	}
	public void setAccumulate_money(int accumulate_money) {
		this.accumulate_money = accumulate_money;
	}
	public String getUrl_pic() {
		return url_pic;
	}
	public void setUrl_pic(String url_pic) {
		this.url_pic = url_pic;
	}
	public int getReport_cnt() {
		return report_cnt;
	}
	public void setReport_cnt(int report_cnt) {
		this.report_cnt = report_cnt;
	}
}

