package com.pension.client.review.vo;

import org.springframework.web.multipart.MultipartFile;

import com.pension.admin.price.vo.PriceVO;

public class ReviewVO extends PriceVO {

	private int rv_no =0;		    //후기 번호
	private String rv_title = "";	//후기 제목
	private String rv_content ="";  //후기 내용
	private String rv_date ="";     //작성일
	private String rv_pwd = "";     //비밀번호
	private String rv_update ="";   //수정일
	private String rv_name= "";     //작성자
	private int readcnt;			//후기 조회수
	private int rp_cnt;             //댓글 수
	 
	// 파일 업로드를 위한 필드
	private MultipartFile file; 	//첨부파일
	private String rv_file="";
	
	//조건 검색시 사용한 필드
	private String search = "";
	private String keyword = "";
	private String start_date = "";
	private String end_date = "";
		
	
		
	public int getRv_no() {
		return rv_no;
	}
	public void setRv_no(int rv_no) {
		this.rv_no = rv_no;
	}
	public String getRv_title() {
		return rv_title;
	}
	public void setRv_title(String rv_title) {
		this.rv_title = rv_title;
	}
	public String getRv_content() {
		return rv_content;
	}
	public void setRv_content(String rv_content) {
		this.rv_content = rv_content;
	}
	public String getRv_date() {
		return rv_date;
	}
	public void setRv_date(String rv_date) {
		this.rv_date = rv_date;
	}
	public String getRv_pwd() {
		return rv_pwd;
	}
	public void setRv_pwd(String rv_pwd) {
		this.rv_pwd = rv_pwd;
	}
	public String getRv_update() {
		return rv_update;
	}
	public void setRv_update(String rv_update) {
		this.rv_update = rv_update;
	}
	public MultipartFile getFile() {
		return file;
	}
	public void setFile(MultipartFile file) {
		this.file = file;
	} 
	public String getRv_file() {
		return rv_file;
	}
	public void setRv_file(String rv_file) {
		this.rv_file = rv_file;
	}
	public String getRv_name() {
		return rv_name;
	}
	public void setRv_name(String rv_name) {
		this.rv_name = rv_name;
	}
	public int getReadcnt() {
		return readcnt;
	}
	public void setReadcnt(int readcnt) {
		this.readcnt = readcnt;
	}
	public int getRp_cnt() {
		return rp_cnt;
	}
	public void setRp_cnt(int rp_cnt) {
		this.rp_cnt = rp_cnt;
	}
	public String getSearch() {
		return search;
	}
	public void setSearch(String search) {
		this.search = search;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
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
	
}
