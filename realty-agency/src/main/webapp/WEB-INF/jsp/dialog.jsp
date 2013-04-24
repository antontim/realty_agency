<script type="text/javascript">
    $(function() {
        $("#empForm").validate();
        var name = $("#name"), email = $("#pos"), password = $("#dept"), allFields = $(
                []).add(name).add(email).add(password);
        $("#dialog-form").dialog({
            autoOpen : false,
            height : 300,
            width : 350,
            modal : true,
            buttons : {

            "Create" : function() {
                    $.ajax({
                        url : "emp/add.do?name="+$("#name").val()+"&pos="+$("#pos option:selected").val(),
                        type: "PUT",
                    }).done(function(data) {
                        $row = $(data);
                        var t = $('#empTable');
                            t.find('tbody').append($row).trigger('addRows', [$row]);
                            t.trigger('update');
                        $("#dialog-form").dialog("close");
                    });
                },
                Cancel : function() {
                    $(this).dialog("close");
                }
            },
            close : function() {
                allFields.val("").removeClass("ui-state-error");
            }
        });
    });
</script>

<div id="dialog-form" title="Create new employee">
    <form class="empForm" id="commentForm" method="get" action="emp/add.do">
        <fieldset>
            <label for="name">Name</label><em>*</em>
                <input type="text" name="name" id="name" class="required text ui-widget-content ui-corner-all" />
            <label for="pos">Position</label><em>*</em> 
                <jsp:include page="positions.jsp">
                    <jsp:param value="${posList}" name="posList"/>
                    <jsp:param name="id" value="pos"/>
                    <jsp:param name="class" value="required select ui-widget-content ui-corner-all"/>
                </jsp:include>
        </fieldset>
    </form>
</div>