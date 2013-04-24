<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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

<script>
$(function() {
$( "#tabs" ).tabs().addClass( "ui-tabs-vertical ui-helper-clearfix" );
$( "#tabs li" ).removeClass( "ui-corner-top" ).addClass( "ui-corner-left" );
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
  padding: 5px;
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
    <div id="tabs">
        <ul>
            <li><a href="emp/load.do">Employees</a></li>
            <li><a href="ajax/content1.html">Tab 1</a></li>
        </ul>
    </div>
</body>
</html>