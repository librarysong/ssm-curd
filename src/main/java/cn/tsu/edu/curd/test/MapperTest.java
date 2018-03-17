package cn.tsu.edu.curd.test;

import java.rmi.server.UID;
import java.util.UUID;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import cn.tsu.edu.curd.bean.Employee;
import cn.tsu.edu.curd.dao.DepartmentMapper;
import cn.tsu.edu.curd.dao.EmployeeMapper;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {"classpath:applicationContext.xml"})
public class MapperTest {
	
	
	
    @Autowired
	DepartmentMapper departmentMapper;
    
    @Autowired
    EmployeeMapper EmployeeMapper;
    
    @Autowired
    SqlSession sqlSession;
    
	@Test
	public void testCURD()
	{
		/*ApplicationContext context=new ClassPathXmlApplicationContext("applicationContext.xml");
		DepartmentMapper mapper = context.getBean(DepartmentMapper.class);*/
		
		//System.out.println(departmentMapper);
		
		//1.插入几个部门
		
//		departmentMapper.insertSelective(new Department(null,"开发部"));
//		departmentMapper.insertSelective(new Department(null,"测试版"));
		
		//2.插入员工
		
		//EmployeeMapper.insertSelective(new Employee(null,"tom","M","tom@126.com",1));
		
		
		//3.批量插入
		
		EmployeeMapper mapper = sqlSession.getMapper(EmployeeMapper.class);
		
		for(int i=0;i<1000;i++)
		{
			String string = UUID.randomUUID().toString().substring(0,5);
			mapper.insertSelective(new Employee(null,"string","M",string+"@126.com",1));
			
		}
		
		
	}

}
