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
<table id="deptTable" class="tablesorter tablesorter-blue"  cellspacing="1">
        <thead>
        <tr class="tablesorter-headerRow">
            <th name="id" class="remove sorter-false tablesorter-header" data-column="1" width="20"><div class="tablesorter-header-inner">ID</div></th>
            <th name="dept" class="remove sorter-false tablesorter-header" data-column="2"><div class="tablesorter-header-inner">Dept</div></th>
            <th name="mah" class="remove sorter-false tablesorter-header" data-column="3" width="80"><div class="tablesorter-header-inner">MAH result</div></th>
        </tr>
    </thead>
    <tbody>
    <c:forEach items="${deptList}" var="dept" varStatus="status">
        <tr id="${dept.id}">
            <td>${dept.id}</td>
            <td>${dept.name}</td>
            <td>${dept.mahResult}</td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</div>
