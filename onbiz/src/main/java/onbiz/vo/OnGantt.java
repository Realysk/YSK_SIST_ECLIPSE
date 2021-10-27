package onbiz.vo;


public class OnGantt {
	/*
	task_no NUMBER PRIMARY KEY , -- *작업번호(id)
	task_name varchar2(100), -- *작업명(text)
	task_startdte Date, -- *작업 시작일(start_date)
	task_enddte Date, -- 작업 종료일(end_date)
	task_duration NUMBER, -- *작업 기간(duration)
	task_progress NUMBER, -- *작업 진행퍼센트(progress)
	taskref_no NUMBER, -- *상위작업번호(parent)
	task_prior varchar2(20), -- *작업 우선순위(priority)
	task_content varchar2(1000), -- 작업내용
	task_regdte varchar2(100), -- 작업 등록일
	task_uptdte varchar2(50), -- 작업 수정일
	task_state varchar2(20), -- 작업 진행상태
	mem_no varchar2(10) -- 작업 담당자(fk)
	
	<result property="id" column="task_no"/>
	<result property="text" column="task_name"/>
	<result property="start_date" column="task_startdte"/>
	<result property="end_date" column="task_enddte"/>
	<result property="duration" column="task_duration"/>
	<result property="progress" column="task_progress"/>
	<result property="parent" column="taskref_no"/>
	<result property="priority" column="task_prior"/>
	*/
	
	int id;
	String text;
	String start_date;
	String end_date;
	int duration;
	int progress;
	int parent;
	String priority;
	String task_content;
	String task_regdte;
	String task_uptdte;
	String task_state;
	String mem_no;
	
	// join된 내용
	String pro_name;
	String user;
	
	public OnGantt() {
		super();
	}

	public OnGantt(String mem_no) {
		super();
		this.mem_no = mem_no;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public String getStart_date() {
		return start_date;
	}

	public void setStart_date(String start_date) {
		this.start_date = start_date;
	}

	public String getEnd_date() {
		return end_date;
	}

	public void setEnd_date(String end_date) {
		this.end_date = end_date;
	}

	public int getDuration() {
		return duration;
	}

	public void setDuration(int duration) {
		this.duration = duration;
	}

	public int getProgress() {
		return progress;
	}

	public void setProgress(int progress) {
		this.progress = progress;
	}

	public int getParent() {
		return parent;
	}

	public void setParent(int parent) {
		this.parent = parent;
	}

	public String getPriority() {
		return priority;
	}

	public void setPriority(String priority) {
		this.priority = priority;
	}

	public String getTask_content() {
		return task_content;
	}

	public void setTask_content(String task_content) {
		this.task_content = task_content;
	}

	public String getTask_regdte() {
		return task_regdte;
	}

	public void setTask_regdte(String task_regdte) {
		this.task_regdte = task_regdte;
	}

	public String getTask_uptdte() {
		return task_uptdte;
	}

	public void setTask_uptdte(String task_uptdte) {
		this.task_uptdte = task_uptdte;
	}

	public String getTask_state() {
		return task_state;
	}

	public void setTask_state(String task_state) {
		this.task_state = task_state;
	}

	public String getMem_no() {
		return mem_no;
	}

	public void setMem_no(String mem_no) {
		this.mem_no = mem_no;
	}

	public String getPro_name() {
		return pro_name;
	}

	public void setPro_name(String pro_name) {
		this.pro_name = pro_name;
	}

	public String getUser() {
		return user;
	}

	public void setUser(String user) {
		this.user = user;
	}
}
