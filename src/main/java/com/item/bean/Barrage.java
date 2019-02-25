package com.item.bean;

import java.util.Date;

public class Barrage {
	
	private Integer id;
	private String  text;
	private Date sendTime;
	private Integer usid;
	private Integer vid;
	private User us;
	private Video vi;
	
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public User getUs() {
		return us;
	}
	public void setUs(User us) {
		this.us = us;
	}
	public Video getVi() {
		return vi;
	}
	public void setVi(Video vi) {
		this.vi = vi;
	}
	
	public Date getSendTime() {
		return sendTime;
	}
	public void setSendTime(Date sendTime) {
		this.sendTime = sendTime;
	}
	
	public Integer getUsid() {
		return usid;
	}
	public void setUsid(Integer usid) {
		this.usid = usid;
	}
	public Integer getVid() {
		return vid;
	}
	public void setVid(Integer vid) {
		this.vid = vid;
	}
	
	
	public Barrage() {
		super();
		// TODO Auto-generated constructor stub
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	@Override
	public String toString() {
		return "Barrage [id=" + id + ", text=" + text + ", sendTime=" + sendTime + ", usid=" + usid + ", vid=" + vid
				+ ", us=" + us + ", vi=" + vi + "]";
	}
	
	
	
	
	
}
