package onbiz.vo;

public class OnDashBoard {

 int procnt;// = Integer.parseInt(String.valueOf(("procnt")));
 int riskcnt ;//=Integer.parseInt(String.valueOf(("riskcnt")));
 int nprocnt ;//=Integer.parseInt(String.valueOf(("nprocnt")));
 int taskcnt;// =Integer.parseInt(String.valueOf(("taskcnt")));
 
 int pro_cnt ;//=Integer.parseInt(String.valueOf(("pro_cnt")));;
 int risk_cnt;// =Integer.parseInt(String.valueOf(("risk_cnt")));;
 int task_cnt ;//=Integer.parseInt(String.valueOf(("task_cnt")));;
 int npro_cnt ;//=Integer.parseInt(String.valueOf(("npro_cnt")));;
  
 String pro_name;
 int tot; 
 int task2;
 
 int fixing;
 int holding;
 int complete;
 int opening;
 int dproject;
 
 int graph_ready;
 int graph_complete;
 int graph_delay;
 int graph_graphgoing;
 
 public OnDashBoard() {
    super();
    // TODO Auto-generated constructor stub
  }
  public OnDashBoard(int procnt, int riskcnt, int nprocnt, int taskcnt) {
    super();
    this.procnt = procnt;
    this.riskcnt = riskcnt;
    this.nprocnt = nprocnt;
    this.taskcnt = taskcnt;
  }
  /**
   * @return the dprono
   */
  public int getDproject() {
    return dproject;
  }
  /**
   * @param dprono the dprono to set
   */
  public void setDproject(int dproject) {
    this.dproject = dproject;
  }
  /**
   * @return the pro_name
   */
  public String getPro_name() {
    return pro_name;
  }
  /**
   * @param pro_name the pro_name to set
   */
  public void setPro_name(String pro_name) {
    this.pro_name = pro_name;
  }
  /**
   * @return the tot
   */
  public int getTot() {
    return tot;
  }
  /**
   * @param tot the tot to set
   */
  public void setTot(int tot) {
    this.tot = tot;
  }
  /**
   * @return the task2
   */
  public int getTask2() {
    return task2;
  }
  /**
   * @param task2 the task2 to set
   */
  public void setTask2(int task2) {
    this.task2 = task2;
  }
  /**
   * @return the procnt
   */
  public int getProcnt() {
    return procnt;
  }
  /**
   * @return the npro_cnt
   */
  public int getNpro_cnt() {
    return npro_cnt;
  }
  /**
   * @param npro_cnt the npro_cnt to set
   */
  public void setNpro_cnt(int npro_cnt) {
    this.npro_cnt = npro_cnt;
  }
  /**
   * @return the pro_cnt
   */
  public int getPro_cnt() {
    return pro_cnt;
  }
  /**
   * @param pro_cnt the pro_cnt to set
   */
  public void setPro_cnt(int pro_cnt) {
    this.pro_cnt = pro_cnt;
  }
  /**
   * @return the risk_cnt
   */
  public int getRisk_cnt() {
    return risk_cnt;
  }
  /**
   * @param risk_cnt the risk_cnt to set
   */
  public void setRisk_cnt(int risk_cnt) {
    this.risk_cnt = risk_cnt;
  }
  /**
   * @return the task_no
   */
  public int getTask_cnt() {
    return task_cnt;
  }
  /**
   * @param task_no the task_no to set
   */
  public void setTask_cnt(int task_cnt) {
    this.task_cnt = task_cnt;
  }
  /**
   * @param procnt the procnt to set
   */
  public void setProcnt(int procnt) {
    this.procnt = procnt;
  }
  /**
   * @return the riskcnt
   */
  public int getRiskcnt() {
    return riskcnt;
  }
  /**
   * @param riskcnt the riskcnt to set
   */
  public void setRiskcnt(int riskcnt) {
    this.riskcnt = riskcnt;
  }
  /**
   * @return the nprocnt
   */
  public int getNprocnt() {
    return nprocnt;
  }
  /**
   * @param nprocnt the nprocnt to set
   */
  public void setNprocnt(int nprocnt) {
    this.nprocnt = nprocnt;
  }
  /**
   * @return the taskcnt
   */
  public int getTaskcnt() {
    return taskcnt;
  }
  /**
   * @param taskcnt the taskcnt to set
   */
  public void setTaskcnt(int taskcnt) {
    this.taskcnt = taskcnt;
  }
  /**
   * @return the fixing
   */
  public int getFixing() {
    return fixing;
  }
  /**
   * @param fixing the fixing to set
   */
  public void setFixing(int fixing) {
    this.fixing = fixing;
  }
  /**
   * @return the holding
   */
  public int getHolding() {
    return holding;
  }
  /**
   * @param holding the holding to set
   */
  public void setHolding(int holding) {
    this.holding = holding;
  }
  /**
   * @return the complete
   */
  public int getComplete() {
    return complete;
  }
  /**
   * @param complete the complete to set
   */
  public void setComplete(int complete) {
    this.complete = complete;
  }
  /**
   * @return the opening
   */
  public int getOpening() {
    return opening;
  }
  /**
   * @param opening the opening to set
   */
  public void setOpening(int opening) {
    this.opening = opening;
  }
  /**
   * @return the graph_ready
   */
  public int getGraph_ready() {
    return graph_ready;
  }
  /**
   * @param graph_ready the graph_ready to set
   */
  public void setGraph_ready(int graph_ready) {
    this.graph_ready = graph_ready;
  }
  /**
   * @return the graph_complete
   */
  public int getGraph_complete() {
    return graph_complete;
  }
  /**
   * @param graph_complete the graph_complete to set
   */
  public void setGraph_complete(int graph_complete) {
    this.graph_complete = graph_complete;
  }
  /**
   * @return the graph_delay
   */
  public int getGraph_delay() {
    return graph_delay;
  }
  /**
   * @param graph_delay the graph_delay to set
   */
  public void setGraph_delay(int graph_delay) {
    this.graph_delay = graph_delay;
  }
  /**
   * @return the graph_graphgoing
   */
  public int getGraph_graphgoing() {
    return graph_graphgoing;
  }
  /**
   * @param graph_graphgoing the graph_graphgoing to set
   */
  public void setGraph_graphgoing(int graph_graphgoing) {
    this.graph_graphgoing = graph_graphgoing;
  }
  
}
