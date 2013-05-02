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

function addEntity() {
    $.ajax({
        url : "ent/add.do?addr="+$(".footer #newAddr").val()
            +"&classId="+$(".footer #entclass option:selected").val()
            +"&typeId="+$(".footer #enttype option:selected").val()
            +"&price="+$(".footer #price").val(),
        type: "PUT",
    }).done(function(data) {
        $row = $(data);
        var t = $('#entTable');
        t.find('tbody').append($row).trigger('addRows', [$row]);
        t.trigger('update');
        
        $(".footer #newAddr").val('');
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

function preUpdateEnt(val) {
    $(val).addClass("hidden");
    $(val).siblings('.commit_icon').removeClass('hidden');
    
    var tr = $(val).closest('tr');
    
    tr.find('label[name="enttype"]').addClass('hidden');

    var tpCB = $('#enttype').clone();
    tpCB.val(tr.find('label[name="enttype"]').text());
    var text = tr.find('label[name="enttype"]').text();
    $(tpCB).find(":contains('"+ text + "')").attr("selected", "selected");
    tr.children('td[name="enttype"]').append(tpCB);

    tr.find('label[name="entclass"]').addClass('hidden');
    var clCB = $('#entclass').clone();
    clCB.val(tr.find('label[name="entclass"]').text());
    var text = tr.find('label[name="entclass"]').text();
    $(clCB).find(":contains('"+ text + "')").attr("selected", "selected");
    tr.children('td[name="entclass"]').append(clCB);
    
    tr.find('label[name="addr"]').addClass('hidden');
    var addrTF = $('#newAddr').clone();
    addrTF.val(tr.find('label[name="addr"]').text());
    tr.children('td[name="addr"]').append(addrTF);
    
    tr.find('label[name="price"]').addClass('hidden');
    var addrTF = $('#price').clone();
    addrTF.val(tr.find('label[name="price"]').text());
    tr.children('td[name="price"]').append(addrTF);
    
    var delFunc = tr.find('.delete_icon').attr('onclick');
    tr.find('.delete_icon').attr('onclick','');
    tr.find('.delete_icon').bind('click',function() {
        $(val).removeClass("hidden");
        $(val).siblings('.commit_icon').addClass('hidden');
        
        tr.find('#newAddr').remove();
        tr.find('label[name="addr"]').removeClass('hidden');
        
        tr.find('#enttype').remove();
        tr.find('label[name="enttype"]').removeClass('hidden');
        
        tr.find('#entclass').remove();
        tr.find('label[name="entclass"]').removeClass('hidden');
        
        tr.find('#price').remove();
        tr.find('label[name="price"]').removeClass('hidden');
        
        tr.find('div.delete_icon').attr('onclick',delFunc);
    });
}

function updEntity(e) {
    var tr = $(e.target).closest('tr');
    var id = tr.attr('id');
    tr.find('div[name="edit"]').addClass("hidden");
    tr.find('div.icon_refresh').removeClass("hidden");
    $.ajax({
        url : "ent/upd.do?id="+id+"&addr="+tr.find("#newAddr").val()
                +"&classId="+tr.find("#entclass").val()
                +"&typeId="+tr.find("#enttype").val()
                +"&price="+tr.find("#price").val(),
        type: "PUT",
    }).done(function(data) {
        var t = $('#entTable');
        tr.replaceWith(data);
        t.trigger('update');
    });
}

function delEntity(e) {
    var tr = $(e.target).closest('tr');
    var id = tr.attr('id');
    tr.find('div[name="edit"]').addClass("hidden");
    tr.find('div.icon_refresh').removeClass("hidden");
    $.ajax({
        url : "ent/del.do?id="+id,
        type: "PUT",
    }).done(function(data) {
        var t = $('#entTable');
        tr.remove();
        t.trigger('update');
    });
}

function showEnt(val) {
    $.ajax({
        url : "ent/load.do?active=" + val,
        type: "GET",
    }).done(function(data) {
        var t = $('#entitiesBody');
        t.replaceWith(data);
    });
}