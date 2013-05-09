<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script type="text/javascript">
$(function(){
    var pagerOptions = {
        page: 0,
        size: 20,
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
            widgets: ['zebra'],
            headers: { 0: {sorter: false},1: {sorter: false},2: {sorter: false},3: {sorter: false},4: {sorter: false},5: {sorter: false},
                6: {sorter: false},7: {sorter: false},8: {sorter: false},9: {sorter: false},10: {sorter: false}}
        })
        .tablesorterPager(pagerOptions);
});
</script>
<div id="importances">
<table id="impTable" class="tablesorter tablesorter-blue"  cellspacing="1">
        <thead>
        <tr class="tablesorter-headerRow">
            <th></th>
            <c:forEach items="${mList}" var="m" varStatus="stat">
                <th id="${m.id}">${m.name}</th>
            </c:forEach>
        </tr>
    </thead>
    <tbody>
    <c:forEach items="${mList}" var="m" varStatus="stat">
        <tr><td m1="${m.id}">${m.name}</td>
        <c:forEach items="${mList}" var="secM" varStatus="secStat">
            <td m1="${m.id}" m2="${secM.id}" <c:if test="${stat.index+1 gt secStat.index}">style="background-color: gray;"</c:if>>
                <label <c:if test="${stat.index lt secStat.index}">onclick="editVal(event);"</c:if>>${mimpList[stat.index * fn:length(mList) + secStat.index].importance}</label>
                <c:if test="${stat.index lt secStat.index}"><input type="text" style="width:20px;" class="hidden" onkeypress="processKey(event);" value="${mimpList[stat.index * fn:length(mList) + secStat.index].importance}"/></c:if>
            </td>
        </c:forEach>
        </tr>
    </c:forEach>
    </tbody>
</table>
<button id="calcMah" onclick="calcMahRes(event);">
Calculate MAH results
</button>
</div>