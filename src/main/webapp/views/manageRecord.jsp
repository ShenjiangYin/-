<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>学校图书管理系统</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
    	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/AdminLTE.css">
    	<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    	<script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
	</head>
<body>
<!--数据展示头部-->
<div class="box-header with-border">
    <h3 class="box-title">借阅记录</h3>
</div>
<!--数据展示头部-->
<!--数据展示内容区-->
<div class="box-body">
	 <!--工具栏 数据搜索 -->
    <div class="box-tools pull-right">
        <div class="has-feedback">
            <form action="${pageContext.request.contextPath}/record/query" method="post">
                图书名称：<input name="name" value="${record.book.name}">
                借阅人：<input name="borrower" value="${record.borrower}">
                借阅状态：<input name="status" value="${record.status}">
                <input class="btn btn-default" type="submit" value="查询">
            </form>
        </div>
    </div>
    <!--工具栏 数据搜索 /-->
    <!-- 数据表格 -->
    <table id="dataList" class="table table-bordered table-striped table-hover dataTable text-center">
        <thead>
        <tr>
            <th class="sorting_asc">图书名称</th>
            <th class="sorting">作者</th>
            <th class="sorting">出版社</th>
            <th class="sorting">ISBN</th>
            <th class="sorting">出版时间</th>
            <th class="sorting">定价</th>
            <th class="sorting">借阅人</th>
            <th class="sorting">借阅时间</th>
            <th class="sorting">到期时间</th>
            <th class="sorting">归还时间</th>
            <th class="sorting">借阅状态</th>
            <th class="text-center">操作</th>
        </tr>
        </thead>
        <tbody>
        <!--循环显示借阅记录-->
        <c:forEach items="${records}" var="record">
            <tr>
                <td>${record.book.name}</td>
                <td>${record.book.author}</td>
                <td>${record.book.press}</td>
                <td>${record.isbn}</td>
                <td>${record.book.publishTime}</td>
                <td>${record.book.price}</td>
                <td>${record.borrower}</td>
                <td>${record.borrowTime}</td>
                <td>${record.deadline}</td>
                <td>${record.returnTime}</td>
                <td>${record.status}</td>
                <td class="text-center">
                	<!--如果借阅状态为“借阅中”或“已逾期”，归还按钮有效，否则无效-->
                    <c:if test="${record.status=='借阅中' || record.status=='已逾期'}">
                        <button type="button" class="btn bg-olive btn-xs" onclick="returnBook('${record.book.name}','${record.isbn}','${record.borrower}')">归还</button>
                    </c:if>
                    <c:if test="${record.status=='已归还'}">
                        <button type="button" class="btn bg-olive btn-xs" disabled="true">归还</button>
                    </c:if>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <!-- 数据表格 /-->
</div>
<!-- 数据展示内容区/ -->

<script type="text/javascript">
//定义js方法returnBook()
function returnBook(name, isbn, borrower) {
	var result = window.confirm("确定归还图书?" + name);
	if (result) {
		var url ="${pageContext.request.contextPath}/book/return?isbn=" + isbn + "&borrower=" + borrower;
		$.get(url, function(status) {
			if (status == true) {
				window.location.href = "${pageContext.request.contextPath}/record/query";
			}
		})
	}
}
</script>
</body>
</html>