var bar = require('bar-provider')();
var battery = require('node-battery');
var date = require('dateformat');

function *getBattery() {
	return yield function(cb) {
		battery.percentages(function(data) {
			cb(null, data[0]);
		}, 0);
	};
}


bar
	.button('~/.config/herbstluftwm/dmenu', ' Apps')
	.center(function *() {
		return date(new Date(), 'dddd dS mmmm, HH:MM');
	})
	.right(function *(utils) {
		var per = yield getBattery();
		var color = per > 50 ? 'green' : per > 15 ? 'yellow' : 'red';

		return yield utils.color(color, per + ' ');
	})
	.interval(5000);
