<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script type="text/javascript">
$(function(){
    var pagerOptions = {
        container: $("#testres_pager"),
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

    $("#testresTable")
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
<jsp:include page="pager.jsp">
    <jsp:param value="testres_pager" name="id"/>
</jsp:include>
<table id="testresTable" class="tablesorter tablesorter-blue"  cellspacing="1">
        <thead>
        <tr class="tablesorter-headerRow">
            <th name="crud" class="remove sorter-false tablesorter-header" data-column="0" width="45px"></th>
            <th name="name" class="tablesorter-header" data-column="1"><div class="tablesorter-header-inner">Test name</div></th>
            <th name="result" class="tablesorter-header" data-column="2" width="70px"><div class="tablesorter-header-inner">Result</div></th>
            <th name="passed" class="tablesorter-header" data-column="3" width="70px"><div class="tablesorter-header-inner">Passed</div></th>
        </tr>
    </thead>
    <tfoot class="footer">
        <tr>
            <td>
                <div class="commit_icon" onclick="addTestres(event);" title="Add"></div>
            </td>
            <td>
                <jsp:include page="testLabels.jsp">
                    <jsp:param value="${testList}" name="testList"/>
                    <jsp:param name="id" value="test"/>
                    <jsp:param name="class" value="required select ui-widget-content ui-corner-all"/>
                </jsp:include>
            </td>
            <td>
                <input type="text" name="result" id="result" class="tfield required text ui-widget-content ui-corner-all" />
            </td>
            <td>
            </td>
        </tr>
    </tfoot>
    <tbody>
    <c:forEach items="${testresList}" var="testres" varStatus="status">
        <tr id="${testres.id}">
            <td>
                <div name="edit">
                    <div class="delete_icon" onclick="delTestres(event);"></div>
                    <div class="edit_icon" onclick="preUpdateTestres(this);"></div>
                    <div class="commit_icon hidden" onclick="updTestres(event);"></div>
                </div>
                <div class="icon_refresh hidden"></div>
            </td>
            <td name="name" id="${testres.id.testId}"><label name="name">${testres.tests.name}</label></td>
            <td name="result"><label name="result">${testres.result}</label></td>
            <td name="passed" id="<fmt:formatDate pattern="yyyy-MM-dd" value="${testres.id.passed}"/>"><label name="passed"><fmt:formatDate pattern="yyyy-MM-dd" value="${testres.id.passed}"/></label></td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</div>
