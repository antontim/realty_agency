function delEmployee(e) {
    var tr = $(e.target).closest('tr');
    var id = tr.attr('id');
    tr.find('div[name="edit"]').addClass("hidden");
    tr.find('div.icon_refresh').removeClass("hidden");
    $.ajax({
        url : "emp/del.do?id="+id,
        type: "PUT",
    }).done(function(data) {
        var t = $('#empTable');
        tr.remove();
        t.trigger('update');
    });
}

function updEmployee(e) {
    var tr = $(e.target).closest('tr');
    var id = tr.attr('id');
    tr.find('div[name="edit"]').addClass("hidden");
    tr.find('div.icon_refresh').removeClass("hidden");
    $.ajax({
        url : "emp/upd.do?id="+id+"&name="+ tr.find('#name').val() + "&pos=" + tr.find('#pos').val(),
        type: "PUT",
    }).done(function(data) {
        var t = $('#empTable');
        tr.replaceWith(data);
        t.trigger('update');
    });
}

function addEmployee() {
    $.ajax({
        url : "emp/add.do?name="+$("#newEmpName").val()+"&pos="+$("#pos option:selected").val(),
        type: "PUT",
    }).done(function(data) {
        $row = $(data);
        var t = $('#empTable');
            t.find('tbody').append($row).trigger('addRows', [$row]);
            t.trigger('update');
            
            $("#newEmpName").val('');
    });
}

function preUpdateEmp(val) {
    $(val).addClass("hidden");
    $(val).siblings('.commit_icon').removeClass('hidden');
    
    var tr = $(val).closest('tr');
    
    tr.find('label[name="pos"]').addClass('hidden');
    var posCB = $('#pos').clone();
    posCB.val(tr.find('label[name="pos"]').text());
    var text = tr.find('label[name="pos"]').text();
    $(posCB).find(":contains('"+ text + "')").attr("selected", "selected");
    tr.children('td[name="pos"]').append(posCB);

    tr.find('label[name="name"]').addClass('hidden');
    var nameTF = $('#name').clone();
    nameTF.val(tr.find('label[name="name"]').text());
    tr.children('td[name="name"]').append(nameTF);
    
    var delFunc = tr.find('.delete_icon').attr('onclick');
    tr.find('.delete_icon').attr('onclick','');
    tr.find('.delete_icon').bind('click',function() {
        $(val).removeClass("hidden");
        $(val).siblings('.commit_icon').addClass('hidden');
        
        tr.find('#pos').remove();
        tr.find('label[name="pos"]').removeClass('hidden');

        tr.find('#name').remove();
        tr.find('label[name="name"]').removeClass('hidden');
        
        tr.find('div.delete_icon').attr('onclick',delFunc);
    });
}