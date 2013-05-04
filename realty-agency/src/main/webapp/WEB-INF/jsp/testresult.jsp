<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<tr id="${testres.id}">
    <td>
        <div name="edit">
            <div class="delete_icon" onclick="delTestres(event);"></div>
            <div class="edit_icon" onclick="preUpdateTestres(this);"></div>
            <div class="commit_icon hidden" onclick="updTestres(event);"></div>
        </div>
        <div class="icon_refresh hidden"></div>
    </td>
    <td name="name" id="${testres.id.testId}"><label name="name">${testres.tests.name}</label></td>
    <td name="result"><label name="result">${testres.result}</label></td>
    <td name="passed" id="<fmt:formatDate pattern="yyyy-MM-dd" value="${testres.id.passed}"/>"><label name="passed">${testres.id.passed}</label></td>
</tr>