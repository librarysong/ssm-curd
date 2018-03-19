package cn.tsu.edu.curd.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.tsu.edu.curd.bean.Employee;
import cn.tsu.edu.curd.bean.EmployeeExample;
import cn.tsu.edu.curd.bean.EmployeeExample.Criteria;
import cn.tsu.edu.curd.dao.EmployeeMapper;

@Service
public class EmployeeService {

	@Autowired
	EmployeeMapper employeeMapper;
    
	/**
	 * 查询所有员工
	 * @return
	 */
	public List<Employee> getAll() {
		// TODO Auto-generated method stub
		return employeeMapper.selectByExampleWithDept(null);
	}

	public void saveEmp(Employee employee) {
		// TODO Auto-generated method stub
		employeeMapper.insertSelective(employee);
	}

	public boolean ckeckUser(String empName) {
		// TODO Auto-generated method stub
		EmployeeExample example=new EmployeeExample();
		Criteria criteria = example.createCriteria();
		criteria.andEmpNameEqualTo(empName);
		long count=employeeMapper.countByExample(example);
		return count==0;
	}
    /**
     * 按照id查询员工信息
     * @param id
     * @return
     */
	public Employee getEmp(Integer id) {
		// TODO Auto-generated method stub
		Employee employee = employeeMapper.selectByPrimaryKey(id);
		return employee;
	}
    /**
     * 员工更新
     * @param employee
     */
	public void updateEmp(Employee employee) {
		// TODO Auto-generated method stub
		
		employeeMapper.updateByPrimaryKeySelective(employee);
	}
	

	public void deleteEmp(Integer id) {
		// TODO Auto-generated method stub
		employeeMapper.deleteByPrimaryKey(id);
	}
	/**
	 * 批量删除数据
	 * @param ids
	 */

	public void deleteBatch(List<Integer> ids) {
		// TODO Auto-generated method stub
		EmployeeExample example=new EmployeeExample();
		Criteria criteria=example.createCriteria();
		criteria.andEmpIdIn(ids);
		employeeMapper.deleteByExample(example);
	}

}
