<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<select id="${param.id}" name="${param.id}" class="${param.class}">
    <c:forEach items="${measureList}" var="measure">
        <option value="${measure.id}">${measure.name}</option>
    </c:forEach>
</select>