function delEmployee(id) {
    $.ajax({
        url : "emp/del.do?id="+id,
        type: "PUT",
    }).done(function(data) {
        $('#empTable').dataTable().fnDeleteRow($("#emp_" + id).attr('ind'));
    });
}