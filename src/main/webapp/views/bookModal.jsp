<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!-- 图书信息的模态窗口，默认是隐藏的 -->
<div class="modal fade" id="bookModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h3 id="myModalLabel">图书信息</h3>
            </div>
            <div class="modal-body">
                <form id="manageBook">
                    <table class="table table-bordered table-striped" width="800px">
                    	<%--窗口标识，不在页面展示--%>
                    	<td><input type="hidden" name="mark" id="mark"></td>
                        <tr>
                            <td>图书名称</td>
                            <td><input class="form-control" name="name" id="name"></td>
                            <td>作者</td>
                            <td><input class="form-control" name="author" id="author"></td>
                        </tr>
                        <tr>
                            <td>出版社</td>
                            <td><input class="form-control" name="press" id="press"></td>
                            <td>ISBN</td>
                            <td><input class="form-control" name="isbn" id="isbn"></td>
                        </tr>
                        <tr>
                            <td>出版时间</td>
                            <td><input class="form-control" name="publishTime" id="publishTime"></td>
                            <td>定价<br/></td>
                            <td><input class="form-control" name="price" id="price">
                            </td>
                        </tr>
                        <tr>
                        	<td>库存<br/></td>
                            <td><input class="form-control" name="storage" id="storage">
                            </td>
                        </tr>
                    </table>
                </form>
            </div>
            <div class="modal-footer">
                <%--隐藏模态窗口并调用js方法--%>
                <button class="btn btn-success" data-dismiss="modal" aria-hidden="true" onclick="manage()">确定
                </button>
                <button class="btn btn-default" data-dismiss="modal" aria-hidden="true">取消</button>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
//定义js方法manage()
function manage() {
	var mark = $("#mark").val();
	if (mark=="借阅") {
		var url ="${pageContext.request.contextPath}/book/borrow";
		$.post(url, $("#manageBook").serialize(), function(status) {
			if (status == true) {
				window.location.href = "${pageContext.request.contextPath}/book/query";
			}
		})
	}
	else if (mark=="添加") {	
	    var url ="${pageContext.request.contextPath}/book/add";
	    $.post(url, $("#manageBook").serialize(), function(status) {
	        if (status == true) {
	            window.location.href = "${pageContext.request.contextPath}/book/manage";
	        }
	        else {
	        	alert("图书已经存在或添加失败！");
	        }
	    })
	}
	else if (mark=="更新") {
    var url ="${pageContext.request.contextPath}/book/update";
    $.post(url, $("#manageBook").serialize(), function(status) {
        if (status == true) {
            window.location.href = "${pageContext.request.contextPath}/book/manage";
        }
    })
	}
	
}
</script>
