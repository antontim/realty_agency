<tr id="${quest.id}">
    <td>
        <div name="edit">
            <div class="delete_icon" onclick="delQuest(event);"></div>
            <div class="edit_icon" onclick="preUpdateQuest(this);"></div>
            <div class="commit_icon hidden" onclick="updQuest(event);"></div>
        </div>
        <div class="icon_refresh hidden"></div>
    </td>
    <td name="label"><label name="label">${quest.label}</label></td>
    <td name="text"><label name="text">${quest.text}</label></td>
    <td name="measure"><label name="measure">${quest.measures.name}</label></td>
</tr>