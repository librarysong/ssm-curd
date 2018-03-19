package cn.tsu.edu.curd.controller;

import static org.hamcrest.CoreMatchers.nullValue;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import cn.tsu.edu.curd.bean.Employee;
import cn.tsu.edu.curd.bean.Msg;
import cn.tsu.edu.curd.services.EmployeeService;

/**
 * 处理员工crud
 * @author song
 *
 */
@Controller
public class EmployeeController {
	
	
	@Autowired
    EmployeeService employeeService;
	
	/**
	 * 单个批量二合一
	 * @param id
	 * @return
	 */
	@RequestMapping(value="/emp/{ids}",method=RequestMethod.DELETE)
	@ResponseBody
	public Msg deleteEmpBy(@PathVariable("ids") String ids)
	{
		if(ids.contains("-")) {
			
			List<Integer> del_ids=new ArrayList<>();
			String[] strings = ids.split("-");
			
			for(String string:strings) {
				del_ids.add(Integer.parseInt(string));
			}
			employeeService.deleteBatch(del_ids);
			
		}else {
			Integer id=Integer.parseInt(ids);
			employeeService.deleteEmp(id);
		}
		
		return Msg.success();
	}
	
	
	//根据id更新员工
	@RequestMapping(value="/emp/{empId}",method=RequestMethod.PUT)
	@ResponseBody
	public Msg saveEmp(Employee employee)
	{
		employeeService.updateEmp(employee);
		return Msg.success();
	}
	
	
	//根据id查询员工
	@RequestMapping(value="/emp/{id}",method=RequestMethod.GET)
	@ResponseBody
	public Msg getEmp(@PathVariable("id")Integer id) {
		Employee employee=employeeService.getEmp(id);
		return Msg.success().add("emp", employee);
		
	}
	
	@ResponseBody
	@RequestMapping("/checkuser")
	public Msg checkuser(@RequestParam("empName")String empName) {
		//先判断用户名是否是合法的表达式
		
		String regx="(^[a-zA-Z0-9_-]{6,16}$)|(^[\\u2E80-\\u9FFF]{2,5})";
		boolean matches = empName.matches(regx);
		
		if(!matches)
		{
			return Msg.fail().add("va_msg", "用户名必须是6-16位数字和字母的组合或者2-5位中文");
			
		}
		
		boolean b=employeeService.ckeckUser(empName);
		if(b) {
			return Msg.success();
		}else {
			return Msg.fail().add("va_msg", "用户名不可用");
		}
	}
	
	
	@RequestMapping(value="/emp",method=RequestMethod.POST)
	@ResponseBody
	public Msg saveEmp(@Valid Employee employee,BindingResult result)
	{
		Map<String, Object> map=new HashMap<String, Object>();
		if(result.hasErrors()) {
			List<FieldError> errors = result.getFieldErrors();
			for(FieldError fieldError :errors) {
			System.out.println("错误的字段名:"+fieldError.getField());
			System.out.println("错误信息："+fieldError.getDefaultMessage());
			
			map.put(fieldError.getField(), fieldError.getDefaultMessage());
			}
			return Msg.fail().add("errorField", map);
		}else {
			employeeService.saveEmp(employee);
			return  Msg.success();
		}
	
	}
	
	@RequestMapping("/emps")
	@ResponseBody
	public Msg getEmpsWithJson(@RequestParam(value="pn",defaultValue="1")Integer pn,Model model)
	{
		//引入分页插件
		
				PageHelper.startPage(pn,5);
				//紧跟的查询就是一个分页查询
				List<Employee> emps=employeeService.getAll();
				
				//包装查询信息
				PageInfo page=new PageInfo(emps,5);
				return Msg.success().add("pageInfo",page);
	}
	
	/**
	 * 查询员工数据
	 * @return
	 */
	//@RequestMapping("/emps")
	public String getEmps(@RequestParam(value="pn",defaultValue="1")Integer pn,Model model)
	{
		//引入分页插件
		
		PageHelper.startPage(pn,5);
		//紧跟的查询就是一个分页查询
		List<Employee> emps=employeeService.getAll();
		
		//包装查询信息
		PageInfo page=new PageInfo(emps,5);
		model.addAttribute("pageInfo", page);
		return "list";
	}

}
