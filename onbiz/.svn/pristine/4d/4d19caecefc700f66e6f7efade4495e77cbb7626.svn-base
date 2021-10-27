package onbiz.service;

import java.util.ArrayList;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import onbiz.dao.OnGanttDao;
import onbiz.vo.OnTask_Project;

@Service
public class OnGanttService {
	@Autowired
	private OnGanttDao dao;
	
	// [간트차트/내작업] 참여프로젝트 조회 
	public ArrayList<OnTask_Project> myProList(OnTask_Project sch) {
		return dao.myProList(sch);
	}
		
	// [간트차트] 작업할당 - 작업리스트 조회
	public ArrayList<OnTask_Project> ganttList(OnTask_Project sch) {
		return dao.ganttList(sch);
	}
	
	// [간트차트] 간트차트 멤버리스트 조회
	public ArrayList<OnTask_Project> userList(OnTask_Project op) {
		return dao.userList(op);
	};
	
	// [간트차트] 작업할당 등록 - 진행상태 수정하기 
	public void insertTask(OnTask_Project task) {
		
		
		Date sysDte = new Date();
		/*

		// startDte가 regDte보다 뒤면 진행대기
		// startDte가 regDte보다 앞이면 진행중 
		// startDte < regDte < endDte
		ins.getStart_date();
		
		Date sysDte = new Date();
		LocalDate date = LocalDate.now();
		
		// DB에 삽입할 날짜 형식
		SimpleDateFormat temp = new SimpleDateFormat("YYYY-MM-dd HH:mm:ss", java.util.Locale.KOREA);
		 */
		
		System.out.println("번호" + task.getId());
		System.out.println("작업명" + task.getText());
		System.out.println("작업담당자" + task.getUser());
		System.out.println("작업시작일" + task.getStart_date());
		System.out.println("작업종료일" + task.getEnd_date());
		System.out.println("작업내용" + task.getContent());
		System.out.println("작업기간" + task.getDuration());
		System.out.println("상위작업" + task.getParent());
		System.out.println("퍼센트" + task.getProgress());
		System.out.println("우선순위" + task.getPriority());
		
		task.setTask_state("진행중");
		System.out.println("진행상태" + task.getTask_state());
		System.out.println("등록일" + task.getTask_regdte());
		System.out.println("수정일" + task.getTask_uptdte());
		System.out.println("멤버번호" + task.getMem_no());


		dao.insertTask(task);
		
	}
	
	// [간트차트] 작업할당 수정
	public void updateTask(OnTask_Project task) {
		
		System.out.println("번호" + task.getId());
		System.out.println(task.getText());
		System.out.println(task.getUser());
		System.out.println(task.getContent());
		System.out.println(task.getDuration());
		System.out.println(task.getEnd_date());
		System.out.println(task.getParent());
		System.out.println(task.getPriority());
		System.out.println(task.getStart_date());
		System.out.println(task.getTask_state());
		System.out.println(task.getTask_uptdte());
		System.out.println(task.getMem_no());
		
		dao.updateTask(task);
		
	}
	
	// [간트차트] 작업할당 삭제 - 아직 미실험..!
	public void deleteTask(OnTask_Project task) {
		
		System.out.println("번호" + task.getId());
		System.out.println("멤버번호" + task.getMem_no());
		dao.deleteTask(task);
	}	

}
