<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
$(function(){
    var pagerOptions = {
        container: $("#quest_pager"),
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

    $("#questTable")
        .tablesorter({
            theme: 'blue',
            widthFixed: true,
            widgets: ['zebra']
        })
        .bind('pagerChange pagerComplete pagerInitialized pageMoved', function(e, c){})
        .tablesorterPager(pagerOptions);
});
</script>

<jsp:include page="dialog.jsp">
    <jsp:param value="${posList}" name="posList"/>
</jsp:include>

<div>
<table id="questTable" class="tablesorter tablesorter-blue"  cellspacing="1">
        <thead>
        <tr class="tablesorter-headerRow">
            <th name="crud" class="remove sorter-false tablesorter-header" data-column="0" width="45px"></th>
            <th name="label" class="tablesorter-header" data-column="1"><div class="tablesorter-header-inner">Label</div></th>
            <th name="text" class="tablesorter-header" data-column="2"><div class="tablesorter-header-inner">Text</div></th>
            <th name="measure" class="tablesorter-header" data-column="3" width="70px"><div class="tablesorter-header-inner">Measure</div></th>
        </tr>
    </thead>
    <tfoot class="footer">
        <tr>
            <td>
                <div class="commit_icon" onclick="addQuest(event);" title="Add"></div>
            </td>
            <td>
                <input type="text" name="newQuestLabel" id="newQuestLabel" class="tfield required text ui-widget-content ui-corner-all" />
            </td>
            <td>
                <input type="text" name="newQuestText" id="newQuestText" class="tfield required text ui-widget-content ui-corner-all" />
            </td>
            <td>
                <jsp:include page="measures.jsp">
                    <jsp:param value="${measureList}" name="measureList"/>
                    <jsp:param name="id" value="measure"/>
                    <jsp:param name="class" value="tfield required select ui-widget-content ui-corner-all"/>
                </jsp:include>
            </td>
        </tr>
    </tfoot>
    <tbody>
    <c:forEach items="${questList}" var="quest" varStatus="status">
        <tr id="${quest.id}">
            <td>
                <div name="edit">
                    <div class="delete_icon" onclick="delQuest(event);"></div>
                    <div class="edit_icon" onclick="preUpdateQuest(this);"></div>
                    <div class="commit_icon hidden" onclick="updQuest(event);"></div>
                </div>
                <div class="icon_refresh hidden"></div>
            </td>
            <td name="label"><label name="label">${quest.label}</label></td>
            <td name="text"><label name="text">${quest.text}</label></td>
            <td name="measure"><label name="measure">${quest.measures.name}</label></td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<jsp:include page="pager.jsp">
    <jsp:param value="quest_pager" name="id"/>
</jsp:include>
</div>