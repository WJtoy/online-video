package com.item.bean;

import java.io.Serializable;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class Video  implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private Integer id;
	private String coursename;
	private String describe;
	private String url;
	private Integer baseadvance;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd hh:mm:ss")
	private Date uploadtime;
	private Integer cid;
	private Classes classes;
	
	
	
	
	public Integer getBaseadvance() {
		return baseadvance;
	}
	public void setBaseadvance(Integer baseadvance) {
		this.baseadvance = baseadvance;
	}
	public Integer getCid() {
		return cid;
	}
	public void setCid(Integer cid) {
		this.cid = cid;
	}
	public Classes getClasses() {
		return classes;
	}
	public void setClasses(Classes classes) {
		this.classes = classes;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getCoursename() {
		return coursename;
	}
	public void setCoursename(String coursename) {
		this.coursename = coursename;
	}
	public String getDescribe() {
		return describe;
	}
	public void setDescribe(String describe) {
		this.describe = describe;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	
	public Date getUploadtime() {
		return uploadtime;
	}
	public void setUploadtime(Date uploadtime) {
		this.uploadtime = uploadtime;
	}
	
	public Video() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "Video [id=" + id + ", coursename=" + coursename + ", describe=" + describe + ", url=" + url
				+ ", baseadvance=" + baseadvance + ", uploadtime=" + uploadtime + ", cid=" + cid + ", classes="
				+ classes + "]";
	}
	

}
