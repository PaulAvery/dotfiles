var date = require('dateformat');

exports.get = function *() {
	return date(new Date(), ' dd-mm-yyyy HH:MM ');
};
