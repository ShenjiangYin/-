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
    	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/all-skins.min.css">
    	<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
		<script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
 		<script type="text/javascript">
        	function SetIFrameHeight() {
            	var iframeid = document.getElementById("iframe");
            	if (document.getElementById) {
               		/*设置内容展示区的高度等于页面可视区的高度*/
                	iframeid.height = document.documentElement.clientHeight;
            	}
			}
    	</script>
	</head>
    <body class="hold-transition skin-green sidebar-mini">
	  <div class="wrapper">
        <!-- 页面头部 -->
        <header class="main-header">
          <a href="${pageContext.request.contextPath}/main" class="logo">
            <span class="logo-lg"><b>学校图书管理系统</b></span>
          </a>
          <nav class="navbar navbar-static-top">
            <div class="navbar-custom-menu">
              <ul class="nav navbar-nav">
                <li class="dropdown user user-menu">
                  <a>
                    <img src="${pageContext.request.contextPath}/img/user.jpg" 
                    class="user-image" alt="User Image">
                    <span class="hidden-xs">${USER_SESSION.name}</span>
                  </a>
                </li>
                <li class="dropdown user user-menu">
                  <a href="${pageContext.request.contextPath}/logout">
                    <span class="hidden-xs">退出登录</span>
                  </a>
                </li>
              </ul>
            </div>
          </nav>
        </header>
        <!-- 页面头部 /-->
        <!-- 导航侧栏 -->
        <aside class="main-sidebar">
          <section class="sidebar">
            <ul class="sidebar-menu">
              <li>
                <a href="${pageContext.request.contextPath}/queryBook" target="iframe">
                  <i class="fa fa-circle-o"></i>图书查询
                </a>
              </li>
              <li>
                <a href="${pageContext.request.contextPath}/manageRecord" target="iframe">
                  <i class="fa fa-circle-o"></i>借阅记录
                </a>
              </li>
              <li>
                <!--如果用户为“管理员”，图书管理链接有效，否则无效-->
                <c:if test="${USER_SESSION.identity=='管理员'}">
                  <a href="${pageContext.request.contextPath}/manageBook" target="iframe">
                  <i class="fa fa-circle-o"></i>图书管理</a>
                </c:if>
                <c:if test="${USER_SESSION.identity=='学生' || USER_SESSION.identity=='教师'}">           
                  <a href="javascript:void(0)" target="iframe"><i class="fa fa-circle-o">
                  </i>图书管理</a>
                </c:if>               
              </li>
              <li>
                  <a href="${pageContext.request.contextPath}/manageUser" target="iframe">
                  <i class="fa fa-circle-o"></i>用户管理</a>              
              </li>
            </ul>
          </section>
        </aside>
        <!-- 导航侧栏 /-->
        <!-- 内容展示区 -->
        <div class="content-wrapper">
          <iframe width="100%" id="iframe" name="iframe" onload="SetIFrameHeight()"></iframe>
        </div>
      </div>
      <!-- 内容展示区/ -->
    </body>
</html>
