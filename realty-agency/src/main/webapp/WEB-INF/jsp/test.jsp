<tr id="${test.id}">
    <td>
        <div name="edit">
            <div class="delete_icon" onclick="delTest(event);"></div>
            <div class="edit_icon" onclick="preUpdateTest(this);"></div>
            <div class="commit_icon hidden" onclick="updTest(event);"></div>
        </div>
        <div class="icon_refresh hidden"></div>
    </td>
    <td name="name"><label name="name">${test.name}</label></td>
    <td name="type"><label name="type">${test.type}</label></td>
    <td name="measure"><label name="measure">${test.measures.name}</label></td>
</tr>