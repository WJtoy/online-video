package com.item.bean;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class Classes implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer id;
	private String classname;
	private Integer fid;
	private List<Classes> children=new ArrayList<Classes>();
	private Classes parent;
	
	public Classes() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getClassname() {
		return classname;
	}
	public void setClassname(String classname) {
		this.classname = classname;
	}
	
	public Integer getFid() {
		return fid;
	}
	public void setFid(Integer fid) {
		this.fid = fid;
	}
	

	public List<Classes> getChildren() {
		return children;
	}

	public void setChildren(List<Classes> children) {
		this.children = children;
	}

	public Classes getParent() {
		return parent;
	}

	public void setParent(Classes parent) {
		this.parent = parent;
	}

	@Override
	public String toString() {
		return "Classes [id=" + id + ", classname=" + classname + ", fid=" + fid + ", children=" + children
				+ ", parent=" + parent + "]";
	}
	
}
