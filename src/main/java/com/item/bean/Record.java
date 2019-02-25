package com.item.bean;

import java.util.Date;

public class Record {
	
	private Integer id;
	private Date recordtime;
	private Integer uid;
	private Integer cid;
	private User u;
	private Video vi;
	
	
	
	public Integer getCid() {
		return cid;
	}
	public void setCid(Integer cid) {
		this.cid = cid;
	}
	public Video getVi() {
		return vi;
	}
	public void setVi(Video vi) {
		this.vi = vi;
	}
	public Integer getUid() {
		return uid;
	}
	public void setUid(Integer uid) {
		this.uid = uid;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	
	public User getU() {
		return u;
	}
	public void setU(User u) {
		this.u = u;
		}
	
	public Date getRecordtime() {
		return recordtime;
	}
	public void setRecordtime(Date recordtime) {
		this.recordtime = recordtime;
	}

	public Record() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "Record [id=" + id + ", recordtime=" + recordtime + ", uid=" + uid + ", cid=" + cid + ", u=" + u
				+ ", vi=" + vi + "]";
	}
	
	
	
}
