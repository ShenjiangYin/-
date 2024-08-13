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
<!--内容展示区头部-->
<div class="box-header with-border">
    <h3 class="box-title">图书查询</h3>
</div>
<!--内容展示区头部-->
<!--内容展示区数据-->
<div class="box-body">
	 <!--数据搜索工具栏-->
    <div class="box-tools pull-right">
        <div class="has-feedback">
            <form action="${pageContext.request.contextPath}/book/query" method="post">
                图书名称：<input name="name" value="${book.name}">
                作者：<input name="author" value="${book.author}">
                出版社：<input name="press" value="${book.press}">
                <input class="btn btn-default" type="submit" value="查询">
            </form>
        </div>
    </div>
    <!--数据搜索工具栏/-->
    <!--数据表格-->
    <table id="dataList" class="table table-bordered table-striped table-hover dataTable text-center">
        <thead>
        <tr>
            <th class="sorting_asc">名称</th>
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
          <!--循环显示图书信息-->
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
                <!--如果图书库存大于0，借阅按钮有效，否则无效-->
                <c:if test="${book.storage>0}">
                  <button type="button" class="btn bg-olive btn-xs" data-toggle="modal" data-target="#bookModal" onclick="borrowBook('${book.isbn}')">借阅</button>
                </c:if>
                <c:if test="${book.storage==0}">
                  <button type="button" class="btn bg-olive btn-xs" disabled="true">借阅</button>
                </c:if>
              </td>
             </tr>
          </c:forEach>
        </tbody>
    </table>
    <!--数据表格/-->
</div>
<!--内容展示区数据/ -->
<%--引入图书信息模态窗口--%>
<jsp:include page="/views/bookModal.jsp"></jsp:include>
<script type="text/javascript">
//定义js方法
function borrowBook(isbn) {
	var url = "${pageContext.request.contextPath}/book/queryBookByIsbn?isbn=" + isbn;
	$.get(url, function(data) {
		$("#mark").val("借阅");
		$("#name").val(data.name);
		$("#author").val(data.author);
		$("#press").val(data.press);
		$("#isbn").val(data.isbn);
		$("#publishTime").val(data.publishTime);
		$("#price").val(data.price);
		$("#storage").val(data.storage);
	})
}
</script>
</body>
</html>