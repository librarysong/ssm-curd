<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>员工列表</title>
<%
  pageContext.setAttribute("APP_PATH",request.getContextPath());
%>

<!--  引入jquery-->

<script type="text/javascript" src="${APP_PATH}/static/js/jquery-1.12.4.js"></script>

<!-- 引入bootstrap样式 -->
<link href="${APP_PATH}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
<script src="${APP_PATH}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>
<body>

<!-- 员工修改模态框 -->

<div class="modal fade" id="empUpdateModel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" >员工修改</h4>
      </div>
      <div class="modal-body">
        
        
	 <form class="form-horizontal">
		  <div class="form-group">
		    <label class="col-sm-2 control-label">empName</label>
		    <div class="col-sm-10">
		      <p class="form-control-static" id="empName_update_static"></p>
		    </div>
		  </div>
		  <div class="form-group">
		    <label class="col-sm-2 control-label">email</label>
		    <div class="col-sm-10">
		      <input type="text" name="email" class="form-control" id="email_update_input" placeholder="email@126.com">
		      <span class="help-block"></span>
		    </div>
		  </div>
		  
		    <div class="form-group">
		    <label class="col-sm-2 control-label">gender</label>
		    <div class="col-sm-10">
		      <label class="radio-inline">
				  <input type="radio" name="gender" id="gender1_update_input" value="M" checked="checked"> 男
			   </label>
				<label class="radio-inline">
				  <input type="radio" name="gender" id="gender1_update_input" value="F"> 女
				</label>
		    </div>
		    </div>
		    <div class="form-group">
		    <label class="col-sm-2 control-label">deptName</label>
		    <div class="col-sm-4">

		     <select class="form-control" name="dId" > 
		     </select>

		    </div>

		  </div>
		  
		</form>
        
        
        
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
        <button type="button" class="btn btn-primary" id="emp_update_button">更新</button>
      </div>
    </div>
  </div>
</div> 









<!-- 员工添加模态框 -->
<div class="modal fade" id="empAddModel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">员工添加</h4>
      </div>
      <div class="modal-body">
        
        
	 <form class="form-horizontal">
		  <div class="form-group">
		    <label class="col-sm-2 control-label">empName</label>
		    <div class="col-sm-10">
		      <input type="text" name="empName" class="form-control" id="empName_add_input" placeholder="empName">
		      <span class="help-block"></span>
		    </div>
		  </div>
		  <div class="form-group">
		    <label class="col-sm-2 control-label">email</label>
		    <div class="col-sm-10">
		      <input type="text" name="email" class="form-control" id="email_add_input" placeholder="email@126.com">
		      <span class="help-block"></span>
		    </div>
		  </div>
		  
		    <div class="form-group">
		    <label class="col-sm-2 control-label">gender</label>
		    <div class="col-sm-10">
		      <label class="radio-inline">
				  <input type="radio" name="gender" id="gender1_add_input" value="M" checked="checked"> 男
			   </label>
				<label class="radio-inline">
				  <input type="radio" name="gender" id="gender1_add_input" value="F"> 女
				</label>
		    </div>
		    </div>
		    <div class="form-group">
		    <label class="col-sm-2 control-label">deptName</label>
		    <div class="col-sm-4">

		     <select class="form-control" name="dId" > 
		     </select>

		    </div>

		  </div>
		  
		</form>
        
        
        
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
        <button type="button" class="btn btn-primary" id="emp_save_button">保存</button>
      </div>
    </div>
  </div>
</div> 


<!-- 显示页面 -->
     <div class="container">
        <!-- 标题 -->
         <div class="row"></div>
            <div class="col-md-12">
               <h1>SSM-CRUD</h1>
            </div>
         <!-- 按钮 -->
         <div class="row">
            <div class="col-md-4 col-md-offset-8">
            
               <button class="btn btn-primary" id="emp_add_modal_btn">新增</button>
               <button class="btn btn-danger" id="emp_delete_all_btn">删除</button>
            </div>
         
         </div>
         <!-- 表格数据 -->
         <div class="row">
          <div class="col-md-12">
             <table class="table table-hover" id="emps_table">
             <thead>
                <tr>
                    <th>
                       <input type="checkbox" id="check_all">
                    </th>
                  <th>#</th>
                  <th>empName</th>
                  <th>gender</th>
                  <th>email</th>
                  <th>deptname</th>
                  <th>操作</th>
                </tr>
                </thead>
                
                <tbody>
                
                
                
                </tbody>
             </table>
          
          </div>
         
         </div>
         <!-- 分页数据 -->
         <div class="row">
             <!-- 分页文字信息 -->
             <div class="col-md-6" id="page_info_area">
                                     
             </div>
             
             <div class="col-md-6" id="page_nav_area">

             </div>
         </div>
     </div>
     
     <script type="text/javascript">
     
      var totalRecord,currentPage;
        $(function () {
        	to_page(1);
		});
        
        function to_page(pn){
        	$.ajax({
				url:"${APP_PATH}/emps",
				data:"pn="+pn,
				type:"get",
				success:function(result){
					//console.log(result)
					build_emps_table(result);
					
					page_info(result);
					
					build_page_nav(result);
					
				}

			});
        }
        
        function build_emps_table(result)
        {
        	$("#emps_table tbody").empty();
        	var emps=result.extend.pageInfo.list;
        	$.each(emps,function(index,item){
        		
        		var checkboxTd=$("<td><input type='checkbox' class='check_item'/></td>");
        		var empIdTd=$("<td></td>").append(item.empId);
        		var empNameTd=$("<td></td>").append(item.empName);
        		var genderTd=$("<td></td>").append(item.gender=='M'? "男":"女");
        		var emailTd=$("<td></td>").append(item.email);
        		var deptName=$("<td></td>").append(item.department.deptName);
        		
        		
        		var editBtn=$("<button></button>").addClass("btn btn-primary btn-sm edit_btn")
        		             .append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append("编辑");
        		//为编辑按钮添加一个自定义属性，来表示当前的员工
        		editBtn.attr("edit-id",item.empId);
        		var delBtn=$("<button></button>").addClass("btn btn-danger btn-sm delete_btn")
	                         .append($("<span></span>").addClass("glyphicon glyphicon-trash")).append("删除");
        		//为删除按钮添加一个自定义属性
        		delBtn.attr("del-id",item.empId);
        		var btnTd=$("<td></td>").append(editBtn).append(" ").append(delBtn);
        		
        		$("<tr></tr>").append(checkboxTd)
        		.append(empIdTd)
        		.append(empNameTd)
        		.append(genderTd)
        		.append(emailTd)
        		.append(deptName)
        	    .append(btnTd)
        		.appendTo("#emps_table tbody");
        	});
        }
        
        //解析分页信息
        
        function page_info(result)
        {
        	$("#page_info_area").empty();
        	$("#page_info_area").append("当前"+result.extend.pageInfo.pageNum +"页,总 "+ 
        			result.extend.pageInfo.pages+"页,总"+result.extend.pageInfo.total +" 条记录");
        	totalRecord=result.extend.pageInfo.total;
        	currentPage=result.extend.pageInfo.pageNum;
        }
        
        function build_page_nav(result)
        {
        	$("#page_nav_area").empty();
        	var ul=$("<ul></ul>").addClass("pagination");
        	
        	
        	//构建元素
        	var firstPageLi=$("<li></li>").append($("<a></a>").append("首页").attr("href","#"));
        	var prePageLi=$("<li></li>").append($("<a></a>").append("&laquo;"));
        	
        	if(result.extend.pageInfo.hasPreviousPage==false){
        	
        		firstPageLi.addClass("disabled");
        		prePageLi.addClass("disabled");
             }else{
            	//为元素添加点击翻页事件
             	firstPageLi.click(function(){
             		to_page(1);
             	})
             	
             	prePageLi.click(function(){
             		to_page(result.extend.pageInfo.pageNum-1);
             	})
             }
        	
        	
        	var nextPageLi=$("<li></li>").append($("<a></a>").append("&raquo;"));
        	var lastPageLi=$("<li></li>").append($("<a></a>").append("末页").attr("href","#"));
        	
        	if(result.extend.pageInfo.hasNextPage==false){
        		nextPageLi.addClass("disabled");
        		lastPageLi.addClass("disabled");
        	}else{
        		nextPageLi.click(function(){
            		to_page(result.extend.pageInfo.pageNum+1);
            	})
            	
            	lastPageLi.click(function(){
            		to_page(result.extend.pageInfo.pages);
            	})
            	
        	}
        	
        	
        	ul.append(firstPageLi).append(prePageLi);
        	
        	$.each(result.extend.pageInfo.navigatepageNums,function(index,item){
        		var numLi=$("<li></li>").append($("<a></a>").append(item));
        		
        		if(result.extend.pageInfo.pageNum==item)
        		{
        			numLi.addClass("active");
        		}
        		numLi.click(function(){
        			to_page(item);
        		})
        		ul.append(numLi);
        	});
        	
        	ul.append(nextPageLi).append(lastPageLi);
        	
        	var navEle=$("<nav></nav>").append(ul);
        	navEle.appendTo("#page_nav_area");
        }
        
        //清空表单样式和状态
        function reset_form(ele){
        	$(ele)[0].reset();
        	$(ele).find("*").removeClass("has-success has-error");
        	$(ele).find(".help-block").text("");
        }
        
        //点击新增按钮 ，弹出模态框
          $("#emp_add_modal_btn").click(function(){
        	  //清除表单数据内容
        	  //$("#empAddModel form")[0].reset();
              reset_form("#empAddModel form");
        	  
        	  //发送ajax请求  ，查询部门信息
        	 getDepts("#empAddModel select");
        	  
        	$("#empAddModel").modal({
        		
        	backdrop:"static"
        	});
        }); 
        
        
        function getDepts(ele){
        	
            //清空之前下拉列表的值
            $(ele).empty();
            
        	$.ajax({
        		url:"${APP_PATH}/depts",
        		type:"GET",
        		success:function(result){
        			//console.log(result);
        			
        		$.each(result.extend.depts,function(){
        			var optionEle=$("<option></option>").append(this.deptName).attr("value",this.deptId);
        			optionEle.appendTo(ele);
        		});
        		}
        	});
        }
        
        function validate_add_form(){
        	//拿到要校验的数据
        	var empName=$("#empName_add_input").val();
        	var regName=/(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,5})/;
        	
        	if(!regName.test(empName)){
        		//alert("用户名可以是2-5位中文");
        		show_validate_msg("#empName_add_input","error","用户名可以是2-5位中文");
        		return false;
        	}else{
        		show_validate_msg("#empName_add_input","success","");
        	}; 
        	
        	//校验邮箱
        	
        	var email=$("#email_add_input").val();
        	var regEmail=/^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
        	
        	if(! regEmail.test(email)){
        		//alert("邮箱格式不正确");
        		show_validate_msg("#email_add_input","error","邮箱格式不正确");
        		return false;
        	}else{
        		show_validate_msg("#email_add_input","success","");
        	};
        	return true;
        	
        }
        
        function show_validate_msg(ele,status,msg){
        	
        	//清除当前元素的状态
        	$(ele).parent().removeClass("has-success has-error");
        	$(ele).next("span").text("");
        	
        	if("success"==status){
        		$(ele).parent().addClass("has-success");
        		$(ele).next("span").text(msg);
        		
        	}else if("error"==status){
        		$(ele).parent().addClass("has-error");
        		$(ele).next("span").text(msg);
        	}
        }
        
        $("#empName_add_input").change(function(){
        	//发送ajax请求校验用户名是否可用
        	var empName=this.value;
        	$.ajax({
        		url:"${APP_PATH}/checkuser",
        		data:"empName="+empName,
        		type:"POST",
        		success:function(result){
        		
        			if(result.code==100){
        				show_validate_msg("#empName_add_input","success","用户名可用");
        				$("#emp_save_button").attr("ajax-va","success");
        			}else{
        				show_validate_msg("#empName_add_input","error",result.extend.va_msg);
        				$("#emp_save_button").attr("ajax-va","error");
        			}
        		}
        	});
        	
        });
        
        
        //点击保存，保存员工
        $("#emp_save_button").click(function(){
        	//先进行数据校验
        	
        	  if(!validate_add_form()){
        		return false;
        	}; 
        	
        	//2 判断用户名ajax校验是否正确
        	if($(this).attr("ajax-va")=="error"){
        		return false;
        	}
        	
        	
            $.ajax({
        		url:"${APP_PATH}/emp",
        		type:"POST",
        		data:$("#empAddModel form").serialize(),
        		success:function(result){
        			//alert(result.msg);
        			
        			if(result.code==100){
        				$("#empAddModel").modal('hide');
        				to_page(totalRecord);
        			}else{
        				//console.log(result);
        				//alert(result.extend.errorField.email);
        				
        				
        				if(undefined!=result.extend.errorField.email){
        					//显示邮箱错误信息
        					show_validate_msg("#email_add_input","error",result.extend.errorField.email);
        				}
        				
        				if(undefined!=result.extend.errorField.empName){
        					//显示员工错误信息
        					show_validate_msg("#empName_add_input","error",result.extend.errorField.empName);
        				}
        			}
        		}
        	}); 
        }); 
        
        $(document).on("click",".edit_btn",function(){
        	//alert("edit");
        	
        	
        		//查出部门信息，显示部门信息
        	getDepts("#empUpdateModel select");
        	//查出员工信息,显示员工信息
        	getEmp($(this).attr("edit-id"));
        
        	//把编辑按钮的值给更新按钮
        	$("#emp_update_button").attr("edit-id",$(this).attr("edit-id"));
        	
        	//弹出模态框
        	$("#empUpdateModel").modal({
        		
            	backdrop:"static"
            	});
        });
        
        function getEmp(id){
        	$.ajax({
        		url:"${APP_PATH}/emp/"+id,
        		type:"GET",
        		success:function(result){
        			//console.log(result);
        			var empData=result.extend.emp;
        			$("#empName_update_static").text(empData.empName);
        			$("#email_update_input").val(empData.email);
        			$("#empUpdateModel input[name='gender']").val([empData.gender]);
        			$("#empUpdateModel select").val([empData.dId]);
        		}
        	});
        }
        
        //点击更新，更新员工信息
        $("#emp_update_button").click(function(){
        	
        	//首先校验邮箱是否合法
        	var email=$("#email_update_input").val();
        	var regEmail=/^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
        	
        	if(! regEmail.test(email)){
        		//alert("邮箱格式不正确");
        		show_validate_msg("#email_update_input","error","邮箱格式不正确");
        		return false;
        	}else{
        		show_validate_msg("#email_update_input","success","");
        	}
        	
        	//发送ajax请求更新员工
        	$.ajax({
        		url:"${APP_PATH}/emp/"+$(this).attr("edit-id"),
        		type:"PUT",
        		data:$("#empUpdateModel form").serialize(),
        		success:function(result){
        			//关闭对话框回到页面
        			$("#empUpdateModel").modal("hide");
        			to_page(currentPage);
        		}
        	});
        });
        
        //点击删除(单个删除)
        $(document).on("click",".delete_btn",function(){
        	var empName=$(this).parents("tr").find("td:eq(2)").text();
        	//alert($(this).parents("tr").find("td:eq(1)").text());
        	var empId=$(this).attr("del-id");
        	if(confirm("确认删除【"+empName+"】吗?")){
        		$.ajax({
        			url:"${APP_PATH}/emp/"+empId,
        			type:"DELETE",
        			success:function(result){
        				alert(result.msg);
        				to_page(currentPage);
        			}
        		});
        	}
        });
        
        //全选全不选
        
        $("#check_all").click(function(){
        	//alert($(this).prop("checked"));
        	$(".check_item").prop("checked",$(this).prop("checked"));
        });
        
        $(document).on("click",".check_item",function(){
        	var flag=$(".check_item:checked").length==$(".check_item").length;
        	
        	$("#check_all").prop("checked",flag);
        });
        
        //点击删除，全部删除
        $("#emp_delete_all_btn").click(function(){
        	
        	var empName="";
        	var del_idstr="";
        	$.each($(".check_item:checked"),function(){
        		empName+=$(this).parents("tr").find("td:eq(2)").text()+",";
        		
        		//组装员工id的字符串
        		del_idstr+=$(this).parents("tr").find("td:eq(1)").text()+"-";
        	});
        	
        	//去除empName多余的
        	empName=empName.substring(0,empName.length-1);
        	del_idstr=del_idstr.substring(0,del_idstr.length-1);
        	if(confirm("确认删除【"+empName+"】吗？")){
        		//发送ajax请求删除数据
        		$.ajax({
        			url:"${APP_PATH}/emp/"+del_idstr,
        			type:"DELETE",
        			success:function(result){
        				alert(result.msg);
        				to_page(currentPage);
        			}
        		});
        	}
        });
        
     </script>
  

</body>
</html>