<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
 <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.2/themes/smoothness/jquery-ui.css" />
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="http://code.jquery.com/ui/1.10.2/jquery-ui.js"></script>
<link rel="stylesheet" href="css/jquery.dataTables.css" />
<link rel="stylesheet" href="css/ra.css" />
<!-- <script type="text/javascript" language="javascript" src="js/jquery.js"></script> -->
<script class="jsbin" src="http://datatables.net/download/build/jquery.dataTables.nightly.js"></script>
  <script type="text/javascript" src="http://jzaefferer.github.com/jquery-validation/jquery.validate.js"></script>
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

</style>
</head>
<body>
    <div id="tabs">
        <ul>
            <li><a href="emp/load.do">Employees</a></li>
            <li><a href="ajax/content1.html">Tab 1</a></li>
            <li><a href="ajax/content2.html">Tab 2</a></li>
            <li><a href="ajax/content3-slow.php">Tab 3 (slow)</a></li>
            <li><a href="ajax/content4-broken.php">Tab 4
                    (broken)</a></li>
        </ul>
    </div>
</body>
</html>