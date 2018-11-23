<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title> 登录</title>
<link href="css/common.css" rel="stylesheet" type="text/css" />
<link href="css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript"  src="${pageContext.request.contextPath}/js/jquery-1.11.1.js"></script>
<script type="text/javascript">
         $(function(){
            $("#changeImg").click(function(){
				 $("#imgVcode").prop("src","${pageContext.request.contextPath}/getImg.do?a="+Math.random());
			});
         });
         
     
     
</script>

</head>

<body>
<div class="wrap">
<!-- main begin-->
 <div class="main">
   <div class="sidebar">
     <p><img src="images/img1.jpg" width="443" height="314" alt="" /></p>
   </div>
   <div class="sidebarg">
     <form action="${pageContext.request.contextPath}/login.do" method="post" >
    <div class="login">
      <dl>  
        <dt class="blues">用户登陆</dt>
        <dd><label for="name">用户名：</label><input   name="user_name" type="text" class="inputh" value="常用邮箱" id="name"/></dd>
        <dd><label for="password">密 码：</label><input name="user_password" type="text" class="inputh" value="密码" id="password"/></dd>
        <dd>
           <label class="lf" for="passwords">验证码：</label>
           <input   name="str" type="text" class="inputh inputs lf" value="验证码" id="passwords"/>
           <span class="wordp lf"><img id="imgVcode"  src="${pageContext.request.contextPath}/getImg.do" width="96" height="27" alt="" /></span>
           <span class="blues lf"><a href="javascript:void(0)" title=""  id="changeImg">看不清</a></span>
        </dd>
        <dd>
           <input name=""  type="checkbox" id="rem_u"  />
           <span for="rem_u">下次自动登录</span>
        </dd>
        <dd class="buttom">
           <input name="" type="submit" value="登 录" class="spbg buttombg f14 lf" />
           <a href="regist.jsp"  ><input name="" type="button" value="注 册" class="spbg buttombg f14 lf" /></a>
           <span class="blues  lf"><a href="" title="">忘记密码?</a></span>
           <div class="cl"></div>
        </dd>
       
      </dl>
    </div>
    </form>
   </div>
  <div class="cl"></div>
 </div>
<!-- main end-->
 
<!-- footer begin-->
</div>
 <!--footer end-->
 
</div>
</body>
</html>
