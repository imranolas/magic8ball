$(document).ready( function() {
	$(".submit").on('click', function(e) {
		e.preventDefault();
		$.ajax('/', { 
			method:'post',
			success: function(result){ 
				$('.question span').html(result.ask);
				$('.answer span').html('"' + result.answer + '"').removeClass().addClass(result.name);
				$('p').show(); 
				},
				data: { ask: $('.ask').val() },
				dataType: 'json'
				})
		});
	});