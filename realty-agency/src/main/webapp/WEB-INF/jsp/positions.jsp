<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<select id="${param.id}" name="${param.id}" class="${param.class} tfield">
    <c:forEach items="${posList}" var="pos">
        <option value="${pos.id}">${pos.name}</option>
    </c:forEach>
</select>