<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script type="text/javascript">
$(function(){
    var pagerOptions = {
        updateArrows: true,
        page: 0,
        size: 10,
        fixedHeight: true,
        removeRows: false,
    };

    $("#actTable")
        .tablesorter({
            theme: 'blue',
            widthFixed: true,
            widgets: ['zebra']
        })
        .tablesorterPager(pagerOptions);
});
</script>
<div>
<table id="normTable" class="tablesorter tablesorter-blue"  cellspacing="1">
        <thead>
        <tr class="tablesorter-headerRow">
            <th name="crud" class="remove sorter-false tablesorter-header" data-column="0" width="35"></th>
            <th name="actType" class="remove sorter-false tablesorter-header" data-column="1"><div class="tablesorter-header-inner">Activity Type</div></th>
            <th name="val" class="remove sorter-false tablesorter-header" data-column="2" width="100"><div class="tablesorter-header-inner">Norm</div></th>
            <th name="changed" class="remove sorter-false tablesorter-header" data-column="3"><div class="tablesorter-header-inner">Changed</div></th>
        </tr>
    </thead>
    <tbody>
    <c:forEach items="${normList}" var="norm" varStatus="status">
        <tr id="${norm.id}">
            <td>
                <div name="edit">
                    <div class="edit_icon" onclick="preUpdateNorm(this);"></div>
                    <div class="delete_icon hidden"></div>
                    <div class="commit_icon hidden" onclick="updNorm(event);"></div>
                </div>
                <div class="icon_refresh hidden"></div>
            </td>
            <td>${norm.activityTypeName}</td>
            <td><label>${norm.norm}</label><input type="text" value="${norm.norm}" class="tfield hidden"/></td>
            <td><fmt:formatDate value="${norm.changed}"/></td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</div>
