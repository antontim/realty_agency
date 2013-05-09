<tr id="${emp.id}">
    <td>
        <div name="edit">
            <div class="delete_icon" onclick="delEmployee(event);"></div>
            <div class="edit_icon" onclick="preUpdateEmp(this);"></div>
            <div class="commit_icon hidden" onclick="updEmployee(event);"></div>
        </div>
        <div class="icon_refresh hidden"></div>
    </td>
    <td name="name" class="empName"><label name="name" class="fake-link" onclick="empDetailOpen(event);">${emp.name}</label></td>
    <td name="pos"><label name="pos">${emp.positions.name}</label></td>
    <td>${emp.positions.depts.name}</td>
    <td>${emp.mahResult}</td>
</tr>