<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib  prefix="fmt"   uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link href="${pageContext.request.contextPath}/css/common.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript"  src="${pageContext.request.contextPath}/js/jquery-1.11.1.js"></script>
<script type="text/javascript">
      
        		function  checkPrice(){
        		    var i= $("[class='items sg-font']").children().length;
        		     var startPrice = $("#borderno").html();
        		     startPrice = parseInt(startPrice);
        		     var strs= $("[name='auction_price']").val();
        		     var  str=parseInt(strs); 
        		      var price = startPrice;     		          		   
        		     if(i>=2){
	        		     price =$("#price").get(0).innerHTML;
	        		     price =parseFloat(price);       		     
        		     }       		     
        		     var  reg=/^[\d]+$/;        		  
        		     if(reg.test(strs)&&str>price&&str>startPrice){
        		             $("#result").html("可以竞拍").css("color","green");
        		              return true;
        		      }else{
        		             $("#result").html("请输入数字，且不能低于起拍价和最高竞拍价").css("color","red");
        		    		 return false;
        		      }
        		      
        		}
      

</script>
</head>

<body>
<div class="wrap">
<!-- main begin-->
  <div class="sale">
    <h1 class="lf">在线拍卖系统</h1>
    <div class="logout right"><a href="#" title="注销">注销</a></div>
  </div>
  <div class="items sg-font lf">
      <ul class="rows">
        <li>名称：</li>
        <li class="borderno">${auc.auction_name}</li>
      </ul>
      <ul class="rows">
        <li>描述：</li>
        <li class="borderno">${auc.auction_desc}</li>
      </ul>
      <ul class="rows">
        <li>开始时间：</li>
        <li class="borderno"><fmt:formatDate value="${auc.auction_start_time}"  pattern="yyyy-MM-dd  HH:mm:ss"/></li>
      </ul>
      <ul class="rows">
        <li>结束时间：</li>
        <li class="borderno"><fmt:formatDate value="${auc.auction_end_time}"  pattern="yyyy-MM-dd  HH:mm:ss"/></li>
      </ul>
      <ul class="rows border-no">
        <li>起拍价：</li>
        <li id="borderno" class="borderno">${auc.auction_start_price}</li>
      </ul>
  </div>
  <div class="rg borders"><img src="${pageContext.request.contextPath}/${auc.auction_pic}" width="270" height="185" alt="" /></div>
  <div class="cl"></div>
  <div class="top10 salebd">
     <form action="${pageContext.request.contextPath}/addRecord.do"   method="post"  onsubmit="return checkPrice()">
       <p>
	       <label for="sale">出价：</label>
	       <input name="auction_id" type="hidden"  class="inputwd" id="sale" value="${auc.auction_id}"/>
	       <input  name="auction_price"  type="text"  class="inputwd" id="sale" onblur="checkPrice()"/>
	       <input name="" type="submit" value="竞 拍" class="spbg buttombg f14  sale-buttom" />
       </p>
    </form>  
       <span id="result"  class="f14 red" ></span>
  </div>
  <div class="top10">
    <a href="${pageContext.request.contextPath}/getAllOrder.do?id=${auc.auction_id}"><input name="" type="submit" value="刷 新" class="spbg buttombg f14" /></a>
    <a href="${pageContext.request.contextPath}/getAll.do"><input name="" type="submit" value="返回列表" class="spbg buttombg f14" /></a>
  </div>
  <div class="offer">
    <h3>出价记录</h3>
    <div class="items sg-font">
    <ul class="rows">
             <li>竞拍时间</li>
	        <li>竞拍价格</li>
	        <li class="borderno">竞拍人</li>
	 </ul>   
    
    <c:forEach items="${list}"  var="r"  varStatus="sta">
        <c:if test="${sta.index%2==0 }">
	      		<ul class="rows even strong">
   		</c:if>
        <c:if test="${sta.index%2 !=0 }">     
        		<ul class="rows">
     </c:if>
	        <li><fmt:formatDate value="${r.auction_time}"  pattern="yyyy-MM-dd  HH:mm:ss"/></li>
	        <li id="price">${r.auction_price}</li>
	        <li class="borderno">${r.user.user_name}</li>
	      </ul>   
     </c:forEach>      
  </div>
  </div>
<!-- main end-->
</div>
</body>
</html>
