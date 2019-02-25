package com.item.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.item.bean.Classes;
import com.item.dao.ClassesDao;

@Service
public class ClassesServiceImpl implements ClassesService{

	@Autowired
	private ClassesDao classesDao;

	public List<Classes> getClassesAll() {
		// TODO Auto-generated method stub
		List<Classes> list = classesDao.selectByExample();
		return list;
	}

	public void addClasses(Classes classes) {
		classesDao.addClasses(classes);
	}

	

	public Classes getClassesById(Integer id) {
		return classesDao.getClassesById(id) ;
	}

	
	//一级分类
	public List<Classes> getParentClassesAll(Integer id) {
		return classesDao.findClassesByParentId(id);
	}
	public void addParentClasses(Classes classes) {
		classesDao.addParentClasses(classes);
	}
	
	//二级分类
	public List<Classes> getChildrenClassesAll(){
		return classesDao.getChildrenClassesAll();
	}
	public void addChildrenClasses(Classes classes) {
		classesDao.addChildrenClasses(classes);
	}

	

	public void deleteParentClasses(Integer id,Integer fid) {

		classesDao.deleteParentClasses(id,fid);
	}

	//修改一级分类
	public void updateParentClasses(Classes classes) {
		classesDao.updateParentClasses(classes);
	}
	
	public Classes getParentClassesByid(Integer id) {
		return classesDao.getClassesByParentId(id);
	}
	
	//查询所有二级分类
	public List<Classes> getChildrenClasses() {
		
		List<Classes> list=classesDao.getChildrenClassesAll();
		for(Classes item : list) {
			System.out.println(item);
		}
		return classesDao.getChildrenClassesAll();
	}

	//修改二级分类
	public Classes findChildrenClassesByid(Integer id) {
		return classesDao.findClassesByChildrenId(id);
	}
	public void updateChildrenClasses(Classes classes) {
		classesDao.updateChildrenClasses(classes);
	}

	
	
	//删除二级分类
	public void deleteBatch(int[] result) {
		classesDao.deleteBatch(result);
	}

	public void deleteChildrenClasses(Integer id) {
		classesDao.deleteChildrenClasses(id);
	}

	
	//查询根据一级ID来查询及以下的二级ID
	public List<Classes> findByIdChildrenClasses(Integer fid) {
		if(fid==null)
			return null;
		return classesDao.findByIdChildrenClasses(fid);
	}

	//查询所有的分类
	public List<Classes> findByAllClass() {
		return classesDao.findAllClass();
	}

	
	
	//查询根据删除的一级id查找是否有所有的二级分类
	/*public List<Integer> findChildrenClassesByids(Integer id) {
		List<Integer> list = classesDao.findChildrenClassesByids(id);
		return list;
	}*/

	
}
