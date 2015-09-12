var date = require('dateformat');

exports.get = function *() {
	return date(new Date(), '  ⭧ ddd dS mmm, HH:MM  ');
};
