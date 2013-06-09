<div id="entitiesBody">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

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
        columns: { 4: { width : 10 }}
    };

    $("#entTable")
        .tablesorter({
            theme: 'blue',
            widthFixed: true,
            widgets: ['zebra']
        })
        .bind('pagerChange pagerComplete pagerInitialized pageMoved', function(e, c){})
        .tablesorterPager(pagerOptions);
    $("#orderDialog").dialog({ modal: true, autoOpen: false, height: 100, width: 230,
        title: "Order"});
});
</script>
<div id = "header">
    <input type="radio" name="activeRadio" id="activeRadio" onchange="showEnt('ALL');" value="ALL" <c:if test="${active == 'ALL'}">checked="checked"</c:if>>All</input>
    <input type="radio" name="activeRadio" id="activeRadio" onchange="showEnt('ACTIVE');" value="ACTIVE" <c:if test="${active == 'ACTIVE'}">checked="checked"</c:if>>Active</input>
    <input type="radio" name="activeRadio" id="activeRadio" onchange="showEnt('INACTIVE');" value="INACTIVE" <c:if test="${active == 'INACTIVE'}">checked="checked"</c:if>>Sold/rented</input>
</div>

<div>
<table id="entTable" class="tablesorter tablesorter-blue"  cellspacing="1">
        <thead>
        <tr class="tablesorter-headerRow">
            <th name="crud" class="remove sorter-false tablesorter-header" data-column="0" width="45px"></th>
            <th name="id" class="tablesorter-header" data-column="1" width="20px"><div class="tablesorter-header-inner">ID</div></th>
            <th name="addrCity" class="tablesorter-header" data-column="2" width="90px"><div class="tablesorter-header-inner">City</div></th>
            <th name="addrStreet" class="tablesorter-header" data-column="3" width="90px"><div class="tablesorter-header-inner">Street</div></th>
            <th name="addrHouse" class="tablesorter-header" data-column="4" width="20px"><div class="tablesorter-header-inner">H.</div></th>
            <th name="addrAppartment" class="tablesorter-header" data-column="5" width="20px"><div class="tablesorter-header-inner">A.</div></th>
            <th name="type" class="tablesorter-header" data-column="6"><div class="tablesorter-header-inner">Type</div></th>
            <th name="class" class="tablesorter-header" data-column="7"><div class="tablesorter-header-inner">Class</div></th>
            <th name="price" class="tablesorter-header" data-column="8" width="40px"><div class="tablesorter-header-inner">Price</div></th>
        </tr>
    </thead>
    <tfoot class="footer">
        <tr>
            <td>
                <div class="commit_icon" onclick="addEntity(event);" title="Add"></div>
            </td>
            <td></td>
            <td><input type="text" name="newAddrCity" id="newAddrCity" class="tfield required text ui-widget-content ui-corner-all" /></td>
            <td><input type="text" name="newAddrStreet" id="newAddrStreet" class="tfield required text ui-widget-content ui-corner-all" /></td>
            <td><input type="text" name="newAddrHouse" id="newAddrHouse" class="tfield required text ui-widget-content ui-corner-all" /></td>
            <td><input type="text" name="newAddrAppartment" id="newAddrAppartment" class="tfield required text ui-widget-content ui-corner-all" /></td>
            <td>
                <jsp:include page="entTypes.jsp">
                    <jsp:param value="${entTypes}" name="posList"/>
                    <jsp:param name="id" value="enttype"/>
                    <jsp:param name="class" value="tfield required select ui-widget-content ui-corner-all"/>
                </jsp:include>
            </td>
            <td>
                <jsp:include page="entClasses.jsp">
                    <jsp:param value="${entClasses}" name="posList"/>
                    <jsp:param name="id" value="entclass"/>
                    <jsp:param name="class" value="tfield required select ui-widget-content ui-corner-all"/>
                </jsp:include>
            </td>
            <td>
                <input type="text" name="price" id="price" class="tfield required text ui-widget-content ui-corner-all" />
            </td>
        </tr>
    </tfoot>
    <tbody>
    <c:forEach items="${entList}" var="ent" varStatus="status">
        <tr id="${ent.id}">
            <td>
                <div name="edit">
                    <c:choose>
                        <c:when test="${ent.active == 0}">
                            <div class="icons revert" onclick="activateEntity(event,'${active}');"></div>
                        </c:when>
                        <c:otherwise>
                            <div class="delete_icon" onclick="delEntity(event);"></div>
                            <div class="edit_icon" onclick="preUpdateEnt(this);"></div>
                            <div class="commit_icon hidden" onclick="updEntity(event);"></div>
                        </c:otherwise>
                    </c:choose>
                </div>
                <div class="icon_refresh hidden"></div>
            </td>
            <td name="id" <c:if test="${ent.active == 1}"> class="fake-link" onclick="order(event);"</c:if>><label name="id">${ent.id}</label></td>
            <td name="addrCity"><label name="addrCity">${ent.addrCity}</label></td>
            <td name="addrStreet"><label name="addrStreet">${ent.addrStreet}</label></td>
            <td name="addrHouse"><label name="addrHouse">${ent.addrHouse}</label></td>
            <td name="addrAppartment"><label name="addrAppartment">${ent.addrAppartment}</label></td>
            <td name="enttype"><label name="enttype">${ent.entityTypes.name}</label></td>
            <td name="entclass"><label name="entclass">${ent.entityClass.name}</label></td>
            <td name="price"><label name="price">${ent.entityPriceses[0].price}</label></td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<jsp:include page="pager.jsp">
    <jsp:param value="ent_pager" name="id"/>
</jsp:include>
</div>

<div id="orderDialog">
    <input type="hidden" id="entId"/>
    <select id="actTypes" class="required text ui-widget-content ui-corner-all">
        <sec:authorize access="hasAnyRole('ROLE_TEST','ROLE_MANAGER','ROLE_SALESMAN')"><option value="1">Sale</option></sec:authorize>
        <sec:authorize access="hasAnyRole('ROLE_TEST','ROLE_MANAGER','ROLE_RENTER')"><option value="2">Rent</option></sec:authorize>
    </select>
    <div style="display:inline;">
        <button onclick="createOrder();">Create order</button>
    </div>
</div>
</div>