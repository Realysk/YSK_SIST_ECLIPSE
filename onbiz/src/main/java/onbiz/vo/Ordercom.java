package onbiz.vo;

import java.util.Date;

public class Ordercom {
 String  ordercom_no ;
 String ordercom_kind; //('금융기업','공공기업','판매업','숙박업','기타')),
 String ordercom_name ;
 Date ordercom_regdte;
public Ordercom() {
  super();
  // TODO Auto-generated constructor stub
}
public Ordercom(String ordercom_no, String ordercom_kind, String ordercom_name,
    Date ordercom_regdte) {
  super();
  this.ordercom_no = ordercom_no;
  this.ordercom_kind = ordercom_kind;
  this.ordercom_name = ordercom_name;
  this.ordercom_regdte = ordercom_regdte;
}
public Ordercom(String ordercom_name,String ordercom_kind) {
  this.ordercom_name = ordercom_name;
  this.ordercom_kind = ordercom_kind;
  
}
public Ordercom(String ordercom_name) {
  super();
  this.ordercom_name = ordercom_name;
}
/**
 * @return the ordercom_no
 */
public String getOrdercom_no() {
  return ordercom_no;
}
/**
 * @param ordercom_no the ordercom_no to set
 */
public void setOrdercom_no(String ordercom_no) {
  this.ordercom_no = ordercom_no;
}
/**
 * @return the ordercom_kind
 */
public String getOrdercom_kind() {
  return ordercom_kind;
}
/**
 * @param ordercom_kind the ordercom_kind to set
 */
public void setOrdercom_kind(String ordercom_kind) {
  this.ordercom_kind = ordercom_kind;
}
/**
 * @return the ordercom_name
 */
public String getOrdercom_name() {
  return ordercom_name;
}
/**
 * @param ordercom_name the ordercom_name to set
 */
public void setOrdercom_name(String ordercom_name) {
  this.ordercom_name = ordercom_name;
}
/**
 * @return the ordercom_regdte
 */
public Date getOrdercom_regdte() {
  return ordercom_regdte;
}
/**
 * @param ordercom_regdte the ordercom_regdte to set
 */
public void setOrdercom_regdte(Date ordercom_regdte) {
  this.ordercom_regdte = ordercom_regdte;
}
}
