<script type="text/javascript">
    $(function() {
        var name = $("#name"), email = $("#pos"), password = $("#dept"), allFields = $(
                []).add(name).add(email).add(password);
        $("#dialog-form").dialog({
            autoOpen : false,
            height : 340,
            width : 350,
            modal : true,
            buttons : {

            "Create" : function() {
                    $.ajax({
                        url : "emp/add?name="+$("#name").val()+"&pos="+$("#pos").val()+"&dept="+$("#dept").val(),
                    }).done(function(data) {
                        $("#empTable").append(data);
                        $(this).dialog("close");
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
    <form>
        <fieldset>
            <label for="name">Name</label>
                <input type="text" name="name" id="name" class="text ui-widget-content ui-corner-all" />
            <label for="pos">Position</label> 
                <input type="text" name="pos" id="pos" value="" class="text ui-widget-content ui-corner-all" />
            <label for="dept">Department</label>
                <input type="text" name="dept" id="dept" value="" class="text ui-widget-content ui-corner-all" />
        </fieldset>
    </form>
</div>