<%@ page import="com.dongt.domain.Department" %><%--
  Created by IntelliJ IDEA.
  User: dongt
  Date: 2017/7/14
  Time: 19:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <!--[if IE]><meta http-equiv='X-UA-Compatible' content='IE=edge,chrome=1' /><![endif]-->
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>省NOC信息管理平台</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css" integrity="sha384-rwoIResjU2yc3z8GV/NPeZWAv56rSmLldC3R/AZzGRnGxQQKnKkoFVhFQhNUwEyJ" crossorigin="anonymous">
    <link rel="stylesheet" href="font-awesome/css/font-awesome.min.css">
    <link href="//netdna.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/frame-content.css">
    <script src="js/jquery-3.2.1.min.js" ></script>
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.1.1.slim.min.js" integrity="sha384-A7FZj7v+d/sdmMqp/nOQwliLvUsJfDHW+k9Omg/a/EheAdgtzNs3hpfag6Ed950n" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js" integrity="sha384-DztdAPBWPRXSA/3eYEEUWrWCy7G5KFbe8fFjk5JAIxUYHKkDx6Qin1DkWx51bBrb" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/js/bootstrap.min.js" integrity="sha384-vBWWzlZJ8ea9aCX4pEW3rVHjgjt7zpkNpZk+02D9phzyeVkE+jo0ieGizqPLForn" crossorigin="anonymous"></script>
    <script>
        $(function () {
            for(var i=0;i<$("#deptlist").children("li").length;i++){
                if($("#deptlist").children("li").eq(i).attr("rel")==$("#deptlist").children("li").eq(i+1).children("span").attr("rel")){
                    $("#deptlist").children("li").eq(i).after("<ul>");
                    //alert($("#deptlist").children("li").eq(i).attr("rel"));
                }
                if($("#deptlist").children("li").eq(i).attr("rel")==$("#deptlist").children("li").eq(i+1).children("span").attr("rel")){
                    $("#deptlist").children("li").eq(i).after("<ul>");
                    //alert($("#deptlist").children("li").eq(i).attr("rel"));
                }
            }

        })

        function delcfm(url) {
            $('#url').val(url);//给会话中的隐藏属性URL赋值
            $('#delcfmModel').modal({backdrop:false});
            $('#delcfmModel').modal("show");
        }

        function urlSubmit(){
            var url=$.trim($("#url").val());//获取会话中的隐藏属性URL
            window.location.href=url;
        }

        function update(userid,username,roleid) {
            $("#myModalLabel").html("修改用户信息");
            $(".modal-btn-add").html("Update User");
            $("#username").val(username);
            $("#password").attr("placeholder","若无需修改密码，请留空");
            $("#role_id").val(roleid);
            $("#id").val(userid);
            $(".form-group").removeClass("has-warning");
            $('#myModal').modal({backdrop:false});
            $('#myModal').modal('show');
        }
    </script>
</head>
<body>
<div class="header">
    <div class="title">
        <h6 class="litle_title">Management</h6>
        <h2 class="brx">用户管理</h2>
    </div>
    <div class="clearfix"></div>
</div>
<div class="tools">
    <div style="width: 99%;display: table-cell;">
        <form class="search" style="display: inline-block;margin-bottom: 0px;" action="${pageContext.request.contextPath}/user/userlist">
            <input class="form-control" type="text" name="username" placeholder="Username Search...">
            <button type="submit" class="po">
                <i class="fa fa-search" aria-hidden="true"></i>
            </button>
        </form>
    </div>
    <div style="width:1%;display: table-cell;">
        <button type="button" class="btn btn-primary btn-add" >
            <i class="fa fa-plus-circle" aria-hidden="true"></i>
        </button>
    </div>
</div>
<div class="content">
    <ul id="deptlist">
        <c:forEach var="department" items="${AllDepartmentList}" varStatus="status">
                    <li rel="${department.dept_id}" class="">${department.dept_name}<span rel="${department.parent_id}" class=" "></span></li>
        </c:forEach>
    </ul>
</div>

<div class="modal fade" id="myModal" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="myModalLabel">添加用户</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                    <span class="sr-only">Close</span>
                </button>
            </div>
            <div class="modal-body" >
                <form action="/user/saveuser" id="modal-form">
                    <fieldset class="form-group">
                        <label for="username">用户名</label>
                        <input type="text" name="username" class="form-control" id="username" placeholder="Enter Username">
                    </fieldset>
                    <fieldset class="form-group">
                        <label for="password">密码</label>
                        <input type="password" name="password" class="form-control" id="password" placeholder="Enter Password">
                    </fieldset>
                    <fieldset class="form-group">
                        <label for="role_id">管理组</label>
                        <select class="form-control" name="role.role_id" id="role_id">
                                <option value="0">请选择</option>
                            <c:forEach var="m_Role" items="${m_Rolelist}" >
                                <option value="${m_Role.role_id}">${m_Role.role_name}(${m_Role.description})</option>
                            </c:forEach>
                        </select>
                    </fieldset>
                    <input type="hidden" name="id" id="id"/>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary modal-btn-add" >Add User</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<div class="modal fade" id="delcfmModel">
    <div class="modal-dialog">
        <div class="modal-content message_align">
            <div class="modal-header">
                <h4 class="modal-title">您确认要删除吗？</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
            </div>
            <div class="modal-body">
                <p style="color: red;font-weight: bolder">您确认要删除吗？</p>
            </div>
            <div class="modal-footer">
                <input type="hidden" id="url"/>
                <button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button>
                <a  onclick="urlSubmit()" class="btn btn-danger" data-dismiss="modal">确定</a>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
</body>
</html>
