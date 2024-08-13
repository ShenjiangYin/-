<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 图书借阅信息的模态窗口，默认是隐藏的 -->
<div class="modal fade" id="userModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h3 id="myModalLabel">用户信息</h3>
            </div>
            <div class="modal-body">
                <form id="manageUser">
                    <table class="table table-bordered table-striped" width="800px">
                    	<%--窗口标识，不在页面展示--%>
                        <span><input type="hidden" name="mark" id="mark"></span>
                        <c:if test="${USER_SESSION.identity =='管理员'}">
                        <tr>
                            <td>账号</td>
                            <td><input class="form-control" name="number" id="number"></td>
                            <td>姓名</td>
                            <td><input class="form-control" name="name" id="name"></td>
                        </tr>
                        <tr>
                            <td>密码</td>
                            <td><input class="form-control" name="password" id="password"></td>
                            <td>身份</td>
                            <td><input class="form-control" name="identity" id="identity"></td>
                        </tr>
                        <tr>
                            <td>邮箱</td>
                            <td><input class="form-control" name="email" id="email"></td>
                        </tr>
						</c:if>
						<c:if test="${USER_SESSION.identity =='学生' || USER_SESSION.identity =='教师'}">
                        <tr>
                            <td>账号</td>
                            <td><input class="form-control" readonly name="number" id="number"></td>
                            <td>姓名</td>
                            <td><input class="form-control" readonly name="name" id="name"></td>
                        </tr>
                        <tr>
                            <td>密码</td>
                            <td><input class="form-control" name="password" id="password"></td>
                            <td>身份</td>
                            <td><input class="form-control" readonly name="identity" id="identity"></td>
                        </tr>
                        <tr>
                            <td>邮箱</td>
                            <td><input class="form-control" name="email" id="email"></td>
                        </tr>
						</c:if>
                    </table>
                </form>
            </div>
            <div class="modal-footer">
                <%--点击保存按钮时，隐藏模态窗口并调用js文件中的borrow()方法--%>
                <button class="btn btn-success" data-dismiss="modal" aria-hidden="true" onclick="manage()">确定
                </button>
                <button class="btn btn-default" data-dismiss="modal" aria-hidden="true">取消</button>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
function manage() {
  var mark = $("#mark").val();
  if (mark=="添加") {
    var url ="${pageContext.request.contextPath}/user/add";
    $.post(url, $("#manageUser").serialize(), function(status) {
      if (status == true) {
        window.location.href = "${pageContext.request.contextPath}/user/query";
      }
      else {
        alert("用户已经存在或添加失败！");
      }
    })
  }
  else if (mark=="更新") {
    var url ="${pageContext.request.contextPath}/user/update";
    $.post(url, $("#manageUser").serialize(), function(status) {
      if (status == true) {
        window.location.href = "${pageContext.request.contextPath}/user/query";
      }
    })
  }
}
</script>

