<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<select id="${param.id}" name="${param.id}" class="${param.class}">
    <c:forEach items="${entTypes}" var="type">
        <option value="${type.id}">${type.name}</option>
    </c:forEach>
</select>