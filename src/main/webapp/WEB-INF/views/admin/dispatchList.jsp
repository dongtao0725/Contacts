<%--
  Created by IntelliJ IDEA.
  User: dongt
  Date: 2017/7/14
  Time: 19:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8"%>
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
    <script src="${pageContext.request.contextPath}/js/autoTextarea.js"></script>
    <style>
        pre{
            font-family: "Roboto", "Helvetica Neue", Helvetica, Arial, sans-serif;
            font-size: 0.9rem;
            font-weight: 300;
            line-height: 1.5;
            color: #cfd2da;
            white-space: pre-wrap;
            word-wrap: break-word;
        }
        .jumbotron{
            padding: 2rem 1rem;
            background-color:#434857;
        }
        textarea{
            margin-bottom: 0.5rem;
        }
    </style>
    <script>
        $(function () {
            $(".btn-add").click(function () {
                $("#myModalLabel").html("添加用户");
                $(".modal-btn-add").html("Add");
                $("#area").val(null);
                $("#department").val(null);
                $("#path").val(null);
                $("#responsibility").val(null);
                $("#core_responsibility").val(null);
                $("#remark").val(null);
                $("#r_id").val(null);
                $(".form-group").removeClass("has-warning");
                $('#myModal').modal({backdrop:false});
                $('#myModal').modal('show');
            });

            $(".modal-btn-add").click(function () {
                var id=$("#id").val();
                var path=$("#path").val();

                if (path == null || path == "") {
                    $("#path").parent(".form-group").addClass("has-warning");
                    $("#path").addClass("form-control-warning");
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
                $("body,html",parent.document).animate({scrollTop:0},500);
                $("#myModalLabel").html("修改联系人信息");
                $(".modal-btn-add").html("Update");
                $(".form-group").removeClass("has-warning");
                $("#department").val($contactroot.siblings(".department").html());
                $("#area").val($contactroot.siblings(".area").html());
                $("#path").val($contactroot.siblings(".path").html());
                $("#responsibility").val($contactroot.siblings(".responsibility").children("pre").html());
                $("#core_responsibility").val($contactroot.siblings(".core_responsibility").children("pre").html());
                $("#remark").val($contactroot.siblings(".remark").children("pre").html());
                $("#r_id").val($contactroot.siblings(".r_id").html());
                $('#myModal').modal({backdrop:false});
                $('#myModal').modal('show');
                autoTextarea($("#responsibility"));
                autoTextarea($("#core_responsibility"));
                autoTextarea($("#remark"));
            });

            $(".btn-del").click(function () {
                $("body,html",parent.document).animate({scrollTop:0},500);
                var $contactroot = $(this).parentsUntil("tr");
                var $url="${pageContext.request.contextPath}/dispatch/deleteDispatchRule?r_id="+$contactroot.siblings(".r_id").html();
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
        <h2 class="brx">派单规则</h2>
    </div>
    <div class="dept_list">
        <div class="dropdown open">
            <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <i class="fa fa-paper-plane" aria-hidden="true" style="margin-right: 10px;"></i>${company.dept_name}
            </button>
            <div class="dropdown-menu" aria-labelledby="dropdownMenu1" style="">
                <c:forEach var="dept" items="${deptList}"  varStatus="status">
                    <a class="dropdown-item" style="float: left" href="${pageContext.request.contextPath}/dispatch/list?dept_id=${dept.dept_id}">${dept.dept_name}</a>
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
        <form class="search" style="display: inline-block;margin-bottom: 0px;" action="${pageContext.request.contextPath}/dispatch/search">
            <input class="form-control" name="param" placeholder="Search Place...">
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
                    <a href="${pageContext.request.contextPath}/dispatch/list?dept_id=${company.dept_id}&secondaryDept_id=${secondaryDept.dept_id}" class="nav-link">${secondaryDept.dept_name}</a>
                </c:otherwise>
            </c:choose>
        </li>
        </c:forEach>
    </ul>
    </c:if>
        <div class="jumbotron">
            <h4>派单原则</h4>
            <p>
            <form action="${pageContext.request.contextPath}/dispatch/saveDispatchPrinciple">
                <textarea class="form-control" id="principle" name="principle">${dispatchPrinciple.principle}</textarea>
                <input type="hidden" name="p_id" value="${dispatchPrinciple.p_id}">
                <input type="hidden" name="dept.dept_id" value="${realCompany.dept_id}">
                <button class="btn btn-primary btn-sm btn-operator" STYLE="float: right;"><i class="fa fa-pencil"></i>更新</button>
            </form>
            </p>
        </div>
    <table class="table contentlist table-hover">
        <thead>
        <tr>
            <th class="header" style="width: 10%">区域</th>
            <th class="header" style="width:10%;">部门</th>
            <th class="header" style="width: 15%">路径</th>
            <th class="header" style="width: 25%">维护职责</th>
            <th class="header" style="width: 25%">省核心设备维护职责</th>
            <th class="header"style="width: 10%">备注</th>
            <th class="header"style="width: 5%">操作</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="dispatchRule" items="${dispatchRuleList}" varStatus="status">
            <tr>
                <td class="area">${dispatchRule.area}</td>
                <td class="department">${dispatchRule.department}</td>
                <td class="path">${dispatchRule.path}</td>
                <td class="responsibility"><pre>${dispatchRule.responsibility}</pre></td>
                <td class="core_responsibility"><pre>${dispatchRule.core_responsibility}</pre></td>
                <td class="remark"><pre>${dispatchRule.remark}</pre></td>
                <td hidden class="dept_id">${dispatchRule.dept.dept_id}</td>
                <td hidden class="r_id">${dispatchRule.r_id}</td>
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
                <form action="${pageContext.request.contextPath}/dispatch/saveDispatchRule" id="modal-form">
                    <fieldset class="form-group">
                        <label for="dept_name">公司</label>
                        <input name="dept.dept_name" class="form-control" id="dept_name" value="${realCompany.dept_name}" disabled>
                    </fieldset>
                    <fieldset class="form-group">
                        <label for="area">区域</label>
                        <input name="area" class="form-control" id="area">
                    </fieldset>
                    <fieldset class="form-group">
                        <label for="department">部门</label>
                        <input name="department" class="form-control" id="department">
                    </fieldset>
                    <fieldset class="form-group">
                        <label for="path">路径</label>
                        <input name="path" class="form-control" id="path">
                    </fieldset>
                    <fieldset class="form-group">
                        <label for="responsibility">维护职责</label>
                        <textarea name="responsibility" class="form-control" id="responsibility"></textarea>
                    </fieldset>
                    <fieldset class="form-group">
                        <label for="core_responsibility">省核心设备维护职责</label>
                        <textarea name="core_responsibility" class="form-control" id="core_responsibility"></textarea>
                    </fieldset>
                    <fieldset class="form-group">
                        <label for="remark">备注</label>
                        <textarea name="remark" class="form-control" id="remark"></textarea>
                    </fieldset>
                    <input type="hidden" name="dept.dept_id" id="dept_id" value="${realCompany.dept_id}"/>
                    <input type="hidden" name="r_id" id="r_id"/>
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

<script>
    autoTextarea(document.getElementById("principle"));
</script>
</body>
</html>
