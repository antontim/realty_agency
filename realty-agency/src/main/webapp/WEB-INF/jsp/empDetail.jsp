<script>
$(function() {
    $("#empDetailTabs").tabs({
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
<div id="empDetailDialog">
<input type="hidden" id="empId" value=""/>
    <div id="empDetailTabs">
    <ul>
        <li><a href="#evaluations">Evaluatioons</a></li>
        <li><a href="emp/test/load.do?empId=1">Test</a></li>
        <li><a href="emp/rate/load.do?empId=1">Rates</a></li>
    </ul>
  <div id="evaluations">
    <jsp:include page="evaluations.jsp"/>
  </div>
    </div>
</div>