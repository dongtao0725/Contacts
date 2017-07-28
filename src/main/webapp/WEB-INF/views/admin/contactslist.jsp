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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/frame-content.css">
    <script src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js" ></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <script>
        $(function () {
            $(".btn-add").click(function () {
                $("#myModalLabel").html("添加用户");
                $(".modal-btn-add").html("Add");
                $("#department").val(null);
                $("#position").val(null);
                $("#name").val(null);
                $("#c_phone").val(null);
                $("#o_phone").val(null);
                $("#network").val(null);
                $("#enterprise").val(null);
                $("#c_id").val(null);
                $(".form-group").removeClass("has-warning");
                $('#myModal').modal({backdrop:false});
                $('#myModal').modal('show');
            });

            $(".modal-btn-add").click(function () {
                var id=$("#id").val();
                var name=$("#name").val();

                if (name == null || name == "") {
                    $("#name").parent(".form-group").addClass("has-warning");
                    $("#name").addClass("form-control-warning");
                    //alert("username can't be empty\uff01");
                    return false;
                }
                $("#modal-form").submit();
            });

            $(".nav-link").click(function () {
                $(".nav-link").removeClass("active");
                $(this).addClass("active");
            });

            $(".btn-modify").click(function () {
                var $contactroot = $(this).parentsUntil("tr");
                $("#myModalLabel").html("修改联系人信息");
                $(".modal-btn-add").html("Update");
                $(".form-group").removeClass("has-warning");
                $("#department").val($contactroot.siblings(".department").html());
                $("#position").val($contactroot.siblings(".position").html());
                $("#name").val($contactroot.siblings(".name").html());
                $("#c_phone").val($contactroot.siblings(".c_phone").html());
                $("#o_phone").val($contactroot.siblings(".o_phone").html());
                $("#network").val($contactroot.siblings(".network").html());
                $("#enterprise").val($contactroot.siblings(".enterprise").html());
                $("#c_id").val($contactroot.siblings(".c_id").html());
                $('#myModal').modal({backdrop:false});
                $('#myModal').modal('show');
            });

            $(".btn-del").click(function () {
                var $contactroot = $(this).parentsUntil("tr");
                var $url="${pageContext.request.contextPath}/contact/deleteContact?c_id="+$contactroot.siblings(".c_id").html();
                $('#url').val($url);//给会话中的隐藏属性URL赋值
                $('#delcfmModel').modal({backdrop:false});
                $('#delcfmModel').modal("show");
            });


        });

        function urlSubmit(){
            var url=$.trim($("#url").val());//获取会话中的隐藏属性URL
            window.location.href=url;
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
    <div style="width:1%;display: table-cell;">
        <button type="button" class="btn btn-primary btn-add" >
            <i class="fa fa-plus-circle" aria-hidden="true"></i>
        </button>
    </div>
</div>
<div class="content">
    <c:if test="${secondaryDeptList!=null && fun:length(secondaryDeptList) > 0}">
        <ul class="nav nav-tabs" style="margin-bottom: 15px;">
            <c:forEach var="secondaryDept" items="#{secondaryDeptList}" varStatus="i">
                <li class="nav-item">
                    <c:choose>
                        <c:when test="${secondaryDept.dept_name==realCompany.dept_name}">
                            <a href="#" class="nav-link active">${secondaryDept.dept_name}</a>
                        </c:when>
                        <c:otherwise>
                            <a href="${pageContext.request.contextPath}/contact/dept_id?dept_id=${company.dept_id}&secondaryDept_id=${secondaryDept.dept_id}" class="nav-link">${secondaryDept.dept_name}</a>
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
            <th class="header" style="min-width: 180px">网络备注</th>
            <th class="header" style="min-width: 180px">政企备注</th>
            <th class="header" style="width: 80px">操作</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="contact" items="${contactsList}" varStatus="status">
                <tr>
                    <td class="dept_name">${contact.dept.dept_name}</td>
                    <td class="department">${contact.department}</td>
                    <td class="position">${contact.position}</td>
                    <td class="name">${contact.name}</td>
                    <td class="c_phone">${contact.c_phone}</td>
                    <td class="o_phone">${contact.o_phone}</td>
                    <td class="network">${contact.network}</td>
                    <td class="enterprise">${contact.enterprise}</td>
                    <td hidden class="dept_id">${contact.dept.dept_id}</td>
                    <td hidden class="c_id">${contact.c_id}</td>
                    <td>
                        <div class="btn-group" role="group">
                            <button type="submit" class="btn btn-primary btn-sm btn-operator btn-modify"><i class="fa fa-pencil"></i></button>
                            <button type="button" class="btn btn-primary btn-sm btn-operator btn-del"><i class="fa fa-close "></i></button>
                        </div>
                    </td>
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
            <form action="/contact/saveContact" id="modal-form">
                <fieldset class="form-group">
                    <label for="dept_name">公司</label>
                    <input name="dept.dept_name" class="form-control" id="dept_name" value="${realCompany.dept_name}" disabled>
                </fieldset>
                <fieldset class="form-group">
                    <label for="department">部门</label>
                    <input name="department" class="form-control" id="department">
                </fieldset>
                <fieldset class="form-group">
                    <label for="position">职位</label>
                    <input name="position" class="form-control" id="position">
                </fieldset>
                <fieldset class="form-group">
                    <label for="name">姓名</label>
                    <input name="name" class="form-control" id="name">
                </fieldset>
                <fieldset class="form-group">
                    <label for="c_phone">C网电话</label>
                    <input name="c_phone" class="form-control" id="c_phone">
                </fieldset>
                <fieldset class="form-group">
                    <label for="o_phone">其他电话</label>
                    <input name="o_phone" class="form-control" id="o_phone">
                </fieldset>
                <fieldset class="form-group">
                    <label for="network">网络备注</label>
                    <input name="network" class="form-control" id="network">
                </fieldset>
                <fieldset class="form-group">
                    <label for="enterprise">政企备注</label>
                    <input name="enterprise" class="form-control" id="enterprise">
                </fieldset>
                <input type="hidden" name="dept.dept_id" id="dept_id" value="${realCompany.dept_id}"/>
                <input type="hidden" name="c_id" id="c_id"/>
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
