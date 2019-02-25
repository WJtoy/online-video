package com.item.service;

import java.util.List;

import com.item.bean.Classes;

public interface ClassesService {

	public List<Classes> getClassesAll();

	public Classes getClassesById(Integer id);

	
	
	//一二级分类
	public List<Classes> getParentClassesAll(Integer id);

	public List<Classes> getChildrenClassesAll();

	public void addParentClasses(Classes classes);

	public void addChildrenClasses(Classes classes);

	public void deleteParentClasses(Integer id,Integer fid);

	public void updateParentClasses(Classes classes);

	public Classes getParentClassesByid(Integer id);

	public void updateChildrenClasses(Classes classes);

	public Classes findChildrenClassesByid(Integer id);

	public void deleteBatch(int[] result);

	public void deleteChildrenClasses(Integer id);
	
	//查询根据删除的一级id查找是否有所有的二级分类
	/*public List<Integer> findChildrenClassesByids(Integer id);*/
	
	//查询根据一级ID来查询及以下的二级ID
	public List<Classes> findByIdChildrenClasses(Integer id);

	//查询所有的分类
	public List<Classes> findByAllClass();

	
	
	
}
