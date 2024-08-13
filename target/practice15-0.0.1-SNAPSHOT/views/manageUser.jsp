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
    <h3 class="box-title">用户管理</h3>
</div>
<!--数据展示头部-->
<!--数据展示内容区-->
<div class="box-body">
<%--如果当前登录用户是管理员，页面展示添加按钮--%>
	<c:if test="${USER_SESSION.identity =='管理员'}">
        <div class="pull-right">
            <div class="form-group form-inline">
                <div class="btn-group">
                    <button type="button" class="btn btn-default" data-toggle="modal"
                            data-target="#userModal" onclick="addUser()"> 添加
                    </button>
                </div>
            </div>
        </div>
     </c:if>>
	 <!--工具栏 数据搜索 -->
    <div class="box-tools pull-right">
        <div class="has-feedback">
            <form action="${pageContext.request.contextPath}/user/query" method="post">
                账号：<input name="number" value="${user.number}">
                姓名：<input name="name" value="${uesr.name}">
                身份：<input name="identity" value="${user.identity}">
                <input class="btn btn-default" type="submit" value="查询">
            </form>
        </div>
    </div>
    <!--工具栏 数据搜索 /-->
    <!-- 数据表格 -->
    <table id="dataList" class="table table-bordered table-striped table-hover dataTable text-center">
        <thead>
        <tr>
            <th class="sorting_asc">账号</th>
            <th class="sorting">姓名</th>
            <th class="sorting">密码</th>
            <th class="sorting">身份</th>
            <th class="sorting">邮箱</th>
            <th class="text-center">操作</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${users}" var="user">
            <tr>
                <td>${user.number}</td>
                <td>${user.name}</td>
                <td>${user.password}</td>
                <td>${user.identity}</td>
                <td>${user.email}</td>
                <td class="text-center">
                	<!--如果身份为“管理员”，删除按钮有效，否则无效-->
                    <c:if test="${USER_SESSION.identity=='管理员'}">
                        <button type="button" class="btn bg-olive btn-xs" disabled="true">更新</button>
                        <button type="button" class="btn bg-olive btn-xs" onclick="deleteUser('${user.number}','${user.name}')">删除</button>
                    </c:if>
                    <c:if test="${USER_SESSION.identity=='学生' || USER_SESSION.identity=='教师'}">
                        <button type="button" class="btn bg-olive btn-xs" data-toggle="modal" data-target="#userModal" onclick="updateUser('${user.number}')">更新</button>
                        <button type="button" class="btn bg-olive btn-xs" disabled="true">删除</button>
                    </c:if>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <!-- 数据表格 /-->
</div>
<!-- 数据展示内容区/ -->
<jsp:include page="/views/userModal.jsp"></jsp:include>
<script type="text/javascript">
  function updateUser(number) {
    var url = "${pageContext.request.contextPath}/user/queryUserByNum?number=" + number;
    $.get(url, function(data) {
      $("#mark").val("更新");
      $("#number").val(data.number);
      $("#name").val(data.name);
      $("#password").val(data.password);
      $("#identity").val(data.identity);
      $("#email").val(data.email);
     })
  }
  function addUser() {
    $("#mark").val("添加");
    $("#number").val("");
    $("#name").val("");
    $("#epress").val("");
    $("#password").val("");
    $("#identity").val("");
    $("#email").val("");
  }
  function deleteUser(number, name) {
    var result = confirm("确定删除“" + name + "”用户?");
    if (result) {
      var url ="${pageContext.request.contextPath}/user/delete?number=" + number;
      $.get(url, function(status) {
        if (status == true) {
          window.location.href = "${pageContext.request.contextPath}/user/query";
        }
    })
  }
}
</script>

</body>
</html>