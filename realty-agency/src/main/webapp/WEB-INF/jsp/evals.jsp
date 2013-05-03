<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
$(function(){
    var pagerOptions = {
        container: $("#eval_pager"),
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

    $("#evalTable")
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
    <jsp:param value="eval_pager" name="id"/>
</jsp:include>
<table id="evalTable" class="tablesorter tablesorter-blue"  cellspacing="1">
        <thead>
        <tr class="tablesorter-headerRow">
            <th name="crud" class="remove sorter-false tablesorter-header" data-column="0"></th>
            <th name="quest" class="tablesorter-header" data-column="1"><div class="tablesorter-header-inner">Question</div></th>
            <th name="mark" class="tablesorter-header" data-column="2"><div class="tablesorter-header-inner">Mark</div></th>
            <th name="created" class="tablesorter-header" data-column="2"><div class="tablesorter-header-inner">Created</div></th>
        </tr>
    </thead>
    <tbody>
    <c:forEach items="${evalList}" var="eval" varStatus="status">
        <tr id="${eval.id}">
            <td>
                <div name="edit">
                    <div class="delete_icon" onclick="delEval(event);"></div>
                    <div class="edit_icon" onclick="preUpdateEval(this);"></div>
                    <div class="commit_icon hidden" onclick="updEval(event);"></div>
                </div>
                <div class="icon_refresh hidden"></div>
            </td>
            <td name="quest"><label name="quest">${eval.questions.label}</label></td>
            <td name="mark"><label name="mark">${eval.mark}</label></td>
            <td name="created"><label name="created">${eval.created}</label></td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</div>
<div class="footer">
    <fieldset>
        <label for="quest">Question</label><em>*</em> 
            <jsp:include page="questsLabels.jsp">
                <jsp:param value="${questList}" name="questList"/>
                <jsp:param name="id" value="quest"/>
                <jsp:param name="class" value="required select ui-widget-content ui-corner-all"/>
            </jsp:include>
        <label for="mark">Mark</label><em>*</em>
            <input type="text" name="mark" id="mark" class="required text ui-widget-content ui-corner-all" />
        <button id="addEvalButton" onclick="addEval();">Add</button>
    </fieldset>
</div>
