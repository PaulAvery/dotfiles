var battery = require('node-battery');

exports.get = function *() {
	return yield function(cb) {
		battery.percentages(function(data) {
			var icon;

			if(data[0] > 15) icon = '⭪';
			if(data[0] > 40) icon = '⭫';
			if(data[0] > 65) icon = '⭨';
			if(data[0] <= 15) icon = '⭩';

			cb(null, typeof data[0] === 'number' ? ' ' + icon + ' ' + data[0] + ' ' : '');
		}, 0);
	};
};
