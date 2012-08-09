$(function(){

	$('.mws-datatable-fn').dataTable({
		"aaSorting": [[1, "desc"]],
		"iDisplayLength": 25
	});

	$('.mws-datatable-fn2').dataTable({
		"aaSorting": [[2, "asc"], [4, "asc"]],
		"iDisplayLength": 50
	});

	/* Validation Plugin */
	
	$("#mws-validate").validate({
		invalidHandler: function(form, validator) {
			var errors = validator.numberOfInvalids();
			if (errors) {
				var message = errors == 1
				? 'You missed 1 field. It has been highlighted'
				: 'You missed ' + errors + ' fields. They have been highlighted';
				$("#mws-validate-error").html(message).show();
			} else {
				$("#mws-validate-error").hide();
      		}
		}
	});

	/* File Input Styling */
	
	if($.fn.filestyle) {
		$("input[type='file']").filestyle({
			imagewidth: 78, 
			imageHeight: 28
		});
		$("input.file").attr("readonly", true);
	}

});