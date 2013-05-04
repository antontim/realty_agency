<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<select id="${param.id}" name="${param.id}" class="${param.class}">
    <c:forEach items="${testList}" var="test">
        <option value="${test.id}">${test.name}</option>
    </c:forEach>
</select>