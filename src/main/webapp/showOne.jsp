<%@page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib  prefix="fmt"   uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>showOne</title>
<link href="${pageContext.request.contextPath}/css/common.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.11.1.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/check2.js"></script>
</head>

<body>
<div class="wrap">
  <!-- main begin-->
  <div class="sale">
    <h1 class="lf">在线拍卖系统</h1>
    <div class="logout right"><a href="#" title="注销">注销</a></div>
  </div>
      <div class="login logns produce">
        <h1 class="blues">拍卖品信息</h1>
        <form onsubmit="return check()" action="${pageContext.request.contextPath}/update.do"   method="post"  enctype="multipart/form-data">
          <dl>
            <dd >
              <label>名称：</label>
              <input   name="auction_id"    type="hidden"    value="${requestScope.auction.auction_id}"/>
              <input  name="auction_name" type="text" class="inputh lf" value="${requestScope.auction.auction_name}" />
              <span  id="name"></span>
            </dd>
            <dd>
              <label>起拍价：</label>
              <input name="auction_start_price" type="text" class="inputh lf" value="${requestScope.auction.auction_start_price}" />
             <span id="resultPrice" class="lf red laba" ></span>
            </dd>
            <dd>
              <label>底价：</label>
              <input name="auction_upset" type="text" class="inputh lf" value="${requestScope.auction.auction_upset}" />
              <span id="resultUp"  class="lf red laba"></span>
            </dd>
            <dd>
              <label>开始时间：</label>
              <input name="auction_start_time"  type="text" class="inputh lf" value="<fmt:formatDate value="${requestScope.auction.auction_start_time}"  pattern="yyyy-MM-dd  HH:mm:ss"/>" />
             <span id="startTime" class="lf red laba"></span>
              <!-- <div class="lf red laba">格式：2011-05-05 12:30:00</div> -->
            </dd>
            <dd>
              <label>结束时间：</label>
              <input name="auction_end_time"  type="text" class="inputh lf" value="<fmt:formatDate value="${requestScope.auction.auction_end_time}"  pattern="yyyy-MM-dd  HH:mm:ss"/>" />
             <span id="endTime" class="lf red laba"></span>
             <!--  <div class="lf red laba">格式：2011-05-05 12:30:00</div> -->
            </dd>
            <dd class="dds">
              <label>描述：</label>
              <textarea name="auction_desc" cols="" rows="" class="textarea">${requestScope.auction.auction_desc}</textarea>
            <span id="desc" class="lf red laba"></span>
            </dd>
            <dd>
              <label>修改图片：</label>
              <div class="lf salebd"><a href="#"><img src="${pageContext.request.contextPath}/images/${requestScope.auction.auction_pic}" width="100" height="100" /></a></div>
               <input  name="auction_pic"   value="${requestScope.auction.auction_pic}" type="hidden"/>
               <input name="imgFile" type="file" class="marg10"  value="input" />
               <span id="file" class="lf red laba"></span>
            </dd>
            <dd class="hegas">
                <input name="" type="submit" value="保 存" class="spbg buttombg buttombgs f14 lf buttomb" />
                <input name="" type="submit" value="取 消" class="spbg buttombg buttombgs f14 lf buttomb" />
                
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
