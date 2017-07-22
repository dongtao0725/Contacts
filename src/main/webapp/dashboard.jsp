<%--
  Created by IntelliJ IDEA.
  User: dongt
  Date: 2017/7/13
  Time: 23:13
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
    <script src="js/jquery-3.2.1.min.js" ></script>
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.1.1.slim.min.js" integrity="sha384-A7FZj7v+d/sdmMqp/nOQwliLvUsJfDHW+k9Omg/a/EheAdgtzNs3hpfag6Ed950n" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js" integrity="sha384-DztdAPBWPRXSA/3eYEEUWrWCy7G5KFbe8fFjk5JAIxUYHKkDx6Qin1DkWx51bBrb" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/js/bootstrap.min.js" integrity="sha384-vBWWzlZJ8ea9aCX4pEW3rVHjgjt7zpkNpZk+02D9phzyeVkE+jo0ieGizqPLForn" crossorigin="anonymous"></script>
    <style>
        body {
            font-family: "Roboto", "Helvetica Neue", Helvetica, Arial, sans-serif;
            font-size: 0.9rem;
            font-weight: 300;
            line-height: 1.5;
            color: #cfd2da;
            background-color: #252830;
            padding-top: 5px;
        }
        a{ text-decoration: none;}
        a:hover{ text-decoration: none;}
        h1, h2, h3, h4, h5, h6, .a, .b, .c, .d, .e, .f {
            margin-bottom: 0.5rem;
            font-family: inherit;
            font-weight: 300;
            line-height: 1.1;
            color: white;
        }
        .container{
            width: 85%;
        }
        .search{
            position: relative;
            margin-bottom: 30px;
        }
        .search .po {
            position: absolute;
            top: 1px;
            right: 0;
            padding: 9px 10px;
            color: #b7bcc8;
            border: 0;
            line-height: 0;
            background: transparent;
        }
        .search .form-control {
            padding-left: 15px;
            padding-right: 15px;
        }

        .form-control {
            display: block;
            width: 100%;
            padding: 0.5rem 0.75rem;
            font-size: 0.9rem;
            line-height: 1.25;
            color: #fff;
            background-color: #434857;
            background-image: none;
            background-clip: padding-box;
            border: 1px solid rgba(0, 0, 0, 0.15);
            border-radius: 0.25rem;
            -webkit-transition: border-color ease-in-out 0.15s, box-shadow ease-in-out 0.15s;
            transition: border-color ease-in-out 0.15s, box-shadow ease-in-out 0.15s;
        }
        .nav > .ayx {
            padding-left: 15px;
            padding-right: 15px;
            margin-bottom: 5px;
            font-size: 85%;
            font-weight: normal;
            letter-spacing: 1px;
            color: #51586a;
            text-transform: uppercase;
        }
        .xx {
            -webkit-box-orient: vertical !important;
            -webkit-box-direction: normal !important;
            -ms-flex-direction: column !important;
            flex-direction: column !important;
        }
        li {
            display: list-item;
            text-align: -webkit-match-parent;
        }
        .qq .qn {
            border-radius: 0.25rem;
        }
        .nav > li > a {
            color: #cfd2da;
            text-decoration: none;
        }
        .nav > li > a:hover {
            color: #cfd2da;
            font-weight: bold;
        }
        .qn {
            display: block;
            padding: 7px 15px;
        }
        .qq .qn.active, .qq .qp.show .qn {
            color: #252830;
            cursor: default;
            background-color: #1997c6;
        }
        hr{
            margin-top: 1rem !important;
            margin-bottom: 30px;
            border-top: 1px solid #434857;
            width: 100%;
            overflow: visible;
        }
        .btn-login{
            background: transparent;
            color: #0275d8;
            text-align: center;
            float: right;
        }
        table {
            display: table;
            border-collapse: separate;
            border-spacing: 0px;
            border-color: grey;
            width: 100%;
            max-width: 100%;
            margin-bottom: 20px;
        }
        .contentlist thead th {
            vertical-align: bottom;
            border-bottom: 2px solid #434857;
        }
        .contentlist th, .contentlist td {
            padding: 0.75rem;
            vertical-align: top;
            border-top: 1px solid #434857;
        }
        i{
            margin-right: 10px;
        }
    </style>
    <script>
        $(function(){
            $(".qn").click(function () {
                $(".qn").removeClass("active");
                $(this).addClass("active");
            });
            function onloadiframe(){
                alert("1");
                this.height(this.content().find("body").height()+20);
            };
        });

        //function onloadiframe(){
        //    alert(this.Document.body.offsetHeight);
        //    this.height(this.Document.body.scrollHeight+20);
       // };
    </script>
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-xl-3" style="max-width:300px;">
            <nav style="margin-right: 40px; padding-top: 20px;">
                <div class="login" style="padding-bottom: 20px;">
                    <img src="" width="50rem" height="50rem" style="float: left"/>
                    <span class="navbar-brand" style="float: left; margin-left: 10px; margin-bottom: 0px;">省NOC信息<br>管理系统</span>
                    <div class="clearfix"></div>
                </div>
                <div class="nav navbar-nav">
                    <form class="search">
                        <input class="form-control" type="text" placeholder="Search...">
                        <button type="submit" class="po">
                            <i class="fa fa-search" aria-hidden="true"></i>
                        </button>
                    </form>
                    <ul class="nav qq nav-stacked xx">
                        <li class="ayx">Dashboards</li>
                        <li class="qp">
                            <a class="qn active" href="${pageContext.request.contextPath}/contact/dept_id" target="frame-content"><i class="fa fa-address-book fa-lg" aria-hidden="true"></i>通讯录</a>
                        </li>
                        <li class="qp">
                            <a class="qn" href="#"><i class="fa fa-share-square-o fa-lg" aria-hidden="true"></i>派单规则</a>
                        </li>
                        <li class="qp">
                            <a class="qn " href="#"><i class="fa fa-key fa-lg" aria-hidden="true"></i> 密码表</a>
                        </li>

                        <li class="ayx" style="margin-top: 20px;">Management</li>
                        <li class="qp">
                            <a class="qn " href="/user/userlist" target="frame-content"><i class="fa fa-users fa-lg" aria-hidden="true"></i>用户管理</a>
                        </li>
                        <li class="qp">
                            <a class="qn" href="/tag" target="blank"><i class="fa fa-tags fa-lg" aria-hidden="true"></i>标签管理</a>
                        </li>
                        <li class="qp">
                            <a class="qn " href="/post"><i class="fa fa-bell fa-lg" aria-hidden="true"></i>公告管理</a>
                        </li>
                    </ul>
                    <hr>
                </div>
            </nav>
        </div>
        <div class="col-xl-9">
            <div class="toplogin">
                <c:choose>
                    <c:when test="${!empty currentUser }">
                        <div class="btn-group" style="float: right;">
                    <button type="button" class="btn btn-login btn-sm dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        ${currentUser.getUsername()}
                    </button>
                    <div class="dropdown-menu">
                        <a class="dropdown-item" href="#">Profile</a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="${pageContext.request.contextPath}/user/logout">Logout</a>
                    </div>
                </div>
                        <div style=" float: right;"><i class="fa fa-user-circle fa-2x" aria-hidden="true"></i></div>
                    </c:when>
                    <c:otherwise>
                        <a href="${pageContext.request.contextPath}/">
                            <button type="button" class="btn btn-primary btn-sm btn-login" >Login</button>
                        </a>
                    </c:otherwise>
                </c:choose>
                <div class="clearfix"></div>
            </div>
            <iframe name="frame-content" id="frame-content" src="${pageContext.request.contextPath}/contact/dept_id/" width="100%"  height="" frameborder="0" scrolling="no" style="min-height: 1000px;" onload="onloadiframe()"></iframe>
        </div>
    </div>
</div>


</body>