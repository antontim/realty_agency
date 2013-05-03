<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<select id="${param.id}" name="${param.id}" class="${param.class}">
    <c:forEach items="${questList}" var="quest">
        <option value="${quest.id}">${quest.label}</option>
    </c:forEach>
</select>