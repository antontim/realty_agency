<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    
    $("#empDetailDialog").dialog({ modal: true, autoOpen: false, height: 400, width: 600,
        open: empDetailLoad});
});
</script>

<jsp:include page="dialog.jsp">
    <jsp:param value="${posList}" name="posList"/>
</jsp:include>
<jsp:include page="empDetail.jsp"/>

<div>
<jsp:include page="pager.jsp">
    <jsp:param value="emp_pager" name="id"/>
</jsp:include>
<table id="empTable" class="tablesorter tablesorter-blue"  cellspacing="1">
        <thead>
        <tr class="tablesorter-headerRow">
            <th name="crud" class="remove sorter-false tablesorter-header" data-column="0"></th>
            <th name="name" class="tablesorter-header" data-column="1"><div class="tablesorter-header-inner">Name</div></th>
            <th name="pos" class="tablesorter-header" data-column="2"><div class="tablesorter-header-inner">Position</div></th>
            <th name="dept" class="tablesorter-header" data-column="3"><div class="tablesorter-header-inner">Department</div></th>
        </tr>
    </thead>
    <tbody>
    <c:forEach items="${empList}" var="emp" varStatus="status">
        <tr id="${emp.id}">
            <td>
                <div name="edit">
                    <div class="delete_icon" onclick="delEmployee(event);"></div>
                    <div class="edit_icon" onclick="preUpdateEmp(this);"></div>
                    <div class="commit_icon hidden" onclick="updEmployee(event);"></div>
                </div>
                <div class="icon_refresh hidden"></div>
            </td>
            <td name="name" class="empName"><label name="name" class="fake-link" onclick="empDetailOpen(event);">${emp.name}</label></td>
            <td name="pos"><label name="pos">${emp.positions.name}</label></td>
            <td>${emp.positions.depts.name}</td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</div>

<div class="footer">
        <fieldset>
            <label for="newEmpName">Name</label><em>*</em>
                <input type="text" name="newEmpName" id="newEmpName" class="required text ui-widget-content ui-corner-all" />
            <label for="pos">Position</label><em>*</em> 
                <jsp:include page="positions.jsp">
                    <jsp:param value="${posList}" name="posList"/>
                    <jsp:param name="id" value="pos"/>
                    <jsp:param name="class" value="required select ui-widget-content ui-corner-all"/>
                </jsp:include>
                <button id="addEmpButton" onclick="addEmployee();">Add</button>
        </fieldset>
    
</div>