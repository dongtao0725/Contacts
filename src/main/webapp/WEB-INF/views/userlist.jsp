<%--
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
            $(".btn-add").click(function () {
                $('#myModal').modal({backdrop:false});
                $('#myModal').modal('show');
            })
            $(".modal-btn-add").click(function () {
                username=$("#username").val();
                password=$("#password").val();
                if (username == null || username == "") {
                    $("#username").parent(".form-group").addClass("has-warning");
                    $("#username").addClass("form-control-warning");
                    //alert("username can't be empty\uff01");
                    return false;
                }
                if (password == null || password == "") {
                    $("#password").parent(".form-group").addClass("has-warning");
                    $("#password").addClass("form-control-warning");
                    //alert("password can't be empty\uff01");
                    return false;
                }
                $("#modal-form").submit();
            })
        })
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
        <form class="search" style="display: inline-block;margin-bottom: 0px;">
            <input class="form-control" type="text" placeholder="Search...">
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
    <table class="table contentlist table-hover">
        <thead>
        <tr>
            <th class="header">用户ID</th>
            <th class="header">用户名</th>
            <th class="header">管理组</th>
            <th class="header">操作</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="user" items="${userlist}">
            <tr>
                <td>${user.id}</td>
                <td>${user.username}</td>
                <td>${user.role.role_name}</td>
                <td><div class="btn-group" role="group" aria-label="Basic example">
                    <button type="button" class="btn btn-primary btn-sm btn-operator"><i class="fa fa-pencil"></i></button>
                    <button type="button" class="btn btn-primary btn-sm btn-operator"><i class="fa fa-close "></i></button>
                </div></td>
            </tr>
        </c:forEach>

        </tbody>
    </table>
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
                <form action="/user/adduser" id="modal-form">
                    <fieldset class="form-group">
                        <label for="username">用户名</label>
                        <input type="text" name="username" class="form-control" id="username" placeholder="Enter username">
                    </fieldset>
                    <fieldset class="form-group">
                        <label for="password">密码</label>
                        <input type="password" name="password" class="form-control" id="password" placeholder="Password">
                    </fieldset>
                    <fieldset class="form-group">
                        <label for="Select1">管理组</label>
                        <select class="form-control" name="role.role_id" id="Select1">
                            <option value="1">SuperAdmin</option>
                            <option value="2">NormlAdmin</option>
                        </select>
                    </fieldset>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary modal-btn-add" >Add User</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
</body>
</html>
