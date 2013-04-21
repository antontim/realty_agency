<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
$(document).ready(function(){
    $('#empTable').dataTable();

    $("#addEmpButton").button().click(function() {
        $("#dialog-form").dialog("open");
    });
    $("#delEmpButton").button();
});

</script>

<jsp:include page="dialog.jsp">
    <jsp:param value="${posList}" name="posList"/>
</jsp:include>

<div>
<table id = "empTable" class = "dataTable">
    <thead>
        <tr>
            <td class="sorting_disabled"></td>
            <td class="hidden">id</td>
            <td>Name</td>
            <td>Position</td>
            <td>Department</td>
        </tr>
    </thead>
    <c:forEach items="${empList}" var="emp" varStatus="status">
        <tr id="emp_${emp.id}" ind="${status.index}">
            <td><div class="delete_icon" onclick="delEmployee(${emp.id});"></div><div class="edit_icon"></div></td>
            <td class="hidden">${emp.id}</td>
            <td>${emp.name}</td>
            <td>${emp.positions.name}</td>
            <td>${emp.positions.depts.name}</td>
        </tr>
    </c:forEach>
</table>
</div>

<div class="footer">
    <button id="addEmpButton">Add</button>
</div>