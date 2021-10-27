package onbiz.dao;

import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import onbiz.vo.OnTask_Project;

@Repository
public interface OnGanttDao {

	// [간트차트] 참여프로젝트 조회 
	public ArrayList<OnTask_Project> myProList(OnTask_Project sch);
		
	// [간트차트] 작업목록 조회 
	public ArrayList<OnTask_Project> ganttList(OnTask_Project sch);
	
	// [간트차트] 프로젝트 참여 멤버 조회
	public ArrayList<OnTask_Project> userList(OnTask_Project op);
	
	// [간트차트] 작업 등록/수정/삭제
	public void insertTask(OnTask_Project task);
	public void updateTask(OnTask_Project task);
	public void deleteTask(OnTask_Project task);
}
