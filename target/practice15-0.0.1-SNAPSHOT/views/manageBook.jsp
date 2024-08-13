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
    <h3 class="box-title">图书管理</h3>
</div>
<!--数据展示头部-->
<!--数据展示内容区-->
<div class="box-body">
<%--新增按钮：如果当前登录用户是管理员，页面展示新增按钮--%>
        <div class="pull-right">
            <div class="form-group form-inline">
                <div class="btn-group">
                    <button type="button" class="btn btn-default" data-toggle="modal"
                            data-target="#bookModal" onclick="addBook()"> 添加
                    </button>
                </div>
            </div>
        </div>

	 <!--工具栏 数据搜索 -->
    <div class="box-tools pull-right">
        <div  class="has-feedback">
            <form action="${pageContext.request.contextPath}/book/manage" method="post">
                图书名称：<input name="name" value="${book.name}">
                作者：<input name="author" value="${book.author}">
                出版社：<input name="press" value="${book.press}">
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
            <th class="sorting">库存</th>
            <th class="text-center">操作</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${books}" var="book">
            <tr>
                <td>${book.name}</td>
                <td>${book.author}</td>
                <td>${book.press}</td>
                <td>${book.isbn}</td>
                <td>${book.publishTime}</td>
                <td>${book.price}</td>
                <td>${book.storage}</td>
                <td class="text-center">
                	<button type="button" class="btn bg-olive btn-xs" data-toggle="modal" data-target="#bookModal" onclick="updateBook('${book.isbn}')">更新</button>
                	<button type="button" class="btn bg-olive btn-xs" onclick="deleteBook('${book.name}','${book.isbn}')">删除</button>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <!-- 数据表格 /-->
</div>
<!-- 数据展示内容区/ -->
<%--引入存放模态窗口的页面--%>
<jsp:include page="/views/bookModal.jsp"></jsp:include>
<script type="text/javascript">
function addBook() {
	$("#mark").val("添加");
	$("#name").val("");
	$("#author").val("");
	$("#press").val("");
	$("#isbn").val("");
	$("#publishTime").val("");
	$("#eprice").val("");
	$("#storage").val("");
}
function updateBook(isbn) {
	var url = "${pageContext.request.contextPath}/book/queryBookByIsbn?isbn=" + isbn;
	$.get(url, function(data) {
		$("#mark").val("更新");
		$("#name").val(data.name);
		$("#author").val(data.author);
		$("#press").val(data.press);
		$("#isbn").val(data.isbn);
		$("#publishTime").val(data.publishTime);
		$("#price").val(data.price);
		$("#storage").val(data.storage);
	})
}
function deleteBook(name, isbn) {
	var result = confirm("确定删除图书?" + name);
	if (result) {
		var url ="${pageContext.request.contextPath}/book/delete?isbn=" + isbn;
		$.get(url, function(status) {
			if (status == true) {
				window.location.href = "${pageContext.request.contextPath}/book/manage";
			}
		})
	}
}

</script>
</body>
</html>