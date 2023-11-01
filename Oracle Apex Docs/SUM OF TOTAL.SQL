01. WRITE FUNCTION : 

// SELLING_AMT   
(function($) {

    function update(model) {
        var salKey = model.getFieldKey("TOTAL"),
            total = 0;

        model.forEach(function(record, index, id) {
            var sal = parseFloat(record[salKey]), 
                meta = model.getRecordMetadata(id);

            if (!isNaN(sal) && !meta.deleted && !meta.agg) {
                total += sal;
            }
        });

        $s("P9_SELLING_AMT", total);
    }

    $(function() {
       
        $("#IG-INVOICE").on("interactivegridviewmodelcreate", function(event, ui) {
            var sid,
                model = ui.model;

            if ( ui.viewId === "grid" ) {
                sid = model.subscribe( {
                    onChange: function(type, change) {
 
                        if ( type === "set" ) {
                             if (change.field === "TOTAL" ) {
                                update( model );
                            }
                        } else if (type !== "move" && type !== "metaChange") {
                          update( model );
                        }
                    },
                    progressView: $("#P9_SELLING_AMT") 
                } );
                 update( model );           
                model.fetchAll(function() {});
            }
        });

    });

})(apex.jQuery);


function calculateItemTotal() {
    var n_itemtotal;
        n_itemtotal = parseFloat($v("P9_SELLING_AMT"), 10) ? parseFloat($v("P9_SELLING_AMT"), 10) : 0;
    };



02. SELLING TOTAL: 

    ADVANCE -> CUSTOM ATTRIBUTES:

    onchange="calculateItemTotal();" onfocusout="this.value=Number(this.value).toFixed(2)"
    