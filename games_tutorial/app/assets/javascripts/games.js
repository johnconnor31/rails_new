require 'gon';
$(document).ready(ready);

function ready(){
	console.log('hellos');
	$(".panel.panel-default").click( function(){	
	console.log('clicked');
	window.location.replace( $(this).attr("data-target"));
	return false;
});
}