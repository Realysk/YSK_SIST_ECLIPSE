package onbiz.service;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import onbiz.dao.OnBoardDao;
import onbiz.vo.OnBoard;
import onbiz.vo.OnBoardFile;
import onbiz.vo.OnBoardSch;

@Service
public class OnBoardServ {
	
	@Autowired(required = false)
	private OnBoardDao dao;
	
	public ArrayList<OnBoard> bdList(OnBoard sch) {
		if(sch.getBd_name()==null) sch.setBd_name("");
		if(sch.getMem_no()==null) sch.setMem_no("");
		
		return dao.bdList(sch);
	}
	
	public void insBoard(OnBoard ins) {
		dao.insBoard(ins);
	}
	
	public OnBoard getBoard(int bd_no) {
		dao.uptViewCnt(bd_no); // 상세 조회 시, 조회수 카운팅
		OnBoard b = dao.getBoard(bd_no);
		//b.setBd_fname(dao.getBdFile(bd_no));
		return b;
	}
	
	public void uptBoard(OnBoard upt) {
		dao.uptBoard(upt);
	}
	
	public void delBoard(int bd_no) {
		dao.delBoard(bd_no);
	}
	
}