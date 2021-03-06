<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="jquery/bootstrap_3.3.0/css/bootstrap.min.css" type="text/css" rel="stylesheet" />
<script type="text/javascript" src="jquery/jquery-1.11.1-min.js"></script>
<script type="text/javascript" src="jquery/bootstrap_3.3.0/js/bootstrap.min.js"></script>

	<script>
		$(function(){
			//在页面加载完毕后，让用户这个文本框自动获得交点
			$("#loginAct").focus();
			
			//为登陆按钮绑定事件，执行登陆操作
			$("#submitBtn").click(function(){
				login();
			})
			
			//为当前登陆窗口绑定敲键盘事件
			$(window).keydown(function(event){
				//如果取得的码值为13，表示敲的是回车键
				if(event.keyCode==13){
					login();
				}
			})
			
		})
		function login(){
			//判断账号密码是否为空
			//将文本中的左右空格去掉，使用$.trim(文本);
			var loginAct=$.trim($("#loginAct").val());
			var loginPwd=$.trim($("#loginPwd").val());
			if(loginAct=="" || loginPwd==""){
				$("#msg").html("账号密码不能为空");
				
				//如果账号密码为空，终止该方法
				return false;
			}
			
			//账号密码格式正确，去后台验证相关操作
			$.get("user/login.do",{"loginAct":loginAct,"loginPwd":loginPwd},callback,"json");
			function callback(param){
				/* 
					data	
				{"success":true/false,"msg":"哪错了"}
				*/
				if(param.success){
					//如果成功，跳转到欢迎页
					window.location.href="workbench/index.jsp";
				}else{
					//如果登陆失败
					$("#msg").html(param.msg);
				}
			}
		}
	</script>
<title>Insert title here</title>
</head>
<body>
	<div style="position: absolute; top: 0px; left: 0px; width: 60%;">
		<img src="image/IMG_7114.JPG" style="width: 100%; height: 90%; position: relative; top: 50px;">
	</div>
	<div id="top" style="height: 50px; background-color: #3C3C3C; width: 100%;">
		<div style="position: absolute; top: 5px; left: 0px; font-size: 30px; font-weight: 400; color: white; font-family: 'times new roman'">CRM &nbsp;<span style="font-size: 12px;">&copy;2019&nbsp;蛙课网</span></div>
	</div>
	
	<div style="position: absolute; top: 120px; right: 100px;width:450px;height:400px;border:1px solid #D5D5D5">
		<div style="position: absolute; top: 0px; right: 60px;">
			<div class="page-header">
				<h1>登录</h1>
			</div>
			<form action="workbench/index.jsp" class="form-horizontal" role="form">
				<div class="form-group form-group-lg">
					<div style="width: 350px;">
						<input class="form-control" type="text" placeholder="用户名" id="loginAct">
					</div>
					<div style="width: 350px; position: relative;top: 20px;">
						<input class="form-control" type="password" placeholder="密码" id="loginPwd">
					</div>
					<div class="checkbox"  style="position: relative;top: 30px; left: 10px;">
						<label>
							<input type="checkbox"> 十天内免登录
						</label>
						&nbsp;&nbsp;
						<span id="msg" style="color: red;"></span>
					</div>
					<button type="button"  id="submitBtn" class="btn btn-primary btn-lg btn-block"  style="width: 350px; position: relative;top: 45px;">登录</button>
				</div>
			</form>
		</div>
	</div>
</body>
</html>