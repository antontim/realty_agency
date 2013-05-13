<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
$(function(){
    var pagerOptions = {
        container: $("#rate_pager"),
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

    $("#rateTable")
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
<table id="rateTable" class="tablesorter tablesorter-blue"  cellspacing="1">
        <thead>
        <tr class="tablesorter-headerRow">
            <th name="measure" class="tablesorter-header" data-column="1"><div class="tablesorter-header-inner">Measure</div></th>
            <th name="rate" class="tablesorter-header" data-column="2" width="45px"><div class="tablesorter-header-inner">Rate</div></th>
            <th name="created" class="tablesorter-header" data-column="3" width="100px"><div class="tablesorter-header-inner">Created</div></th>
        </tr>
    </thead>
    <tbody>
    <c:forEach items="${rateList}" var="rate" varStatus="status">
        <tr id="${rate.id}">
            <td name="measure"><label name="measure">${rate.name}</label></td>
            <td name="rate"><label name="rate"><c:choose><c:when test="${not empty rate.rateses}"><c:out value="${rate.rateses[0].value}"/></c:when><c:otherwise>0.0</c:otherwise></c:choose></label></td>
            <td name="created"><label name="created"><c:choose><c:when test="${not empty rate.rateses}"><c:out value="${rate.rateses[0].id.created}"/></c:when><c:otherwise>not created</c:otherwise></c:choose></label></td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<jsp:include page="pager.jsp">
    <jsp:param value="rate_pager" name="id"/>
</jsp:include>
</div>