package cn.tsu.edu.curd.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.tsu.edu.curd.bean.Department;
import cn.tsu.edu.curd.bean.Msg;
import cn.tsu.edu.curd.services.DepartmentService;

/**
 * 和部门有关的信息
 * @author song
 *
 */
@Controller
public class DepartmentController {
	
	@Autowired
	private DepartmentService departmentService;
	
	@RequestMapping("/depts")
	@ResponseBody
	public Msg getDepts()
	{
		List<Department> list=departmentService.getDepts();
		return Msg.success().add("depts", list);
	}

}
