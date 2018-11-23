<%@page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>register</title>
<link href="css/common.css" rel="stylesheet" type="text/css" />
<link href="css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript"  src="${pageContext.request.contextPath}/js/jquery-1.11.1.js"></script>
		<script type="text/javascript">
		$(function(){
			$("#changeImg").click(function(){
				 $("#imgVcode").prop("src","${pageContext.request.contextPath}/getImg.do?a="+Math.random());
			});
			$("[name='user_name']").blur(checkName);
			$("[name='user_password']").blur(checkPwd);
			$("[name='user_card_no']").blur(checkId);
			$("[name='user_tel']").blur(checkTel);
	    });	
			function checkName(){
					var str=$("[name='user_name']").val();
					var reg =/^[\w]{6,}$/;
					if(reg.test(str)){
					   $("#resultName").html("用户名输入正确").css("color","green");
					   return true;
					}else{
				   $("#resultName").html("用户名输入错误，用户名要求不低于6 个字符,请按要求输入").css("color","red");
				   return false;
					}
			}
			
			function checkPwd(){
					var str=$("[name='user_password']").val();
					var reg =/^[\w]{6,}$/;
					if(reg.test(str)){
					   $("#resultPwd").html("密码输入正确").css("color","green");
					    return true;
					}else{
				   $("#resultPwd").html("密码输入错误，密码要求不低于6个字符，请按要求输入").css("color","red");
				   return false;
					}
			}
			
			function checkId(){
					var str=$("[name='user_card_no']").val();
					var reg =/^[\d]{17}[A-Z\d]{1}$/;
					if(reg.test(str)){
					   $("#resultId").html("输入正确").css("color","green");
					    return true;
					}else{
				   $("#resultId").html("输入错误，必填项请按要求输入").css("color","red");
				   return false;
					}
			}
			
			function checkTel(){
			 		var str =$("[name='user_tel']").val();
			 		var reg =/^1[3578][\d]{9}$/;
			 		if(reg.test(str)){
					   $("#resultTel").html("输入正确").css("color","green");
					    return true;
					}else{
				   $("#resultTel").html("输入错误，必填项请按要求输入").css("color","red");
				   return false;
					}
			};
		
		function checkForm(){
		        // console.log("test");
				if(checkName()&checkPwd()&checkId()&checkTel()){
					return true;
				}else{
				return false;
				}
		}
		
		
		</script>
</head>

<body>
<div class="wrap">
  <!-- main begin-->
      <div class="zclf login logns">
        <h1  class="blue">用户注册</h1>
          <form  action="${pageContext.request.contextPath}/regist.do"  method="post"  onsubmit="return checkForm()">
          <dl>
            <dd>
              <label> <small>*</small>用户名</label>
              <input  name="user_name" type="text" class="inputh lf" value="" /><span id="resultName"></span>
             <div class="lf red laba"></div>
            </dd>
            <dd>
              <label> <small>*</small>密码</label>
              <input name="user_password" type="text" class="inputh lf" value="" /><span id="resultPwd"></span>
              <div class="lf red laba"></div>
            </dd>
            <dd>
              <label> <small>*</small>身份证号</label>
              <input name="user_card_no" type="text" class="inputh lf" value="" /><span id="resultId"></span>
              <div class="lf red laba"></div>
            </dd>
            <dd>
              <label> <small>*</small>电话</label>
              <input name="user_tel" type="text" class="inputh lf" value="" /><span id="resultTel"></span>
              <div class="lf red laba"></div>
            </dd>
            <dd>
              <label> <small>*</small>住址</label>
              <input name="user_address" type="text" class="inputh lf" value="" />
            </dd>
            <dd>
              <label> <small>*</small>邮政编码</label>
              <input name="user_post_number" type="text" class="inputh lf" value="" />
            </dd>
            <dd class="hegas">
              <label> <small>*</small>验证码</label>
              <input  name="str" type="text" class="inputh inputs lf" value="" />
               <span class="wordp lf"><img id="imgVcode" src="${pageContext.request.contextPath}/getImg.do" width="96" height="27" alt="" /></span>
               <span class="blues lf"><a href="javascript:void(0)" title="" id="changeImg">看不清</a></span>
            </dd>
            <dd class="hegas">
              <label>&nbsp;</label>
               <input name=""  type="checkbox" id="rem_u"   />
              <label for="rem_u" class="labels">我同意<span class="blues">《服务条款》</span></label>
            </dd>
            <dd class="hegas">
              <label>&nbsp;</label>
              <input type="submit" value="立即注册" class="spbg buttombg buttombgs f14 lf" />
            </dd>
            
          </dl>
       </form>
    </div>
<!-- main end-->
<!-- footer begin-->

</div>
 <!--footer end-->
 
</div>
</body>
</html>
