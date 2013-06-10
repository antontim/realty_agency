<script>
$(function() {
    $("#impTabs").tabs({
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
<div>
<div id="impTabs">
    <ul>
        <li><a href="measure/imp/load.do">Employees</a></li>
        <li><a href="measure/imp/dept/load.do">Depts</a></li>
        <li><a href="measure/imp/comp/load.do">Company</a></li>
    </ul>
</div>
</div>