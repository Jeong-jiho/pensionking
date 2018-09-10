package com.pension.common.image.vo;

public class ImageVO {
	private int i_no;
	private String i_name="";
	private String i_kind;
	private int r_no = 0;
	
	private String filename;
	private String[] filenames;
	
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public String[] getFilenames() {
		return filenames;
	}
	public void setFilenames(String[] filenames) {
		this.filenames = filenames;
	}
	public int getR_no() {
		return r_no;
	}
	public void setR_no(int r_no) {
		this.r_no = r_no;
	}
	public int getI_no() {
		return i_no;
	}
	public void setI_no(int i_no) {
		this.i_no = i_no;
	}
	public String getI_name() {
		return i_name;
	}
	public void setI_name(String i_name) {
		this.i_name = i_name;
	}
	public String getI_kind() {
		return i_kind;
	}
	public void setI_kind(String i_kind) {
		this.i_kind = i_kind;
	}
	
	
}
