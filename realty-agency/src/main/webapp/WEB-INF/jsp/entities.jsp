<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script type="text/javascript">
$(function(){
    var pagerOptions = {
        container: $("#ent_pager"),
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

    $("#entTable")
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
    <jsp:param value="ent_pager" name="id"/>
</jsp:include>
<table id="entTable" class="tablesorter tablesorter-blue"  cellspacing="1">
        <thead>
        <tr class="tablesorter-headerRow">
            <th name="crud" class="remove sorter-false tablesorter-header" data-column="0"></th>
            <th name="addr" class="tablesorter-header" data-column="1"><div class="tablesorter-header-inner">Address</div></th>
            <th name="type" class="tablesorter-header" data-column="2"><div class="tablesorter-header-inner">Type</div></th>
            <th name="class" class="tablesorter-header" data-column="3"><div class="tablesorter-header-inner">Class</div></th>
            <th name="price" class="tablesorter-header" data-column="4"><div class="tablesorter-header-inner">Price</div></th>
        </tr>
    </thead>
    <tbody>
    <c:forEach items="${entList}" var="ent" varStatus="status">
        <tr id="${ent.id}">
            <td>
                <div name="edit">
                    <div class="delete_icon" onclick="delEntity(event);"></div>
                    <div class="edit_icon" onclick="preUpdateEnt(this);"></div>
                    <div class="commit_icon hidden" onclick="updEntity(event);"></div>
                </div>
                <div class="icon_refresh hidden"></div>
            </td>
            <td name="addr"><label name="addr">${ent.address}</label></td>
            <td name="enttype"><label name="enttype">${ent.entityTypes.name}</label></td>
            <td name="entclass"><label name="entclass">${ent.entityClass.name}</label></td>
            <td name="price"><label name="price">${ent.entityPriceses[0].price}</label></td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</div>

<div class="footer">
    <fieldset>
        <label for="newAddr">Address</label><em>*</em>
            <input type="text" name="newAddr" id="newAddr" class="required text ui-widget-content ui-corner-all" />
        <label for="enttype">Type</label><em>*</em> 
            <jsp:include page="entTypes.jsp">
                <jsp:param value="${entTypes}" name="posList"/>
                <jsp:param name="id" value="enttype"/>
                <jsp:param name="class" value="required select ui-widget-content ui-corner-all"/>
            </jsp:include>
        <label for="entclass">Class</label><em>*</em> 
            <jsp:include page="entClasses.jsp">
                <jsp:param value="${entClasses}" name="posList"/>
                <jsp:param name="id" value="entclass"/>
                <jsp:param name="class" value="required select ui-widget-content ui-corner-all"/>
            </jsp:include>
        <label for="price">Price</label><em>*</em>
                <input type="text" name="price" id="price" class="required text ui-widget-content ui-corner-all" />
            <button id="addEntButton" onclick="addEntity();">Add</button>
    </fieldset>
</div>