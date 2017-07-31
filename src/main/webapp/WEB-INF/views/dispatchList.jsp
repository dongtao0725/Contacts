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
    </style>
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
    <c:if test="${dispatchPrinciple!=null}">
        <div class="jumbotron">
            <h4>派单原则</h4>
            <p>
                <pre>${dispatchPrinciple.principle}</pre>
            </p>
        </div>
    </c:if>
    <table class="table contentlist table-hover">
        <thead>
        <tr>
            <th class="header" style="width: 5%">公司</th>
            <th class="header" style="width: 10%">区域</th>
            <th class="header" style="width:10%;">部门</th>
            <th class="header" style="width: 15%">路径</th>
            <th class="header" style="width: 25%">维护职责</th>
            <th class="header" style="width: 20%">省核心设备维护职责</th>
            <th class="header"style="width: 10%">备注</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="dispatchRule" items="${dispatchRuleList}" varStatus="status">
            <tr>
                <td>${dispatchRule.dept.dept_name}</td>
                <td>${dispatchRule.area}</td>
                <td>${dispatchRule.department}</td>
                <td>${dispatchRule.path}</td>
                <td><pre>${dispatchRule.responsibility}</pre></td>
                <td><pre>${dispatchRule.core_responsibility}</pre></td>
                <td><pre>${dispatchRule.remark}</pre></td>
        </tr>
    </c:forEach>

    </tbody>
</table>
</div>
</body>
</html>
