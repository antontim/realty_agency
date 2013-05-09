<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<tr id="${ent.id}">
    <td>
        <div name="edit">
            <div class="delete_icon" onclick="delEntity(event);"></div>
            <div class="edit_icon" onclick="preUpdateEnt(this);"></div>
            <div class="commit_icon hidden" onclick="updEntity(event);"></div>
        </div>
        <div class="icon_refresh hidden"></div>
    </td>
    <td name="addr"><label name="addr" <c:if test="${ent.active == 1}"> class="fake-link" onclick="order(event);"</c:if>>${ent.address}</label></td>
    <td name="enttype"><label name="enttype">${ent.entityTypes.name}</label></td>
    <td name="entclass"><label name="entclass">${ent.entityClass.name}</label></td>
    <td name="price"><label name="price">${ent.entityPriceses[0].price}</label></td>
</tr>