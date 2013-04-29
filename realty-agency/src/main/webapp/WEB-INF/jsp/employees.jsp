<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
$(function(){

    // **********************************
    //  Description of ALL pager options
    // **********************************
    var pagerOptions = {

        // target the pager markup - see the HTML block below
        container: $(".pager"),

        // use this url format "http:/mydatabase.com?page={page}&size={size}&{sortList:col}"
        ajaxUrl: null,

        // modify the url after all processing has been applied
        customAjaxUrl: function(table, url) { return url; },

        // process ajax so that the data object is returned along with the total number of rows
        // example: { "data" : [{ "ID": 1, "Name": "Foo", "Last": "Bar" }], "total_rows" : 100 }
        ajaxProcessing: function(ajax){
            if (ajax && ajax.hasOwnProperty('data')) {
                // return [ "data", "total_rows" ];
                return [ ajax.total_rows, ajax.data ];
            }
        },

        // output string - default is '{page}/{totalPages}'
        // possible variables: {page}, {totalPages}, {filteredPages}, {startRow}, {endRow}, {filteredRows} and {totalRows}
        output: '{startRow} to {endRow} ({totalRows})',

        // apply disabled classname to the pager arrows when the rows at either extreme is visible - default is true
        updateArrows: true,

        // starting page of the pager (zero based index)
        page: 0,

        // Number of visible rows - default is 10
        size: 10,

        // if true, the table will remain the same height no matter how many records are displayed. The space is made up by an empty
        // table row set to a height to compensate; default is false
        fixedHeight: true,

        // remove rows from the table to speed up the sort of large tables.
        // setting this to false, only hides the non-visible rows; needed if you plan to add/remove rows with the pager enabled.
        removeRows: false,

        // css class names of pager arrows
        cssNext: '.next', // next page arrow
        cssPrev: '.prev', // previous page arrow
        cssFirst: '.first', // go to first page arrow
        cssLast: '.last', // go to last page arrow
        cssGoto: '.gotoPage', // select dropdown to allow choosing a page

        cssPageDisplay: '.pagedisplay', // location of where the "output" is displayed
        cssPageSize: '.pagesize', // page size selector - select dropdown that sets the "size" option

        // class added to arrows when at the extremes (i.e. prev/first arrows are "disabled" when on the first page)
        cssDisabled: 'disabled' // Note there is no period "." in front of this class name

    };

    $("table")

        // Initialize tablesorter
        // ***********************
        .tablesorter({
            theme: 'blue',
            widthFixed: true,
            widgets: ['zebra']
        })

        // bind to pager events
        // *********************
        .bind('pagerChange pagerComplete pagerInitialized pageMoved', function(e, c){
        })
        

        // initialize the pager plugin
        // ****************************
        .tablesorterPager(pagerOptions)

        ;

        // Add two new rows using the "addRows" method
        // the "update" method doesn't work here because not all rows are
        // present in the table when the pager is applied ("removeRows" is false)
        // ***********************************************************************
        // Delete a row
        // *************
        $('table').delegate('button.remove', 'click' ,function(){
            
        });

        // Destroy pager / Restore pager
        // **************
        $('button:contains(Destroy)').click(function(){
            // Exterminate, annhilate, destroy! http://www.youtube.com/watch?v=LOqn8FxuyFs
            var $t = $(this);
            if (/Destroy/.test( $t.text() )){
                $('table').trigger('destroy.pager');
                $t.text('Restore Pager');
            } else {
                $('table').tablesorterPager(pagerOptions);
                $t.text('Destroy Pager');
            }
        });
});

</script>

<jsp:include page="dialog.jsp">
    <jsp:param value="${posList}" name="posList"/>
</jsp:include>

<div>
<div id="pager" class="pager tablesorter-pager">
  <form>
    <img src="css/images/first.png" class="first"/>
    <img src="css/images/prev.png" class="prev"/>
    <span class="pagedisplay">m</span> <!-- this can be any element, including an input -->
    <img src="css/images/next.png" class="next"/>
    <img src="css/images/last.png" class="last"/>
    <select class="pagesize">
      <option selected="selected" value="10">10</option>
      <option value="20">20</option>
      <option value="30">30</option>
      <option value="40">40</option>
    </select>
    <select class="gotoPage" title="Select page number">
    </select>
        </form>
  </div>
<table id="empTable" class="tablesorter tablesorter-blue"  cellspacing="1">
        <thead>
        <tr class="tablesorter-headerRow">
            <th name="crud" class="remove sorter-false tablesorter-header" data-column="0"></th>
            <th name="name" class="tablesorter-header" data-column="1"><div class="tablesorter-header-inner">Name</div></th>
            <th name="pos" class="tablesorter-header" data-column="2"><div class="tablesorter-header-inner">Position</div></th>
            <th name="dept" class="tablesorter-header" data-column="3"><div class="tablesorter-header-inner">Department</div></th>
        </tr>
    </thead>
    <tbody>
    <c:forEach items="${empList}" var="emp" varStatus="status">
        <tr id="${emp.id}">
            <td>
                <div name="edit">
                    <div class="delete_icon" onclick="delEmployee(event);"></div>
                    <div class="edit_icon" onclick="preUpdateEmp(this);"></div>
                    <div class="commit_icon hidden" onclick="updEmployee(event);"></div>
                </div>
                <div class="icon_refresh hidden"></div>
            </td>
            <td name="name"><label name="name">${emp.name}</label></td>
            <td name="pos"><label name="pos">${emp.positions.name}</label></td>
            <td>${emp.positions.depts.name}</td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</div>

<div class="footer">
        <fieldset>
            <label for="newEmpName">Name</label><em>*</em>
                <input type="text" name="newEmpName" id="newEmpName" class="required text ui-widget-content ui-corner-all" />
            <label for="pos">Position</label><em>*</em> 
                <jsp:include page="positions.jsp">
                    <jsp:param value="${posList}" name="posList"/>
                    <jsp:param name="id" value="pos"/>
                    <jsp:param name="class" value="required select ui-widget-content ui-corner-all"/>
                </jsp:include>
                <button id="addEmpButton" onclick="addEmployee();">Add</button>
        </fieldset>
    
</div>