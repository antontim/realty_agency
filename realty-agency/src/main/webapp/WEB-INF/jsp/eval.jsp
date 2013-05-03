<tr id="${eval.id}">
    <td>
        <div name="edit">
            <div class="delete_icon" onclick="delEval(event);"></div>
            <div class="edit_icon" onclick="preUpdateEval(this);"></div>
            <div class="commit_icon hidden" onclick="updEval(event);"></div>
        </div>
        <div class="icon_refresh hidden"></div>
    </td>
    <td name="quest"><label name="quest">${eval.questions.label}</label></td>
    <td name="mark"><label name="mark">${eval.mark}</label></td>
    <td name="created"><label name="created">${eval.created}</label></td>
</tr>