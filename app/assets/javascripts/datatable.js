// Note, pagination is done client side, to modify this to work server side refer
// to this asciicast: http://railscasts.com/episodes/340-datatables?view=asciicast
//
// Here's the doc on row grouping: 
//   http://www.datatables.net/examples/advanced_init/row_grouping.html
//
//= require dataTables/jquery.dataTables


$(function() {
    var dataEnhancedTable;
    var pipelineTable;

    //var sdom = isPrinting() ? 'lr<"giveHeight"t>i' : 'lfr<"giveHeight"t>ip'
    var sdom = isPrinting() ? '<"H"lr>t<"F"i>' : '<"H"lfr>t<"F"ip>' ;


    dataEnhancedTable = $('#data-enhanced').dataTable({
        bJQueryUI: true,
        bStateSave: true,
        sPaginationType: "full_numbers",
        "sDom": sdom
    });

    pipelineTable = $('#pipeline-table').dataTable({
        bPaginate: !isPrinting(),
        bSearch: !isPrinting(),
        bJQueryUI: true,
        bStateSave: true,
        sPaginationType: "full_numbers",
        "fnDrawCallback": function ( oSettings ) {
            if ( oSettings.aiDisplay.length == 0 ) {
                return;
            }
            var nTrs = $('tbody tr', oSettings.nTable);
            var iColspan = nTrs[0].getElementsByTagName('td').length;
            var sLastGroup = "";
            for ( var i=0 ; i<nTrs.length ; i++ ) {
                var iDisplayIndex = oSettings._iDisplayStart + i;
                var sGroup = oSettings.aoData[ oSettings.aiDisplay[iDisplayIndex] ]._aData[0];
                if ( sGroup != sLastGroup ) {
                    var nGroup = document.createElement( 'tr' );
                    var nCell = document.createElement( 'td' );
                    nCell.colSpan = iColspan;
                    nCell.className = "group";
                    nCell.innerHTML = sGroup;
                    nGroup.appendChild( nCell );
                    nTrs[i].parentNode.insertBefore( nGroup, nTrs[i] );
                    sLastGroup = sGroup;
                }
            }
        },
        "aoColumnDefs": [
            { "bVisible": false, "aTargets": [ 0 ] }
        ],
        "aaSortingFixed": [[ 0, 'asc' ]],
        "aaSorting": [[ 1, 'asc' ]],
        "sDom": sdom
    });


    $('<span class="button"><a id="filter_all" href="#">Clear</a></span>').insertAfter('#data-enhanced_filter input');

    $('<span class="button"><a id="filter_all" href="#">Clear</a></span>').insertAfter('#pipeline-table_filter input');

    $('#filter_all').click( function() {
        if (dataEnhancedTable.length > 0) {
            $('#data-enhanced_filter input').val('')
            dataEnhancedTable.fnFilter( '' );
        }
        if (pipelineTable.length > 0) {
            $('#pipeline-table_filter input').val('')
            pipelineTable.fnFilter( '' );
        }
    } );



});
