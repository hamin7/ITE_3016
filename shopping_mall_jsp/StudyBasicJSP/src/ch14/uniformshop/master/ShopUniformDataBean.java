package ch14.uniformshop.master;

import java.sql.Timestamp;

public class ShopUniformDataBean {
	private int uniform_id;//유니폼의 등록번호
	private String uniform_kind;//유니폼의 분류
	private String uniform_title;//유니폼 이름
	private int uniform_price;//유니폼 가격
	private short uniform_count;//유니폼의 재고수량
	private String team;//팀
	private String launch_com;//유니폼회사
	private String launch_date;//발매일
	private String uniform_image;//유니폼 이미지명
	private String uniform_content;//유니폼 설명
	private byte discount_rate;//유니폼 할인율
	private Timestamp reg_date;//유니폼 등록날짜
	
	public int getUniform_id() {
		return uniform_id;
	}
	public void setUniform_id(int uniform_id) {
		this.uniform_id = uniform_id;
	}
	public String getUniform_kind() {
		return uniform_kind;
	}
	public void setUniform_kind(String uniform_kind) {
		this.uniform_kind = uniform_kind;
	}
	public String getUniform_title(){
		return uniform_title;
	}
	public void setUniform_title(String uniform_title) {
		this.uniform_title = uniform_title;
	}
	public int getUniform_price() {
		return uniform_price;
	}
	public void setUniform_price(int uniform_price) {
		this.uniform_price = uniform_price;
	}
	public short getUniform_count() {
		return uniform_count;
	}
	public void setUniform_count(short uniform_count) {
		this.uniform_count = uniform_count;
	}
	public String getTeam() {
		return team;
	}
	public void setTeam(String team) {
		this.team = team;
	}
	public String getLaunch_com() {
		return launch_com;
	}
	public void setLaunch_com(String launch_com) {
		this.launch_com = launch_com;
	}
	public String getLaunch_date() {
		return launch_date;
	}
	public void setLaunch_date(String launch_date) {
		this.launch_date = launch_date;
	}
	public String getUniform_image() {
		return uniform_image;
	}
	public void setUniform_image(String uniform_image) {
		this.uniform_image = uniform_image;
	}
	public String getUniform_content() {
		return uniform_content;
	}
	public void setUniform_content(String uniform_content) {
		this.uniform_content = uniform_content;
	}
	public byte getDiscount_rate() {
		return discount_rate;
	}
	public void setDiscount_rate(byte discount_rate) {
		this.discount_rate = discount_rate;
	}
	public Timestamp getReg_date() {
		return reg_date;
	}
	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}
}