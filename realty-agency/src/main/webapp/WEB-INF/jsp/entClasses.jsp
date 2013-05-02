<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<select id="${param.id}" name="${param.id}" class="${param.class}">
    <c:forEach items="${entClasses}" var="clazz">
        <option value="${clazz.id}">${clazz.name}</option>
    </c:forEach>
</select>