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

<jsp:include page="dialog.jsp"></jsp:include>

<div>
<table id = "empTable" class = "dataTable">
    <thead>
        <tr>
            <td>Name</td>
            <td>Position</td>
            <td>Department</td>
        </tr>
    </thead>
    <c:forEach items="${param.empList}" var="emp">
        <tr>
            <td>${emp.name}</td>
            <td>${emp.positions.name}</td>
            <td>${emp.depts.name}</td>
        </tr>
    </c:forEach>
</table>
</div>

<div class="footer">
    <button id="addEmpButton">Add</button>
    <button id="delEmpButton">Remove</button>
</div>