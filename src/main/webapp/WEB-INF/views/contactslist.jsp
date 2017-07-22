<%--
  Created by IntelliJ IDEA.
  User: dongt
  Date: 2017/7/14
  Time: 19:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fun" uri="http://java.sun.com/jsp/jstl/functions" %>
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
                $("#myModalLabel").html("添加用户");
                $(".modal-btn-add").html("Add User");
                $("#username").val(null);
                $("#password").attr("placeholder","Enter Password");
                $(" #id").removeAttr("value");
                $("#role_id").val(0);
                $(".form-group").removeClass("has-warning");
                $('#myModal').modal({backdrop:false});
                $('#myModal').modal('show');
            })
            $(".modal-btn-add").click(function () {
                id=$("#id").val();
                username=$("#username").val();
                password=$("#password").val();
                role_id=$("#role_id").val();
                if (username == null || username == "") {
                    $("#username").parent(".form-group").addClass("has-warning");
                    $("#username").addClass("form-control-warning");
                    //alert("username can't be empty\uff01");
                    return false;
                }
                if (id==null || id==""){
                    if (password == null || password == "") {
                        $("#password").parent(".form-group").addClass("has-warning");
                        $("#password").addClass("form-control-warning");
                        //alert("password can't be empty\uff01");
                        return false;
                    }
                }
                if(role_id==0){
                    $("#role_id").parent(".form-group").addClass("has-warning");
                    $("#role_id").addClass("form-control-warning");
                    return false;
                }
                $("#modal-form").submit();
            })
            $(".nav-link").click(function () {
                $(".nav-link").removeClass("active");
                $(this).addClass("active");
            });
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
        <h2 class="brx">通讯录</h2>
    </div>
    <div class="dept_list">
        <div class="dropdown open">
            <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <i class="fa fa-paper-plane" aria-hidden="true" style="margin-right: 10px;"></i>${company.dept_name}
            </button>
            <div class="dropdown-menu" aria-labelledby="dropdownMenu1" style="">
                <c:forEach var="dept" items="${deptList}"  varStatus="status">
                    <a class="dropdown-item" style="float: left" href="${pageContext.request.contextPath}/contact/dept_id?dept_id=${dept.dept_id}">${dept.dept_name}</a>
                    <c:if test="${status.count/5==0}">
                        <div class="clearfix"></div>
                    </c:if>
                </c:forEach>
            </div>
        </div>
    </div>
    <div class="clearfix"></div>
</div>
<div class="tools">
    <div style="width: 99%;display: table-cell;">
        <form class="search" style="display: inline-block;margin-bottom: 0px;" action="${pageContext.request.contextPath}/contact/search">
            <input class="form-control" type="text" name="name" placeholder="Search Name...">
            <button type="submit" class="po">
                <i class="fa fa-search" aria-hidden="true"></i>
            </button>
        </form>
    </div>
    <%--<div style="width:1%;display: table-cell;">
        <button type="button" class="btn btn-primary btn-add" >
            <i class="fa fa-plus-circle" aria-hidden="true"></i>
        </button>
    </div>--%>
</div>
<div class="content">
    <c:if test="${secondaryDeptList!=null && fun:length(secondaryDeptList) > 0}">
    <ul class="nav nav-tabs" style="margin-bottom: 15px;">
        <c:forEach var="secondaryDept" items="#{secondaryDeptList}" varStatus="i">
        <li class="nav-item">
            <c:choose>
                <c:when test="${secondaryDept.dept_id==param.secondaryDept_id}">
                    <a href="#" class="nav-link active">${secondaryDept.dept_name}</a>
                </c:when>
                <c:when test="${param.secondaryDept_id==null && i.count==1}">
                    <a href="#" class="nav-link active">${secondaryDept.dept_name}</a>
                </c:when>
                <c:otherwise>
                    <a href="/contact/dept_id?dept_id=${company.dept_id}&secondaryDept_id=${secondaryDept.dept_id}" class="nav-link">${secondaryDept.dept_name}</a>
                </c:otherwise>
            </c:choose>
        </li>
        </c:forEach>
    </ul>
    </c:if>
    <table class="table contentlist table-hover">
        <thead>
        <tr>
            <th class="header" style="min-width: 65px">公司</th>
            <th class="header" style="min-width: 150px">部门</th>
            <th class="header" style="min-width: 170px">职位</th>
            <th class="header" style="min-width: 80px">姓名</th>
            <th class="header" style="width: 110px">C网电话</th>
            <th class="header" style="width: 110px">其他电话</th>
            <th class="header"style="min-width: 180px">网络备注</th>
            <th class="header" style="min-width: 180px">政企备注</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="contact" items="${contactsList}" varStatus="status">
            <tr>
                <td>${contact.dept.dept_name}</td>
                <td>${contact.department}</td>
                <td>${contact.position}</td>
                <td>${contact.name}</td>
                <td>${contact.c_phone}</td>
                <td>${contact.o_phone}</td>
                <td>${contact.network}</td>
                <td>${contact.enterprise}</td>
            <%--<td><div class="btn-group" role="group">
                <a onClick="update('${user.id}','${user.username}','${user.role.role_id}')"><button type="button" class="btn btn-primary btn-sm btn-operator"><i class="fa fa-pencil"></i></button></a>
                <a onClick="delcfm('${pageContext.request.contextPath}/user/deleteuser?id=${user.id}')"><button type="button" class="btn btn-primary btn-sm btn-operator"><i class="fa fa-close "></i></button></a>
            </div></td>--%>
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
