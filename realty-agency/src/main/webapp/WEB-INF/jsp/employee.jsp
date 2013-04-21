<tr id="emp_${emp.id}">
    <td><div class="delete_icon" onclick="delEmployee(${emp.id});"></div><div class="edit_icon"></div></td>
    <td class="hidden">${emp.id}</td>
    <td>${emp.name}</td>
    <td>${emp.positions.name}</td>
    <td>${emp.positions.depts.name}</td>
</tr>