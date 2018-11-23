<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>auction</title>
    <link href="${pageContext.request.contextPath}/css/common.css" rel="stylesheet" type="text/css"/>
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.11.1.js"></script>
    <script type="text/javascript">
        function checkdelete(id) {
            if (confirm("确定要删除吗？")) {
                window.location = "${pageContext.request.contextPath}/delete.do?id=" + id;
            }
        }

        function toPage(pageNum) {
            var obj = document.getElementById("myForm");
            var inputObj = document.getElementById("pageNum");
            inputObj.value = pageNum;
            obj.action = "${pageContext.request.contextPath}/getAll.do";
            obj.submit();
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
    <div class="forms">
        <form action="${pageContext.request.contextPath}/getAll.do" method="post">

            <label for="name">名称</label>
            <input name="auction_name" value="${requestScope.auc.auction_name}" type="text" class="nwinput" id="name"/>
            <label for="names">描述</label>
            <input name="auction_desc" value="${requestScope.auc.auction_desc}" type="text" id="names" class="nwinput"/>
            <label for="time">开始时间</label>
            <input name="auction_start_time" type="text" id="time" class="nwinput"/>
            <label for="end-time">结束时间</label>
            <input name="auction_end_time" type="text" id="end-time" class="nwinput"/>
            <label for="price">起拍价</label>
            <input name="auction_start_price" value="${requestScope.auc.auction_start_price}" type="text" id="price"
                   class="nwinput"/>
            <input name="" type="submit" value="查询" class="spbg buttombg f14  sale-buttom"/>
        </form>
        <c:if test="${sessionScope.user.user_is_admin==1}">
            <a href="${pageContext.request.contextPath}/addAuction.jsp"><input type="button" value="发布"
                                                                               class="spbg buttombg f14  sale-buttom buttomb"/></a>
        </c:if>
    </div>
    <div class="items">
        <ul class="rows even strong">
            <li>名称</li>
            <li class="list-wd">描述</li>
            <li>开始时间</li>
            <li>结束时间</li>
            <li>起拍价</li>
            <li class="borderno">操作</li>
        </ul>

        <c:forEach items="${requestScope.list}" var="a" varStatus="sta">
        <c:if test="${sta.index%2==0 }">
        <ul class="rows">
            </c:if>
            <c:if test="${sta.index%2 !=0 }">
            <ul class="rows even">
                </c:if>
                <li><a href="国书" title="">${a.auction_name}</a></li>
                <li class="list-wd">${a.auction_desc}</li>
                <li><fmt:formatDate value="${a.auction_start_time}" pattern="yyyy-MM-dd  HH:mm:ss"/></li>
                <li><fmt:formatDate value="${a.auction_end_time}" pattern="yyyy-MM-dd  HH:mm:ss"/></li>
                <li>${a.auction_start_price}</li>
                <li class="borderno red">
                    <c:if test="${sessionScope.user.user_is_admin==0}">
                        <a href="${pageContext.request.contextPath}/getAllOrder.do?id=${a.auction_id}">竞拍</a>
                    </c:if>
                    <c:if test="${sessionScope.user.user_is_admin==1}">
                        <a href="${pageContext.request.contextPath}/getOne.do?id=${a.auction_id}" title="修改">修改</a>|
                        <a onclick="checkdelete(${a.auction_id})" href="javascript:void(0)" title="删除">删除</a>
                    </c:if>
                </li>
            </ul>
            </c:forEach>

            <div class="page">
                <a href="javascript:void(0)" title="" onclick="toPage(1)">首页</a>
                <c:if test="${requestScope.pageInfo.pageNum > 1}">
                    <a href="javascript:void(0)" title="" onclick="toPage(${requestScope.pageInfo.pageNum-1})">上一页</a>
                </c:if>
                <c:if test="${requestScope.pageInfo.pageNum < requestScope.pageInfo.pages}">
                    <a href="javascript:void(0)"
                       title="" onclick="toPage(${requestScope.pageInfo.pageNum+1})">下一页</a>
                </c:if>
                <a href="javascript:void(0)" title="" onclick="toPage(${requestScope.pageInfo.pages})">尾页</a>

                <form method="post" id="myForm">
                    <input id="pageNum" name="pageNum" value="${requestScope.pageInfo.pageNum}" type="hidden"/>
                    <input name="auction_name" value="${requestScope.auc.auction_name}" type="hidden"/>
                    <input name="auction_desc" value="${requestScope.auc.auction_desc}" type="hidden"/>
                    <input name="auction_start_time" value="${requestScope.auc.auction_start_time}" type="hidden"/>
                    <input name="auction_end_time" value="${requestScope.auc.auction_end_time}" type="hidden"/>
                    <input name="auction_start_price" value="${requestScope.auc.auction_start_price}" type="hidden"/>
                </form>

            </div>
    </div>
</div>
</body>
</html>
