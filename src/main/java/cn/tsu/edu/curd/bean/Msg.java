package cn.tsu.edu.curd.bean;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.javassist.expr.NewArray;

public class Msg {
	//状态码
	private int code;
	
	private String msg;
	
	private Map<String, Object> extend=new HashMap<String, Object>();
	
	
	public static Msg success()
	{
		Msg msg2 = new Msg();
		msg2.setCode(100);
		msg2.setMsg("处理成功!");
		return msg2;
	}
	
	public static Msg fail()
	{
		Msg msg2 = new Msg();
		msg2.setCode(200);
		msg2.setMsg("处理失败!");
		return msg2;
	}
	
	public Msg add(String key,Object value)
	{
		this.getExtend().put(key, value);
		return this;
	}
	

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public Map<String, Object> getExtend() {
		return extend;
	}

	public void setExtend(Map<String, Object> extend) {
		this.extend = extend;
	}
	

}
