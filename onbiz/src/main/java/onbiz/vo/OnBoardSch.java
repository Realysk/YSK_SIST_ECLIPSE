package onbiz.vo;

import java.util.Date;


public class OnBoardSch {
	
	// 요청값과 로직을 통해서 검색을 위한 VO
	// 1. 검색 : 제목/작성자
	private String bd_name;
	private String mem_no;
	// 2. 페이징 처리를 위한 속성
	private int count; // 총 데이터 건수
	private int pageSize; // 한번에 보여줄 페이지 크기
	private int pageCount; // 총 페이지 수 (count/pageSize)
	private int curPage; // 클릭한 현재 페이지번호
	private int start; // 현재 페이지 시작 번호
	private int end; // 현재 페이지 마지막 번호
	// 3. 블럭 처리 속성
	private int blockSize; // 한번에 보여줄 block의 크기
	private int startBlock; // block의 시작번호
	private int endBlock; // block의 마지막번호
	
	public String getBd_name() {
		return bd_name;
	}
	public void setBd_name(String bd_name) {
		this.bd_name = bd_name;
	}
	public String getMem_no() {
		return mem_no;
	}
	public void setMem_no(String mem_no) {
		this.mem_no = mem_no;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getPageCount() {
		return pageCount;
	}
	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}
	public int getCurPage() {
		return curPage;
	}
	public void setCurPage(int curPage) {
		this.curPage = curPage;
	}
	public int getStart() {
		return start;
	}
	public void setStart(int start) {
		this.start = start;
	}
	public int getEnd() {
		return end;
	}
	public void setEnd(int end) {
		this.end = end;
	}
	public int getBlockSize() {
		return blockSize;
	}
	public void setBlockSize(int blockSize) {
		this.blockSize = blockSize;
	}
	public int getStartBlock() {
		return startBlock;
	}
	public void setStartBlock(int startBlock) {
		this.startBlock = startBlock;
	}
	public int getEndBlock() {
		return endBlock;
	}
	public void setEndBlock(int endBlock) {
		this.endBlock = endBlock;
	}

}
