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

function delEval(e) {
    var tr = $(e.target).closest('tr');
    var id = tr.attr('id');
    tr.find('div[name="edit"]').addClass("hidden");
    tr.find('div.icon_refresh').removeClass("hidden");
    $.ajax({
        url : "emp/eval/del.do?id="+id,
        type: "PUT",
    }).done(function(data) {
        var t = $('#evalTable');
        tr.remove();
        t.trigger('update');
    });
}

function delTestres(e) {
    var tr = $(e.target).closest('tr');
    var id = tr.attr('id');
    tr.find('div[name="edit"]').addClass("hidden");
    tr.find('div.icon_refresh').removeClass("hidden");
    $.ajax({
        url : "emp/res/del.do?empId="+$('#empId').val()+"&testId="+tr.find('td[name="name"]').attr('id')+"&passed="+tr.find('td[name="passed"]').attr('id'),
        type: "PUT",
    }).done(function(data) {
        var t = $('#testresTable');
        tr.remove();
        t.trigger('update');
    });
}

function delQuest(e) {
    var tr = $(e.target).closest('tr');
    var id = tr.attr('id');
    tr.find('div[name="edit"]').addClass("hidden");
    tr.find('div.icon_refresh').removeClass("hidden");
    $.ajax({
        url : "quest/del.do?id="+id,
        type: "PUT",
    }).done(function(data) {
        var t = $('#questTable');
        tr.remove();
        t.trigger('update');
    });
}

function delTest(e) {
    var tr = $(e.target).closest('tr');
    var id = tr.attr('id');
    tr.find('div[name="edit"]').addClass("hidden");
    tr.find('div.icon_refresh').removeClass("hidden");
    $.ajax({
        url : "quest/test/del.do?id="+id,
        type: "PUT",
    }).done(function(data) {
        var t = $('#testTable');
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

function updEval(e) {
    var tr = $(e.target).closest('tr');
    var id = tr.attr('id');
    tr.find('div[name="edit"]').addClass("hidden");
    tr.find('div.icon_refresh').removeClass("hidden");
    $.ajax({
        url : "emp/eval/upd.do?id="+id+"&mark="+ tr.find('#mark').val(),
        type: "PUT",
    }).done(function(data) {
        var t = $('#evalTable');
        tr.replaceWith(data);
        t.trigger('update');
    });
}

function updTestres(e) {
    var tr = $(e.target).closest('tr');
    var id = tr.attr('id');
    tr.find('div[name="edit"]').addClass("hidden");
    tr.find('div.icon_refresh').removeClass("hidden");
    $.ajax({
        url : "emp/res/upd.do?empId="+$("#empId").val()+"&testId="+tr.find('td[name="name"]').attr('id')+"&passed="+tr.find('td[name="passed"]').attr('id')+"&res="+ tr.find('#result').val(),
        type: "PUT",
    }).done(function(data) {
        var t = $('#testresTable');
        tr.replaceWith(data);
        t.trigger('update');
    });
}

function updQuest(e) {
    var tr = $(e.target).closest('tr');
    var id = tr.attr('id');
    tr.find('div[name="edit"]').addClass("hidden");
    tr.find('div.icon_refresh').removeClass("hidden");
    $.ajax({
        url : "quest/upd.do?id="+id+"&text="+ tr.find('#newQuestText').val()+"&label="+ tr.find('#newQuestLabel').val() + "&measureId=" + tr.find('#measure').val(),
        type: "PUT",
    }).done(function(data) {
        var t = $('#questTable');
        tr.replaceWith(data);
        t.trigger('update');
    });
}

function updTest(e) {
    var tr = $(e.target).closest('tr');
    var id = tr.attr('id');
    tr.find('div[name="edit"]').addClass("hidden");
    tr.find('div.icon_refresh').removeClass("hidden");
    $.ajax({
        url : "quest/test/upd.do?id="+id+"&name="+ tr.find('#newTestName').val()+"&type="+ tr.find('#newTestType').val() + "&measureId=" + tr.find('#measure').val(),
        type: "PUT",
    }).done(function(data) {
        var t = $('#testTable');
        tr.replaceWith(data);
        t.trigger('update');
    });
}

function addEmployee(event) {
    var tr = $(event.target).closest('tr');
    if(tr.find("#newEmpName").val() === '') {
        alert('Name should be specified.');
        return;
    }
    $.ajax({
        url : "emp/add.do?name="+tr.find("#newEmpName").val()+"&pos="+tr.find("#pos option:selected").val(),
        type: "PUT",
    }).done(function(data) {
        $row = $(data);
        var t = $('#empTable');
            t.find('tbody').append($row).trigger('addRows', [$row]);
            t.trigger('update');
            
            tr.find("#newEmpName").val('');
    });
}

function addEval(event) {
    var tr  =$(event.target).closest('tr');
    if(tr.find("#mark").val() === '') {
        alert('Mark should be specified.');
        return;
    }
    $.ajax({
        url : "emp/eval/add.do?empId="+$("#empId").val()+"&questionId="+tr.find("#quest option:selected").val()+"&mark="+tr.find("#mark").val(),
        type: "PUT",
    }).done(function(data) {
        $row = $(data);
        var t = $('#evalTable');
        t.find('tbody').append($row).trigger('addRows', [$row]);
        t.trigger('update');
        
        tr.find("#mark").val('');
    });
}

function addTestres(event) {
    var tr = $(event.target).closest('tr');
    if(tr.find("#result").val() === '') {
        alert('Result value should be specified.');
        return;
    }
    $.ajax({
        url : "emp/res/add.do?empId="+$("#empId").val()+"&testId="+tr.find("#test option:selected").val()+"&res="+tr.find("#result").val(),
        type: "PUT",
    }).done(function(data) {
        $row = $(data);
        var t = $('#testresTable');
        t.find('tbody').append($row).trigger('addRows', [$row]);
        t.trigger('update');
        tr.find("#result").val('');
    });
}

function addQuest(event) {
    var tr = $(event.target).closest('tr');
    if(tr.find("#newQuestText").val() === '' || tr.find("#newQuestLabel").val() === '') {
        alert('Question Text and Label should be specified.');
        return;
    }
    $.ajax({
        url : "quest/add.do?text="+tr.find("#newQuestText").val()+"&label="+tr.find("#newQuestLabel").val()+"&measureId="+tr.find("#measure option:selected").val(),
        type: "PUT",
    }).done(function(data) {
        $row = $(data);
        var t = $('#questTable');
        t.find('tbody').append($row).trigger('addRows', [$row]);
        t.trigger('update');
        
        tr.find("#newQuestText").val('');
        tr.find("#newQuestLabel").val('');
    });
}

function addTest(event) {
    var tr = $(event.target).closest('tr');
    if(tr.find("#newTestName").val() === '' || tr.find("#newTestType").val() === '') {
        alert('Test Name and Type should be specified.');
        return;
    }
    $.ajax({
        url : "quest/test/add.do?name="+tr.find("#newTestName").val()+"&type="+tr.find("#newTestType").val()+"&measureId="+tr.find("#measure option:selected").val(),
        type: "PUT",
    }).done(function(data) {
        $row = $(data);
        var t = $('#testTable');
        t.find('tbody').append($row).trigger('addRows', [$row]);
        t.trigger('update');
        
        tr.find("#newTestName").val('');
        tr.find("#newTestType").val('');
    });
}

function addEntity(event) {
    var tr = $(event.target).closest('tr');
    if(tr.find("#newAddr").val() === '' || tr.find("#price").val() === '' ) {
        alert('Address and Price value should be specified.');
        return;
    }
    $.ajax({
        url : "ent/add.do?addr="+tr.find("#newAddr").val()
            +"&classId="+tr.find("#entclass option:selected").val()
            +"&typeId="+tr.find("#enttype option:selected").val()
            +"&price="+tr.find("#price").val(),
        type: "PUT",
    }).done(function(data) {
        $row = $(data);
        var t = $('#entTable');
        t.find('tbody').append($row).trigger('addRows', [$row]);
        t.trigger('update');
        
        tr.find("#newAddr").val('');
        tr.find("#price").val('');
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

function preUpdateQuest(val) {
    $(val).addClass("hidden");
    $(val).siblings('.commit_icon').removeClass('hidden');
    
    var tr = $(val).closest('tr');
    
    tr.find('label[name="measure"]').addClass('hidden');
    var measureCB = $('#measure').clone();
    measureCB.val(tr.find('label[name="measure"]').text());
    var text = tr.find('label[name="measure"]').text();
    $(measureCB).find(":contains('"+ text + "')").attr("selected", "selected");
    tr.children('td[name="measure"]').append(measureCB);
    
    tr.find('label[name="text"]').addClass('hidden');
    var textTF = $('#newQuestText').clone();
    textTF.val(tr.find('label[name="text"]').text());
    tr.children('td[name="text"]').append(textTF);
    
    tr.find('label[name="label"]').addClass('hidden');
    var labelTF = $('#newQuestLabel').clone();
    labelTF.val(tr.find('label[name="label"]').text());
    tr.children('td[name="label"]').append(labelTF);
    
    var delFunc = tr.find('.delete_icon').attr('onclick');
    tr.find('.delete_icon').attr('onclick','');
    tr.find('.delete_icon').bind('click',function() {
        $(val).removeClass("hidden");
        $(val).siblings('.commit_icon').addClass('hidden');
        
        tr.find('#measure').remove();
        tr.find('label[name="measure"]').removeClass('hidden');
        
        tr.find('#newQuestText').remove();
        tr.find('label[name="text"]').removeClass('hidden');
        
        tr.find('#newQuestLabel').remove();
        tr.find('label[name="label"]').removeClass('hidden');
        
        tr.find('div.delete_icon').attr('onclick',delFunc);
    });
}

function preUpdateTest(val) {
    $(val).addClass("hidden");
    $(val).siblings('.commit_icon').removeClass('hidden');
    
    var tr = $(val).closest('tr');
    
    tr.find('label[name="measure"]').addClass('hidden');
    var measureCB = $('#measure').clone();
    measureCB.val(tr.find('label[name="measure"]').text());
    var text = tr.find('label[name="measure"]').text();
    $(measureCB).find(":contains('"+ text + "')").attr("selected", "selected");
    tr.children('td[name="measure"]').append(measureCB);
    
    tr.find('label[name="name"]').addClass('hidden');
    var nameTF = $('#newTestName').clone();
    nameTF.val(tr.find('label[name="name"]').text());
    tr.children('td[name="name"]').append(nameTF);
    
    tr.find('label[name="type"]').addClass('hidden');
    var typeTF = $('#newTestType').clone();
    typeTF.val(tr.find('label[name="type"]').text());
    tr.children('td[name="type"]').append(typeTF);
    
    var delFunc = tr.find('.delete_icon').attr('onclick');
    tr.find('.delete_icon').attr('onclick','');
    tr.find('.delete_icon').bind('click',function() {
        $(val).removeClass("hidden");
        $(val).siblings('.commit_icon').addClass('hidden');
        
        tr.find('#measure').remove();
        tr.find('label[name="measure"]').removeClass('hidden');
        
        tr.find('#newTestName').remove();
        tr.find('label[name="name"]').removeClass('hidden');
        
        tr.find('#newTestType').remove();
        tr.find('label[name="type"]').removeClass('hidden');
        
        tr.find('div.delete_icon').attr('onclick',delFunc);
    });
}

function preUpdateEval(val) {
    $(val).addClass("hidden");
    $(val).siblings('.commit_icon').removeClass('hidden');
    
    var tr = $(val).closest('tr');
    
    tr.find('label[name="mark"]').addClass('hidden');
    var markTF = $('.footer #mark').clone();
    markTF.val(tr.find('label[name="mark"]').text());
    tr.children('td[name="mark"]').append(markTF);

    var delFunc = tr.find('.delete_icon').attr('onclick');
    tr.find('.delete_icon').attr('onclick','');
    tr.find('.delete_icon').bind('click',function() {
        $(val).removeClass("hidden");
        $(val).siblings('.commit_icon').addClass('hidden');
        
        tr.find('#mark').remove();
        tr.find('label[name="mark"]').removeClass('hidden');
        
        tr.find('div.delete_icon').attr('onclick',delFunc);
    });
}

function preUpdateTestres(val) {
    $(val).addClass("hidden");
    $(val).siblings('.commit_icon').removeClass('hidden');
    
    var tr = $(val).closest('tr');
    
    tr.find('label[name="result"]').addClass('hidden');
    var resTF = $('.footer #result').clone();
    resTF.val(tr.find('label[name="result"]').text());
    tr.children('td[name="result"]').append(resTF);
    
    var delFunc = tr.find('.delete_icon').attr('onclick');
    tr.find('.delete_icon').attr('onclick','');
    tr.find('.delete_icon').bind('click',function() {
        $(val).removeClass("hidden");
        $(val).siblings('.commit_icon').addClass('hidden');
        
        tr.find('#result').remove();
        tr.find('label[name="result"]').removeClass('hidden');
        
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

function loadEmpEvals() {
    var evalDiv = $('#evaluations');
    var startDate = evalDiv.find('#startdatepicker').val();
    var endDate = evalDiv.find('#enddatepicker').val();
    var id = $('#empDetailDialog').find("#empId").val();

    $.ajax({
        url : "emp/eval/load.do?empId="+id+"&startDate="+startDate+"&endDate="+endDate,
        type: "GET",
    }).done(function(data) {
        evalDiv.find("#evalsBody").empty();
        evalDiv.find("#evalsBody").append(data);
    });
}

function loadEmpTestResults() {
    var evalDiv = $('#testresults');
    var startDate = evalDiv.find('#startdatepicker').val();
    var endDate = evalDiv.find('#enddatepicker').val();
    var id = $('#empDetailDialog').find("#empId").val();
    
    $.ajax({
        url : "emp/res/load.do?empId="+id+"&startDate="+startDate+"&endDate="+endDate,
        type: "GET",
    }).done(function(data) {
        evalDiv.find("#testresBody").empty();
        evalDiv.find("#testresBody").append(data);
    });
}

function loadEmpRates() {
    var evalDiv = $('#rates');
    var id = $('#empDetailDialog').find("#empId").val();
    
    $.ajax({
        url : "emp/rate/load.do?empId="+id,
        type: "GET",
    }).done(function(data) {
        evalDiv.empty();
        evalDiv.append(data);
    });
}

function empDetailLoad(e) {
    var date = new Date();
    var firstDay = new Date(date.getFullYear(), date.getMonth(), 1);
    var lastDay = new Date(date.getFullYear(), date.getMonth() + 1, 0);

    refreshDatePickers("#evaluations #startdatepicker","#testresults #startdatepicker","#startdatepicker",firstDay);
    refreshDatePickers("#evaluations #enddatepicker","#testresults #enddatepicker","#enddatepicker",lastDay);
}

function refreshDatePickers(dpSelector1,dpSelector2,dpSelector3,dayVal) {
        $(dpSelector1).datepicker({dateFormat: 'yy-mm-dd'});
        $(dpSelector1).datepicker('setDate', dayVal);

        $(dpSelector2).datepicker({dateFormat: 'yy-mm-dd'});
        $(dpSelector2).datepicker('setDate', dayVal);

        $(dpSelector3).datepicker({dateFormat: 'yy-mm-dd'});
        $(dpSelector3).datepicker('setDate', dayVal);
}

function empDetailOpen(event) {
    var tr = $(event.target).closest('tr');
    $('#empDetailDialog').find('#empId').val(tr.attr('id'));
    $('#empDetailDialog').dialog('open');
    
    $('#empDetailLink')[0].click();
}

function order(event) {
    $('#orderDialog').find('#entId').val($(event.target).closest('tr').attr('id'));
    $('#orderDialog').dialog('open');
}

function createOrder() {
    var orderDialog = $('#orderDialog');
    var entId = orderDialog.find('#entId').val();
    $.ajax({
        url : "act/add.do?entId="+entId+"&actTpId="+orderDialog.find("#actTypes option:selected").val(),
        type: "PUT",
    }).done(function(data) {
        var t = $('#entTable');
        t.find('#'+entId).find('label[name="addr"]').removeClass('fake-link');
        t.find('#'+entId).find('label[name="addr"]').attr('onclick','');
        $('#orderDialog').dialog('close');
    });
}

function editVal(event) {
    $(event.target).addClass('hidden');
    var td = $(event.target).closest('td');
    td.find('input').removeClass('hidden');
    td.find('input').focus();
}

function processKey(event) {
    if(event.keyCode === 13) {
        // enter
        var td = $(event.target).closest('td');
        var m1 = td.attr('m1');
        var m2 = td.attr('m2');
        var val = $(event.target).val();
        $.ajax({
            url : "measure/imp/upd.do?m1="+m1+"&m2="+m2+"&val="+val,
            type: "PUT",
        }).done(function(data) {
            td.replaceWith(data);
            $('#impTable td[m1="'+m2+'"][m2="'+m1+'"] label').text((1/val).toFixed(2));
        });
    } else if (event.keyCode === 27) {
        // esc
        $(event.target).addClass('hidden');
        var td = $(event.target).closest('td');
        td.find('label').removeClass('hidden');
    }
}

function calcMahRes(event) {
    $(event.target).attr("disabled", true);
    $.ajax({
        url : "mah/calc.do",
        type: "PUT",
    }).done(function(data) {
        $(event.target).attr("disabled", false);
    });
}
