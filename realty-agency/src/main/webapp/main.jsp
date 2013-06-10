<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Realty Agency</title>
<link rel="stylesheet" href="css/ra.css" />
<link rel="stylesheet" href="css/style.css" />
<link rel="stylesheet" href="css/jquery.tablesorter.pager.css" />
<link type="text/css" href="css/jq.css" rel="stylesheet" />
<link type="text/css" href="css/jquery-ui-1.10.2.custom.css" rel="stylesheet" />
<link type="text/css" href="css/style.css" rel="stylesheet" />
<link type="text/css" href="css/theme.blue.css" rel="stylesheet" />

<script type="text/javascript" src="js/jquery-latest.js"></script>
<script type="text/javascript" src="js/jquery-1.9.1.js"></script>
<script type="text/javascript" src="js/jquery-migrate-1.1.1.min.js"></script>
<script type="text/javascript" src="js/jquery-ui-1.10.2.custom.js"></script>
<script type="text/javascript" src="js/ra.js"></script>
<script type="text/javascript" src="js/jquery.validate.js"></script>
<script type="text/javascript" src="js/__jquery.tablesorter.js"></script>
<script type="text/javascript" src="js/jquery.tablesorter.js"></script>
<script type="text/javascript" src="js/_jquery.tablesorter.pager.js"></script>
<script type="text/javascript" src="js/date.js"></script>

<script>
jQuery.fn.center = function () {
    this.css("position","absolute");
    this.css("left", Math.max(0, (($(window).width() - $(this).outerWidth()) / 2) + 
                                                $(window).scrollLeft()) + "px");
    return this;
}

$(function() {
$( "#tabs" ).tabs().addClass( "ui-tabs-vertical ui-helper-clearfix" );
$( "#tabs li" ).removeClass( "ui-corner-top" ).addClass( "ui-corner-left" );
$( "#tabs" ).center();
});
$(function() {
    $( "#tabs" ).tabs({
    beforeLoad: function( event, ui ) {
    ui.jqXHR.error(function() {
    ui.panel.html(
    "Couldn't load this tab. We'll try to fix this as soon as possible. " +
    "If this wouldn't be a demo." );
    });
   }
  });



    function refreshDP(dpSelector1,dayVal) {
        $(dpSelector1).datepicker({dateFormat: 'yy-mm-dd'});
        $(dpSelector1).datepicker('setDate', dayVal);
    }

    var date = new Date();
    var firstDay = new Date(date.getFullYear(), date.getMonth(), 1);
    var lastDay = new Date(date.getFullYear(), date.getMonth() + 1, 0);

    refreshDP("#actstartdatepicker",firstDay);
    refreshDP("#actenddatepicker",lastDay);

});


</script>
<style>
.ui-tabs-vertical { width: 55em; }
.ui-tabs-vertical .ui-tabs-nav { padding: .2em .1em .2em .2em; float: left; width: 12em; }
.ui-tabs-vertical .ui-tabs-nav li { clear: left; width: 100%; border-bottom-width: 1px !important; border-right-width: 0 !important; margin: 0 -1px .2em 0; }
.ui-tabs-vertical .ui-tabs-nav li a { display:block; }
.ui-tabs-vertical .ui-tabs-nav li.ui-tabs-active { padding-bottom: 0; padding-right: .1em; border-right-width: 1px; border-right-width: 1px; }
.ui-tabs-vertical .ui-tabs-panel { padding: 1em; float: right; width: 40em;}

/* label { width: 10em; float: left; } */
/* label.error { float: none; color: red; padding-left: .5em; vertical-align: top; } */
/* p { clear: both; } */
/* .submit { margin-left: 12em; } */
/* em { font-weight: bold; padding-right: 1em; vertical-align: top; } */

/* pager wrapper, div */
.tablesorter-pager {
  padding: 0px;
}
/* pager wrapper, in thead/tfoot */
td.tablesorter-pager {
  background-color: #e6eeee;
  margin: 0; /* needed for bootstrap .pager gets a 18px bottom margin */
}
/* pager navigation arrows */
.tablesorter-pager img {
  vertical-align: middle;
  margin-right: 2px;
  cursor: pointer;
}

/* pager output text */
.tablesorter-pager .pagedisplay {
  padding: 0 5px 0 5px;
  width: 50px;
  text-align: center;
}

/* pager element reset (needed for bootstrap) */
.tablesorter-pager select {
  margin: 0;
  padding: 0;
}

/*** css used when "updateArrows" option is true ***/
/* the pager itself gets a disabled class when the number of rows is less than the size */
.tablesorter-pager.disabled {
  display: none;
}
/* hide or fade out pager arrows when the first or last row is visible */
.tablesorter-pager .disabled {
  /* visibility: hidden */
  opacity: 0.5;
  filter: alpha(opacity=50);
  cursor: default;
}


</style>
</head>
<body>
<div id="loginInfo" style="float:right;">Logged in as: <sec:authentication property="principal.username" />&nbsp;&nbsp;&nbsp;&nbsp;<a href="<c:url value="j_spring_security_logout" />">Logout</a></div>
    <div id="tabs">
        <ul>
            <sec:authorize access="hasAnyRole('ROLE_TEST','ROLE_ADMIN','ROLE_MANAGER','ROLE_ANALYTIC')"><li><a href="emp/load.do">Employees</a></li></sec:authorize>
            <sec:authorize access="hasAnyRole('ROLE_TEST','ROLE_MANAGER','ROLE_SALESMAN','ROLE_RENTER')"><li><a href="ent/load.do?active=ACTIVE">Entities</a></li></sec:authorize>
            <sec:authorize access="hasAnyRole('ROLE_TEST','ROLE_MANAGER','ROLE_SALESMAN','ROLE_RENTER')"><li><a href="#activities" onclick="loadActivities();">Activities</a></li></sec:authorize>
            <sec:authorize access="hasAnyRole('ROLE_TEST','ROLE_ANALYTIC')"><li><a href="quest/load.do">Questions</a></li></sec:authorize>
            <sec:authorize access="hasAnyRole('ROLE_TEST','ROLE_ANALYTIC')"><li><a href="quest/test/load.do">Tests</a></li></sec:authorize>
            <sec:authorize access="hasAnyRole('ROLE_TEST','ROLE_ANALYTIC','ROLE_MANAGER')"><li><a href="#MAH">MAH values</a></li></sec:authorize>
            <sec:authorize access="hasAnyRole('ROLE_TEST','ROLE_ANALYTIC','ROLE_MANAGER')"><li><a href="dept/load.do">Departments</a></li></sec:authorize>
            <sec:authorize access="hasAnyRole('ROLE_TEST','ROLE_MANAGER')"><li><a href="act/norm/load.do">Norms</a></li></sec:authorize>
            <li><a href="#info">About</a></li>
        </ul>
        <div id="info">
            <p>Realty Agency analityc system</p>
        </div>
        <sec:authorize access="hasAnyRole('ROLE_TEST','ROLE_MANAGER','ROLE_SALESMAN','ROLE_RENTER')"><div id="activities">
            <jsp:include page="WEB-INF/jsp/dateRange.jsp">
                <jsp:param value="loadActivities();" name="loadFunc"/>
                <jsp:param value="act" name="module"/>
            </jsp:include>
            <div id="body">
            </div>
        </div></sec:authorize>
        <sec:authorize access="hasAnyRole('ROLE_TEST','ROLE_ANALYTIC','ROLE_MANAGER')"><div id="MAH">
            <jsp:include page="WEB-INF/jsp/importancesMain.jsp"/>
        </div></sec:authorize>
    </div>
</body>
</html>