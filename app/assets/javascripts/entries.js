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
			if(data.favorite){ 
				$(this).find('.js-favorite-link').attr('href', $(this).find('.js-favorite-link').attr('href').replace('favorite%5D=true', 'favorite%5D=false'));
				$(this).find('.icon').addClass('favorited');
			}
			else{
				$(this).find('.js-favorite-link').attr('href', $(this).find('.js-favorite-link').attr('href').replace('favorite%5D=false', 'favorite%5D=true'));
				$(this).find('.icon').removeClass('favorited');
			}
		})
		.on('ajax:error', '.js-entry', function(e, data){
		});
	});

})();