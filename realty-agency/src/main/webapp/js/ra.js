function delEmployee(id) {
    $.ajax({
        url : "emp/del.do?id="+id,
        type: "PUT",
    }).done(function(data) {
        var t = $('#empTable');
        $("#emp_" + id).remove();
        t.trigger('update');
    });
}
