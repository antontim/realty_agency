<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
            <td name="id"><label name="id"<c:if test="${ent.active == 1}"> class="fake-link" onclick="order(event);"</c:if>>${ent.id}</label></td>
            <td name="addrCity"><label name="addrCity">${ent.addrCity}</label></td>
            <td name="addrStreet"><label name="addrStreet">${ent.addrStreet}</label></td>
            <td name="addrHouse"><label name="addrHouse">${ent.addrHouse}</label></td>
            <td name="addrAppartment"><label name="addrAppartment">${ent.addrAppartment}</label></td>
            <td name="enttype"><label name="enttype">${ent.entityTypes.name}</label></td>
            <td name="entclass"><label name="entclass">${ent.entityClass.name}</label></td>
            <td name="price"><label name="price">${ent.entityPriceses[0].price}</label></td>
        </tr>