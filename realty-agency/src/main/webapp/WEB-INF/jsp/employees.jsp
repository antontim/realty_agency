<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<script type="text/javascript">
$(function(){
    var pagerOptions = {
        container: $("#emp_pager"),
        ajaxUrl: null,
        customAjaxUrl: function(table, url) { return url; },
        output: '{startRow} to {endRow} ({totalRows})',
        updateArrows: true,
        page: 0,
        size: 10,
        fixedHeight: true,
        removeRows: false,
        cssNext: '.next',
        cssPrev: '.prev',
        cssFirst: '.first',
        cssLast: '.last',
        cssGoto: '.gotoPage',
        cssPageDisplay: '.pagedisplay',
        cssPageSize: '.pagesize',
    };

    $("#empTable")
        .tablesorter({
            theme: 'blue',
            widthFixed: true,
            widgets: ['zebra']
        })
        .bind('pagerChange pagerComplete pagerInitialized pageMoved', function(e, c){})
        .tablesorterPager(pagerOptions);

    $("#evalstartdatepicker").datepicker({dateFormat: 'yy-mm-dd'});
    $("#evalenddatepicker").datepicker({dateFormat: 'yy-mm-dd'});
    $("#trstartdatepicker").datepicker({dateFormat: 'yy-mm-dd'});
    $("#trenddatepicker").datepicker({dateFormat: 'yy-mm-dd'});

    function refreshDatePickers(dpSelector1,dpSelector2,dayVal) {
        $(dpSelector1).datepicker('setDate', dayVal);
        $(dpSelector2).datepicker('setDate', dayVal);
    }
    
    $("#empDetailDialog").dialog({ modal: true, autoOpen: false, height: 400, width: 600,
        open: function(){
            var date = new Date();
            var firstDay = new Date(date.getFullYear(), date.getMonth(), 1);
            var lastDay = new Date(date.getFullYear(), date.getMonth() + 1, 0);

            refreshDatePickers("#evalstartdatepicker","#trstartdatepicker",firstDay);
            refreshDatePickers("#evalenddatepicker","#trenddatepicker",lastDay);
        }, 
        title: "Employee details"});
});
</script>

<jsp:include page="dialog.jsp">
    <jsp:param value="${posList}" name="posList"/>
</jsp:include>
<jsp:include page="empDetail.jsp"/>

<div>
<table id="empTable" class="tablesorter tablesorter-blue"  cellspacing="1">
        <thead>
        <tr class="tablesorter-headerRow">
            <sec:authorize access="hasAnyRole('ROLE_TEST','ROLE_MANAGER')"><th name="crud" class="remove sorter-false tablesorter-header" data-column="0" width="45px"></th></sec:authorize>
            <th name="name" class="tablesorter-header" data-column="1"><div class="tablesorter-header-inner">Name</div></th>
            <th name="pos" class="tablesorter-header" data-column="2"><div class="tablesorter-header-inner">Position</div></th>
            <th name="dept" class="tablesorter-header" data-column="3"><div class="tablesorter-header-inner">Department</div></th>
            <th name="mah" class="tablesorter-header" data-column="4"><div class="tablesorter-header-inner">MAH</div></th>
        </tr>
    </thead>
<sec:authorize access="hasAnyRole('ROLE_TEST','ROLE_MANAGER')"><tfoot class="footer">
        <tr>
            <td>
                <div class="commit_icon" onclick="addEmployee(event);" title="Add"></div>
            </td>
            <td>
                <input type="text" name="newEmpName" id="newEmpName" class="tfield required text ui-widget-content ui-corner-all" />
            </td>
            <td>
                <jsp:include page="positions.jsp">
                    <jsp:param value="${posList}" name="posList"/>
                    <jsp:param name="id" value="pos"/>
                    <jsp:param name="class" value="required select ui-widget-content ui-corner-all"/>
                </jsp:include>
            </td>
            <td>
            </td>
            <td>
            </td>
        </tr>
    </tfoot></sec:authorize>
    <tbody>
    <c:forEach items="${empList}" var="emp" varStatus="status">
        <tr id="${emp.id}">
            <sec:authorize access="hasAnyRole('ROLE_TEST','ROLE_MANAGER')"><td>
                <div name="edit">
                    <div class="delete_icon" onclick="delEmployee(event);"></div>
                    <div class="edit_icon" onclick="preUpdateEmp(this);"></div>
                    <div class="commit_icon hidden" onclick="updEmployee(event);"></div>
                </div>
                <div class="icon_refresh hidden"></div>
            </td></sec:authorize>
            <td name="name" class="empName"><label name="name" class="fake-link" onclick="empDetailOpen(event);">${emp.name}</label></td>
            <td name="pos"><label name="pos">${emp.positions.name}</label></td>
            <td>${emp.positions.depts.name}</td>
            <td>${emp.mahResult}</td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<jsp:include page="pager.jsp">
    <jsp:param value="emp_pager" name="id"/>
</jsp:include>
</div>