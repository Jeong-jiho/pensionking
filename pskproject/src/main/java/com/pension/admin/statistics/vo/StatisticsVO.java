package com.pension.admin.statistics.vo;

public class StatisticsVO {
	private int res_totalcnt;		//총 예약건수
	private String res_total;			//총 예약 금액
	private int cancel_cnt;			//총 취소 건수
	private String cancel_total;		//총 취소 수수료 금액
	private int res_cnt;				//정상 예약 건수
	private String res_current;			//정상 에약 금액
	private String fure_total;			//총 누적 판매금액
	private String avg_price;			//객실 평균 판매금액
	private String avg_price_d;		//주중 객실 평균 판매금액
	private String avg_price_e;		//주말객실 평균 판매금액
	private double using_all;		//객실 가동률
	private double using_day;		//주중 객실 가동률
	private double using_end;		//주말 객실 가동률
	private int leadtime;			//예약 리드타임
	private int leadtime_d;			//주중 예약 리드타임
	private int leadtime_e;			//주말 예약 리드타임
	private double c_allpercent;	//총 취소율
	private double c_percent_d;		//주중 취소율
	private double c_percent_e;		//주말 취소율
	private int res_wait;			//오늘 대기 건수
	private int res_end;			//오늘 예약 건수
	private int res_cancel;			//오늘 취소 건수
	private String r_name;
	private int res_people;
	private String m_name;
	private String m_phone;
	private String res_bbq;
	private String res_no;
	
	public int getRes_cnt() {
		return res_cnt;
	}
	public void setRes_cnt(int res_cnt) {
		this.res_cnt = res_cnt;
	}
	public String getRes_current() {
		return res_current;
	}
	public void setRes_current(String res_current) {
		this.res_current = res_current;
	}
	public String getRes_no() {
		return res_no;
	}
	public void setRes_no(String res_no) {
		this.res_no = res_no;
	}
	public int getRes_people() {
		return res_people;
	}
	public void setRes_people(int res_people) {
		this.res_people = res_people;
	}
	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
	public String getM_phone() {
		return m_phone;
	}
	public void setM_phone(String m_phone) {
		this.m_phone = m_phone;
	}
	public String getRes_bbq() {
		return res_bbq;
	}
	public void setRes_bbq(String res_bbq) {
		this.res_bbq = res_bbq;
	}
	public int getRes_wait() {
		return res_wait;
	}
	public void setRes_wait(int res_wait) {
		this.res_wait = res_wait;
	}
	public int getRes_end() {
		return res_end;
	}
	public void setRes_end(int res_end) {
		this.res_end = res_end;
	}
	public int getRes_cancel() {
		return res_cancel;
	}
	public void setRes_cancel(int res_cancel) {
		this.res_cancel = res_cancel;
	}
	public String getR_name() {
		return r_name;
	}
	public void setR_name(String r_name) {
		this.r_name = r_name;
	}
	public int getRes_totalcnt() {
		return res_totalcnt;
	}
	public void setRes_totalcnt(int res_totalcnt) {
		this.res_totalcnt = res_totalcnt;
	}
	public String getRes_total() {
		return res_total;
	}
	public void setRes_total(String res_total) {
		this.res_total = res_total;
	}
	public int getCancel_cnt() {
		return cancel_cnt;
	}
	public void setCancel_cnt(int cancel_cnt) {
		this.cancel_cnt = cancel_cnt;
	}
	public String getCancel_total() {
		return cancel_total;
	}
	public void setCancel_total(String cancel_total) {
		this.cancel_total = cancel_total;
	}
	public String getFure_total() {
		return fure_total;
	}
	public void setFure_total(String fure_total) {
		this.fure_total = fure_total;
	}
	public String getAvg_price() {
		return avg_price;
	}
	public void setAvg_price(String avg_price) {
		this.avg_price = avg_price;
	}
	public String getAvg_price_d() {
		return avg_price_d;
	}
	public void setAvg_price_d(String avg_price_d) {
		this.avg_price_d = avg_price_d;
	}
	public String getAvg_price_e() {
		return avg_price_e;
	}
	public void setAvg_price_e(String avg_price_e) {
		this.avg_price_e = avg_price_e;
	}
	public double getUsing_all() {
		return using_all;
	}
	public void setUsing_all(double using_all) {
		this.using_all = using_all;
	}
	public double getUsing_day() {
		return using_day;
	}
	public void setUsing_day(double using_day) {
		this.using_day = using_day;
	}
	public double getUsing_end() {
		return using_end;
	}
	public void setUsing_end(double using_end) {
		this.using_end = using_end;
	}
	public int getLeadtime() {
		return leadtime;
	}
	public void setLeadtime(int leadtime) {
		this.leadtime = leadtime;
	}
	public int getLeadtime_d() {
		return leadtime_d;
	}
	public void setLeadtime_d(int leadtime_d) {
		this.leadtime_d = leadtime_d;
	}
	public int getLeadtime_e() {
		return leadtime_e;
	}
	public void setLeadtime_e(int leadtime_e) {
		this.leadtime_e = leadtime_e;
	}
	public double getC_allpercent() {
		return c_allpercent;
	}
	public void setC_allpercent(double c_allpercent) {
		this.c_allpercent = c_allpercent;
	}
	public double getC_percent_d() {
		return c_percent_d;
	}
	public void setC_percent_d(double c_percent_d) {
		this.c_percent_d = c_percent_d;
	}
	public double getC_percent_e() {
		return c_percent_e;
	}
	public void setC_percent_e(double c_percent_e) {
		this.c_percent_e = c_percent_e;
	}
	
	
}
