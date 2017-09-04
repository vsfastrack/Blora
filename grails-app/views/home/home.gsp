<%--
  Created by IntelliJ IDEA.
  User: bhaskar
  Date: 1/9/17
  Time: 5:09 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Blora</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <style>
    /* Set height of the grid so .sidenav can be 100% (adjust if needed) */
    .row.content {height: 1500px}

    /* Set gray background color and 100% height */
    .sidenav {
        background-color: #f1f1f1;
        height: 100%;
    }

    /* Set black background color, white text and some padding */
    footer {
        background-color: #555;
        color: white;
        padding: 15px;
    }

    /* On small screens, set height to 'auto' for sidenav and grid */
    @media screen and (max-width: 767px) {
        .sidenav {
            height: auto;
            padding: 15px;
        }
        .row.content {height: auto;}
    }
        .alignLeft{
            margin-left: 32%;
        }
    .alignSignup{
        margin-top: 0.5%;
    }
        .alignContainer{
            margin-top:4%;
        }
        .designLoginModal:{
            width:500px;

        }
        .alignUserDrpDwn{
            margin-left: 86.4%;
            margin-top:-0.5%;
        }
        .right{
            float: right;
        }
        .title{
            margin-top : -40%;
            margin-left: 25%;
        }
    </style>
</head>
<body>
<nav class="navbar navbar-default navbar-fixed-top">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header" style="margin-left: 13%;">
            <a class="navbar-brand" href="#"><i class="glyphicon glyphicon-play-circle"></i><h1 class ="title">Blora</h1></a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <form class="navbar-form navbar-left alignLeft">
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="Search">
                </div>
                <button type="submit" class="btn btn-default">Submit</button>
            </form>
            <ul class="nav navbar-nav alignSignup">
                <sec:ifLoggedIn>
                    <button type="button" class="btn btn-default btn-circle btn " data-toggle="modal" data-target="#createTopicModal"><i class="glyphicon glyphicon-plus"></i></button>
                    <button type="button" class="btn btn-default btn-circle btn"><i class="glyphicon glyphicon-envelope"></i></button>
                    <button type="button" class="btn btn-default btn-circle btn" data-toggle="modal" data-target="#createResourceModal"><i class="glyphicon glyphicon-paperclip" ></i></button>
%{--                    <button type="button" class="btn btn-default btn-circle btn dropdown-toggle " data-toggle="dropdown"><i class="glyphicon glyphicon-user"></i></button>
                    <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                        <a class="dropdown-item" href="#">Action</a>
                        <a class="dropdown-item" href="#">Another action</a>
                        <a class="dropdown-item" href="#">Something else here</a>
                    </div>--}%

                        <button class="btn btn-default btn-circle dropdown-toggle" type="button" data-toggle="dropdown"><i class="glyphicon glyphicon-user"></i></button>
                        <ul class="dropdown-menu alignUserDrpDwn">
                            <li><a href="#">Profile<i class="glyphicon glyphicon-briefcase right"></i></a></li>
                            <li><a href="#">Recent Topics<i class="glyphicon glyphicon-tags right"></i></a></li>
                            <li><a href="#">Resources <i class="glyphicon glyphicon-education right"></i></a></li>
                            <li><a href="#">Notifications <i class="glyphicon glyphicon-bell right"></i></a></li>
                            <li><g:remoteLink class="logout" controller="logout" method="post" asynchronous="false" onSuccess="location.reload()">Logout<i class="glyphicon glyphicon-off right"></i></g:remoteLink></li>
                        </ul>

                </sec:ifLoggedIn>
                <sec:ifNotLoggedIn>
                    <button  class="btn btn-default" data-toggle="modal" data-target="#signupModal">Signup</button>
                    <button  class="btn btn-default" data-toggle="modal" data-target="#loginModal">Login</button>
                </sec:ifNotLoggedIn>
            </ul>
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>
<div class="container-fluid">
    <div class="row content alignContainer">
        <div class="col-sm-3 sidenav">
        </div>

        <div class="modal fade " id="loginModal" role="dialog" style="margin-top: 10%;">
            <div class="modal-dialog modal-sm" style="width:450px;">

                <!-- Modal content-->
                <div class="modal-content designLoginModal">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Login</h4>
                    </div>
                    <div class="modal-body">
                     <form class="form-horizontal" action="/Quora/j_spring_security_check" method='POST' id='loginForm'>
                            <div class="form-group">
                                <label class="control-label col-sm-2" for="email">Username:</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="login-email" placeholder="Enter username" name='j_username'>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-sm-2" for="pwd">Password:</label>
                                <div class="col-sm-10">
                                    <input type="password" class="form-control" id="login-pwd" placeholder="Enter password" name='j_password'>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-offset-2 col-sm-10">
                                    <div class="checkbox">
                                        <label><input type="checkbox" name="remember"> Remember me</label>
                                    </div>
                                </div>
                            </div>
                         <div class="form-group">
                             <div class="col-sm-offset-2 col-sm-10">
                                 <g:link controller = "register" action = "forgotPassword">Forgot your password?</g:link>
                             </div>
                         </div>
                            <div class="form-group">
                                <div class="col-sm-offset-2 col-sm-10">
                                    <button type="submit" class="btn btn-default">Submit</button>
                                </div>
                            </div>
                        </form>-
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    </div>
                </div>

            </div>
        </div>
        <div class="modal fade" id="signupModal" role="dialog" style="margin-top: 7%;">
            <div class="modal-dialog modal-sm" style="width:450px;">

                <!-- Modal content-->
                <div class="modal-content designModal">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Signup</h4>
                    </div>
                    <div class="modal-body">
                        <g:form class="form-horizontal" controller="registration" action="register" enctype="multipart/form-data">
                            <div class="form-group">
                                <label class="control-label col-sm-2" for="email">Firstname:</label>
                                <div class="col-sm-10">
                                    <g:textField class="form-control" id="firstname" placeholder="Enter firstname" name="firstName"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-sm-2" for="email">Lastname:</label>
                                <div class="col-sm-10">
                                    <g:textField  class="form-control" id="lastname" placeholder="Enter lastname" name="lastName"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-sm-2" for="email">Email:</label>
                                <div class="col-sm-10">
                                    <input type="email" class="form-control" id="email" placeholder="Enter email" name="email">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-sm-2" for="email">Username:</label>
                                <div class="col-sm-10">
                                    <g:textField class="form-control" id="username" placeholder="Enter username" name="username"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-sm-2" for="pwd">Password:</label>
                                <div class="col-sm-10">
                                    <g:passwordField class="form-control" id="pwd" placeholder="Enter password" name="password"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-sm-2" for="pwd" style="margin-top:-2%;">Confirm Password:</label>
                                <div class="col-sm-10">
                                    <g:passwordField class="form-control" id="confirmpwd" placeholder="Confirm password" name="confirmPassword"/>
                                </div>
                            </div>
                            %{--<div class="form-group">
                                <label class="control-label col-sm-2" for="pwd" style="margin-top:-2%;">Upload Photo:</label>
                                <div class="col-sm-10">
                                    <input type='file' class="form-control" id="photo" name="registrationCO.profilePhoto">
                                </div>
                            </div>--}%
                            <div class="form-group">
                                <div class="col-sm-offset-2 col-sm-10">
                                    <button type="submit" class="btn btn-default">Register</button>
                                </div>
                            </div>
                        </g:form>
                    </div>
            %{--        <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    </div>--}%
                </div>

            </div>
        </div>
        <div class="modal fade" id="createTopicModal" role="dialog" style="margin-top: 7%;">
            <div class="modal-dialog modal-sm" style="width:450px;">

                <!-- Modal content-->
                <div class="modal-content designModal">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Create Topic</h4>
                    </div>
                    <div class="modal-body">
                        <g:form class="form-horizontal" controller="topic" action="createTopic">
                            <div class="form-group">
                                <label class="control-label col-sm-2" for="email">Name:</label>
                                <div class="col-sm-10">
                                    <g:textField class="form-control" id="firstname" placeholder="Enter Topic Name" name="topicName"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-sm-2" for="email">Visibility:</label>
                                <div class="col-sm-10">
                                    <select class="form-control" id="sel1" name="visibility">
                                        <option value="PU">Public</option>
                                        <option value="PR">Private</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-offset-2 col-sm-10">
                                    <button type="submit" class="btn btn-default">Create Topic</button>
                                </div>
                            </div>
                        </g:form>
                    </div>
                    %{--        <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                            </div>--}%
                </div>

            </div>
        </div>
        <div class="modal fade" id="sendInvitationModal" role="dialog" style="margin-top: 7%;">
            <div class="modal-dialog modal-sm" style="width:450px;">

                <!-- Modal content-->
                <div class="modal-content designModal">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Create Topic</h4>
                    </div>
                    <div class="modal-body">
                        <g:form class="form-horizontal" controller="topic" action="createTopic">
                            <div class="form-group">
                                <label class="control-label col-sm-2" for="email">Name:</label>
                                <div class="col-sm-10">
                                    <g:textField class="form-control" id="firstname" placeholder="Enter Topic Name" name="topicName"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-sm-2" for="email">Visibility:</label>
                                <div class="col-sm-10">
                                    <select class="form-control" id="visibilityOption" name="visibility">
                                        <option value="PU">Public</option>
                                        <option value="PR">Private</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-offset-2 col-sm-10">
                                    <button type="submit" class="btn btn-default">Create Topic</button>
                                </div>
                            </div>
                        </g:form>
                    </div>
                    %{--        <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                            </div>--}%
                </div>

            </div>
        </div>
        <div class="modal fade" id="createResourceModal" role="dialog" style="margin-top: 7%;">
            <div class="modal-dialog modal-sm" style="width:500px;">

                <!-- Modal content-->
                <div class="modal-content designModal">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Create Resource</h4>
                    </div>
                    <div class="modal-body">
                        <g:form class="form-horizontal" controller="resource" action="createResource">
                            <div class="form-group">
                                <label class="control-label col-sm-2" for="email">Description:</label>
                                <div class="col-sm-10">
                                    <g:textField class="form-control" id="firstname" placeholder="Enter Description" name="description"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-sm-2" for="email">Link:</label>
                                <div class="col-sm-10">
                                    <g:textField class="form-control" id="firstname" placeholder="Enter ResourceLink" name="url"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-sm-2" for="email">Topic:</label>
                                <div class="col-sm-10">
                                   <select class="form-control" id="topics" name="topicId">
                                        <option value="1">Grails2.0</option>
                                        <option value="2">Spring-Security</option>
                                        <option value="3">Hibernate</option>
                                        <option value="4">Java8</option>
                                    </select>
%{--<g:select name="user.company.id"
          from="${Company.list()}"
          value="${user?.company.id}"
          optionKey="id" />--}%
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-offset-2 col-sm-10">
                                    <button type="submit" class="btn btn-default">Create Resource</button>
                                </div>
                            </div>
                        </g:form>
                    </div>
                    %{--        <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                            </div>--}%
                </div>

            </div>
        </div>
        <div class="col-sm-6">
            <div class="container-fluid alignContainer">
                <g:if test="${flash.error}">
                <div class="alert alert-danger">
                    <strong>Errors!</strong> ${flash.error}
                </div>
                </g:if>
                <g:if test="${flash.success}">
                <div class="alert alert-success">
                    <strong>Success!</strong> ${flash.success}
                </div>
                </g:if>
            <div class="panel panel-default">
                <div class="panel-body">Look, I'm in a panel!</div>
            </div>
            <div class="panel panel-default">
                <div class="panel-body">Look, I'm in a panel!</div>
            </div>
            <div class="panel panel-default">
                <div class="panel-body">Look, I'm in a panel!</div>
            </div>
            <div class="panel panel-default">
                <div class="panel-body">Look, I'm in a panel!</div>
            </div>
            <div class="panel panel-default">
                <div class="panel-body">Look, I'm in a panel!</div>
            </div>
        </div>

        </div>
        <div class="col-sm-3 sidenav">
        </div>
    </div>
</div>

<footer class="container-fluid">
    <p>Footer Text</p>
</footer>

</body>
</html>
