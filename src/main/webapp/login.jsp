<%--
  Created by IntelliJ IDEA.
  User: dongt
  Date: 2017/7/12
  Time: 21:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <!--[if IE]><meta http-equiv='X-UA-Compatible' content='IE=edge,chrome=1' /><![endif]-->
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>省NOC通讯管理平台</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css" integrity="sha384-rwoIResjU2yc3z8GV/NPeZWAv56rSmLldC3R/AZzGRnGxQQKnKkoFVhFQhNUwEyJ" crossorigin="anonymous">
    <link rel="stylesheet" href="font-awesome/css/font-awesome.min.css">
    <script src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js" ></script>
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
            background-color: #252830;}
        .form-control{
            background-color: #252830;
        }
        .form-div{
            margin-left:5%;
            margin-top: 25%;
            background-color: #434857;
            display: block;
            width: 300px;
            padding: 1rem 0.75rem;
            font-size: 0.9rem;
            line-height: 1.25;
            color: #fff;
            border-radius: 0.25rem;}
        .loginbtn{
            float: right;
            width: 1.5rem ;
            height: 1.5rem;
            border-radius: 1.5rem;
            color: #fff;
            text-align: center;
            white-space: nowrap;
            vertical-align: middle;
            line-height: 1.5rem;
            margin-top: -0.2rem;
            padding-left: 0.2rem;
            font-size: 1.5rem;
            font-weight: 400;
        }
        .loginbtn:hover{
            text-decoration:none;
        }
        .loginbtn:visited{
            text-decoration:none;
            color: #fff;
        }
    </style>
    <script>
        $(document).ready(function() {
            $("#submit").click(function() {
                var username = $("#username").val();
                var password = $("#password").val();
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
                $("#adminlogin").submit();
            });

        if ('${errorMsg}' != '') {
            $(".form-group").addClass("has-error");
            $("#username").addClass("form-control-error");
            $("#password").addClass("form-control-error");
            alert('${errorMsg}');
        };
            /拦截器显示信息/
        if ('${message}' != '') {
            alert('${message}');
        }
       });
    </script>
</head>
<body>
<div class="container">
    <!-- Content here -->
    <div class="row">
        <div class="form-div">
            <form id=adminlogin method=post name=adminlogin action="${pageContext.request.contextPath}/user/login">
                <div class="form-group">
                    <label for="username">Username</label>
                    <a class="loginbtn" href="#" id="submit"><i class="fa fa-sign-in" aria-hidden="true"></i></a>
                    <div class="clearfix"></div>
                    <input type="text" class="form-control" id="username" name="username" value="${user.username}" placeholder="Username">
                </div>
                <div class="form-group">
                    <label for="password">Password</label>
                    <input type="password" class="form-control" id="password" name="password" value="" placeholder="Password">
                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>
