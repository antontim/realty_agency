<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<tr id="${param.act.id}">
    <td>${param.act.employees.name}</td>
    <td>city: ${act.entities.addrCity}, str: ${act.entities.addrStreet}, house: ${act.entities.addrHouse}, app: ${act.entities.addrAppartment}</td>
    <td>${param.act.activityTypes.name}</td>
    <td><fmt:formatDate value="${param.act.orderCreated}"/></td>
</tr>