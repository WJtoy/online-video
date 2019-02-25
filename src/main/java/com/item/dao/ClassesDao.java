package com.item.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.item.bean.Classes;

public interface ClassesDao {

	public List<Classes> selectByExample();

	public void addClasses(Classes classes);

	public Classes getClassesById(Integer id);

	
	//一级分类
	public List<Classes> getParentClassesAll();
	
	public List<Classes> findClassesByParentId(Integer id);

	public void addParentClasses(Classes classes);
	
	public void deleteParentClasses(@Param("id")Integer id,@Param("fid")Integer fid);
	
	//二级分类
	public List<Classes> getChildrenClassesAll();

	public void addChildrenClasses(Classes classes);

	public void deleteChildrenClasses(Integer id);

	public List<Classes> selectByChildrenId();
	
	public List<Classes> selectByChildrenByid(int id);
	
	//修改一级分类
	public void updateParentClasses(Classes classes);

	public Classes getClassesByParentId(Integer id);
	
	//修改二级分类
	public void updateChildrenClasses(Classes classes);

	public Classes findClassesByChildrenId(Integer id);
	//查询根据一级ID来查询及以下的二级ID
	public List<Classes> findByIdChildrenClasses(Integer fid);
	
	//批量删除二级分类
	public void deleteBatch(int[] result);
	
	
	//查询学习路线分类的信息
	public int getLearningRoute(Integer id);
	
	
	//查询所有的分类
	public List<Classes> findAllClass();
	
	
	//查询根据删除的一级id查找是否有所有的二级分类
	/*public List<Integer> findChildrenClassesByids(Integer id);*/
}
