
var ready = function() {
	if (window.location.href.indexOf('agents') > 0) {
		$('.ul-sidebar').find('li.item.active').removeClass('active')
		$(".ul-sidebar").find('li.item').eq(2).addClass('active');
	} else if (window.location.href.indexOf('users') > 0) {
		$('.ul-sidebar').find('li.item.active').removeClass('active')
		$(".ul-sidebar").find('li.item').eq(1).addClass('active');
	} else if (window.location.href.indexOf('listings') > 0) {
		$('.ul-sidebar').find('li.item.active').removeClass('active')
		$(".ul-sidebar").find('li.item').eq(3).addClass('active');
	}

	$('li.item').on('click', function() {
		switch ($(this).find('a')[0].text) {
			case 'Dashboard':
				window.location.href = "/";
				break;
			case 'Manage Users':
				window.location.href = "/users";
				break;
			case 'Manage Agents':
				window.location.href = "/agents";
				break;
			case 'Manage Listings':
				window.location.href = "/listings";
				break;
			default:
				window.location.href = "/";
				break;
		}
	});
};

$(document).ready(ready);
$(document).on('page:load', ready);