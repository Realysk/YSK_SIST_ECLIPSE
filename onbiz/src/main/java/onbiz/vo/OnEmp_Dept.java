package onbiz.vo;

public class OnEmp_Dept {
String dept_no; //--부서번호
String dept_name; //--부서이름
String dept_loc; //--부서위치
public OnEmp_Dept() {
  super();
  // TODO Auto-generated constructor stub
}
public OnEmp_Dept(String dept_no, String dept_name, String dept_loc) {
  super();
  this.dept_no = dept_no;
  this.dept_name = dept_name;
  this.dept_loc = dept_loc;
}
public OnEmp_Dept(String dept_name) {
  super();
  this.dept_name = dept_name;
}
/**
 * @return the dept_no
 */
public String getDept_no() {
  return dept_no;
}
/**
 * @param dept_no the dept_no to set
 */
public void setDept_no(String dept_no) {
  this.dept_no = dept_no;
}
/**
 * @return the dept_name
 */
public String getDept_name() {
  return dept_name;
}
/**
 * @param dept_name the dept_name to set
 */
public void setDept_name(String dept_name) {
  this.dept_name = dept_name;
}
/**
 * @return the dept_loc
 */
public String getDept_loc() {
  return dept_loc;
}
/**
 * @param dept_loc the dept_loc to set
 */
public void setDept_loc(String dept_loc) {
  this.dept_loc = dept_loc;
}
}
