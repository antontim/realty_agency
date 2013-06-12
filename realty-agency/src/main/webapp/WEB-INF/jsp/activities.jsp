<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script type="text/javascript">
$(function(){
    var pagerOptions = {
        container: $("#act_pager"),
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

    $("#actTable")
        .tablesorter({
            theme: 'blue',
            widthFixed: true,
            widgets: ['zebra']
        })
        .bind('pagerChange pagerComplete pagerInitialized pageMoved', function(e, c){})
        .tablesorterPager(pagerOptions);
});
</script>
<div>
<table id="actTable" class="tablesorter tablesorter-blue"  cellspacing="1">
        <thead>
        <tr class="tablesorter-headerRow">
            <th name="emp" class="tablesorter-header" data-column="0"><div class="tablesorter-header-inner">Employee</div></th>
            <th name="addr" class="tablesorter-header" data-column="1"><div class="tablesorter-header-inner">Address</div></th>
            <th name="act" class="tablesorter-header" data-column="2"><div class="tablesorter-header-inner">Activity</div></th>
            <th name="created" class="tablesorter-header" data-column="3"><div class="tablesorter-header-inner">Ordered</div></th>
        </tr>
    </thead>
    <tbody>
    <c:forEach items="${actList}" var="act" varStatus="status">
        <tr id="${act.id}">
            <td>${act.employees.name}</td>
            <td>${act.entities.addrCity}, ${act.entities.addrStreet}-${act.entities.addrHouse}, app. ${act.entities.addrAppartment}</td>
            <td>${act.activityTypes.name}</td>
            <td><fmt:formatDate value="${act.orderCreated}"/></td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<jsp:include page="pager.jsp">
    <jsp:param value="act_pager" name="id"/>
</jsp:include>
</div>
