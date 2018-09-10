package com.pension.admin.room.vo;

import org.springframework.web.multipart.MultipartFile;

import com.pension.admin.price.vo.PriceVO;

public class RoomVO extends PriceVO{
	private int r_no = 0;
	private String r_name = "";
	private String r_size = ""; 
	private int r_standard = 0;
	private int r_max = 0;
	private String r_cvc = "";
	private String cvc[];
	private String r_date = "";
	private String r_update = "";
	private String r_kind = "";

	private String r_info = "";
	private String r_main = ""; 
	

	public String[] getCvc() {
		return cvc;
	}
	public void setCvc(String[] cvc) {
		this.cvc = cvc;
	}
	private MultipartFile file[];  
	private String filename;
	
	private String i_kind = "";
	private int i_no=0; 
	
	public int getI_no() {
		return i_no;
	}
	public void setI_no(int i_no) {
		this.i_no = i_no;
	}
	public String getR_main() {
		return r_main;
	}
	public void setR_main(String r_main) {
		this.r_main = r_main;
	}
	public String getI_kind() {
		return i_kind;
	}
	public void setI_kind(String i_kind) {
		this.i_kind = i_kind;
	}
	public MultipartFile[] getFile() {
		return file;
	}
	public void setFile(MultipartFile[] file) {
		this.file = file;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public String getR_info() {
		return r_info;
	}
	public void setR_info(String r_info) {
		this.r_info = r_info;
	}

	public int getR_no() {
		return r_no;
	}
	public void setR_no(int r_no) {
		this.r_no = r_no;
	}
	public String getR_name() {
		return r_name;
	}
	public void setR_name(String r_name) {
		this.r_name = r_name;
	}
	public String getR_size() {
		return r_size;
	}
	public void setR_size(String r_size) {
		this.r_size = r_size;
	}
	public int getR_standard() {
		return r_standard;
	}
	public void setR_standard(int r_standard) {
		this.r_standard = r_standard;
	}
	public int getR_max() {
		return r_max;
	}
	public void setR_max(int r_max) {
		this.r_max = r_max;
	}
	public String getR_cvc() {
		return r_cvc;
	}
	public void setR_cvc(String r_cvc) {
		this.r_cvc = r_cvc;
	}
	public String getR_date() {
		return r_date;
	}
	public void setR_date(String r_date) {
		this.r_date = r_date;
	}
	public String getR_update() {
		return r_update;
	}
	public void setR_update(String r_update) {
		this.r_update = r_update;
	}
	public String getR_kind() {
		return r_kind;
	}
	public void setR_kind(String r_kind) {
		this.r_kind = r_kind;
	}
	
	
}
