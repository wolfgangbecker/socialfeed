// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

(function(){

	$(document).ready(function(){
		$('.js-entries')
		.on('ajax:success', '.js-entry', function(e, data){
			if(data.read){
				$(this).addClass('read');
				$(this).find('.js-read-link').text('Read');
				$(this).find('.js-read-link').attr('href', $(this).find('.js-read-link').attr('href').replace('read%5D=true', 'read%5D=false'));
			}
			else{
				$(this).removeClass('read');
				$(this).find('.js-read-link').text('Unread');
				$(this).find('.js-read-link').attr('href', $(this).find('.js-read-link').attr('href').replace('read%5D=false', 'read%5D=true'));
			}
			data.favorite ? $(this).find('.icon').addClass('read') : $(this).find('.icon').removeClass('read');
		})
		.on('ajax:error', '.js-entry', function(e, data){
		});
	});

})();