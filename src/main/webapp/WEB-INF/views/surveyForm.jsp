<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Eval Plus Home page</title>

    <!-- Bootstrap Core CSS -->
    <link href="../resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="../resources/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="../resources/dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Morris Charts CSS -->
    <link href="../resources/vendor/morrisjs/morris.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="../resources/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.0/jquery.min.js"></script>
    <![endif]-->

</head>

<body>

<div id="wrapper">

    <!-- Navigation -->
    <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="index.html">Eval Plus</a>
        </div>
        <!-- /.navbar-header -->

        <ul class="nav navbar-top-links navbar-right">

            <!-- /.dropdown  profile-->
            <li class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                    <i class="fa fa-user fa-fw"></i> <i class="fa fa-caret-down"></i>
                </a>
                <ul class="dropdown-menu dropdown-user">
                    <li><a href="#"><i class="fa fa-user fa-fw"></i> User Profile</a>
                    </li>
                    <li><a href="#"><i class="fa fa-gear fa-fw"></i> Settings</a>
                    </li>
                    <li class="divider"></li>
                    <li><a href="../logout"><i class="fa fa-sign-out fa-fw"></i> Logout</a>
                    </li>
                </ul>
                <!-- /.dropdown-user -->
            </li>
            <!-- /.dropdown -->
        </ul>
        <!-- /.navbar-top-links -->


        <div class="navbar-default sidebar" role="navigation">
            <div class="sidebar-nav navbar-collapse">
                <ul class="nav" id="side-menu">
                    <li>
                        <a href="../welcome"><i class="fa fa-dashboard fa-fw"></i> Dashboard</a>
                    </li>
                    <!-- menu -->
                    <li>
                        <a href="#"><i class="fa fa-user" aria-hidden="true"></i> Account<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a href="../generateAccount">Generate</a>
                            </li>
                            <li>
                                <a href="../manageAccount">Manage</a>
                            </li>
                        </ul>
                    </li>

                    <!-- menu -->
                    <li>
                        <a href="#"><i class="fa fa-commenting-o" aria-hidden="true"></i>Survey<span
                                class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a href="../newSurvey">New</a>
                            </li>
                            <li>
                                <a href="../manageSurvey">Manage</a>
                            </li>
                            <li>
                                <a href="../takeSurvey">Take</a>
                            </li>
                        </ul>
                    </li>

                    <!-- menu -->
                    <li>
                        <a href="#"><i class="fa fa-question" aria-hidden="true"></i>Questions<span
                                class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a href="../newQuestion">New</a>
                            </li>
                            <li>
                                <a href="../manageQuestion">Manage</a>
                            </li>
                        </ul>
                    </li>


                </ul>
            </div>
            <!-- /.sidebar-collapse -->
        </div>
        <!-- /.navbar-static-side -->
    </nav>


    <div id="page-wrapper">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">Dashboard</h1>
            </div>
            <!-- /.col-lg-12 -->
        </div>


        <!-- /.row -->
        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        Enter survey details
                    </div>
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-lg-6">
                                <spring:url value="/newSurvey" var="onSaveSurveyUrl"/>
                                <form role="form" action="${onSaveSurveyUrl}" method="post">
                                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

                                    <div class="form-group">
                                        <label>Status</label>
                                        <label class="radio-inline">
                                            <input required type="radio" name="status" id="optionsRadiosInline1"
                                                   value="OPENED" checked>Opened
                                        </label>
                                        <label class="radio-inline">
                                            <input type="radio" name="status" id="optionsRadiosInline2" value="Closed">Closed
                                        </label>
                                    </div>


                                    <div class="form-group">
                                        <label>Select a class for survey</label>
                                        <select class="form-control" name="classOffered">
                                            <c:forEach var="lecture" items="${classList}">
                                                <option value="${lecture.id}">${lecture.name}</option>
                                            </c:forEach>
                                        </select>
                                    </div>

                                    <div class="form-group">
                                        <label>Choose questions for the survey</label>
                                        <c:forEach var="quest" items="${questionList}">
                                            <div class="checkbox">
                                                <label>
                                                    <input id="question" name="questions" type="checkbox"
                                                           value="${quest.id}">${quest.question}
                                                </label>
                                            </div>
                                        </c:forEach>

                                    </div>


                                    <button type="submit" class="btn btn-default">Submit</button>
                                    <button type="reset" class="btn btn-default">Reset</button>
                                </form>
                            </div>

                        </div>
                        <!-- /.row (nested) -->
                    </div>
                    <!-- /.panel-body -->
                </div>
                <!-- /.panel -->
            </div>
            <!-- /.col-lg-12 -->


        </div>
        <!-- /.row -->
    </div>
    <!-- /#page-wrapper -->


</div>
<!-- /#wrapper -->

<!-- jQuery -->
<script src="../resources/vendor/jquery/jquery.min.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="../resources/vendor/bootstrap/js/bootstrap.min.js"></script>

<!-- Metis Menu Plugin JavaScript -->
<script src="../resources/vendor/metisMenu/metisMenu.min.js"></script>

<!-- Morris Charts JavaScript -->
<script src="../resources/vendor/raphael/raphael.min.js"></script>
<script src="../resources/vendor/morrisjs/morris.min.js"></script>
<script src="../resources/data/morris-data.js"></script>

<!-- Custom Theme JavaScript -->
<script src="../resources/dist/js/sb-admin-2.js"></script>
</body>

</html>









