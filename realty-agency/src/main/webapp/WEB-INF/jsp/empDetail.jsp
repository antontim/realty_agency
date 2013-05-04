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
        <li><a href="#evaluations" id="empDetailLink" onclick="loadEmpEvals();">Evaluations</a></li>
        <li><a href="#testresults" id="empDetailLink" onclick="loadEmpTestResults();">Test results</a></li>
        <li><a href="emp/rate/load.do?empId=1">Rates</a></li>
    </ul>
  <div id="evaluations">
    <jsp:include page="evaluations.jsp"/>
  </div>
  <div id="testresults">
    <jsp:include page="results.jsp"/>
  </div>
    </div>
</div>