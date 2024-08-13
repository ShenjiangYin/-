<%@ page language="java" contentType="text/html; charset=UTF-8" 
pageEncoding="UTF-8" %>
<html>
<head>
  <meta charset="UTF-8">
  <title>学校图书管理系统</title>
  <link href="${pageContext.request.contextPath}/css/webbase.css" 
  rel="stylesheet" type="text/css"/>
  <link href="${pageContext.request.contextPath}/css/login-manage.css" 
  rel="stylesheet" type="text/css"/>
  <script src="${pageContext.request.contextPath}/js/jquery.min.js" 
  type="text/javascript"></script>
</head>
<body>
  <div class="loginmanage">
    <div class="py-container">
      <h4 class="manage-title">学校图书管理系统</h4>
      <div class="loginform">
        <ul class="sui-nav nav-tabs tab-wraped">
          <li class="active"><h3>账户登录</h3></li>
        </ul>
        <div class="tab-content tab-wraped">
          <%--错误提示信息--%>
          <span style="color: red">${msg}</span>
          <div id="profile" class="tab-pane  active">
            <form action="${pageContext.request.contextPath}/loginCheck" 
            id="loginform" class="sui-form" method="post">
              <div class="input-prepend">
                <span class="add-on loginname">账号</span>
                <input type="text" placeholder="学号/工号" 
                class="span2 input-xfat" name="number">
              </div>
              <div class="input-prepend">
                <span class="add-on loginpwd">密码</span>
                <input type="password" placeholder="请输入密码" 
                class="span2 input-xfat" name="password">
              </div>
              <div class="input-prepend">
                <span class="add-on loginrole">身份</span>
                <input type="text" placeholder="学生/教师/管理员" 
                class="span2 input-xfat" name="identity">
              </div>
              <div class="logined">
                <input type="submit" value="登录" 
                class="sui-btn btn-block btn-xlarge btn-danger">
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
</body>
</html>