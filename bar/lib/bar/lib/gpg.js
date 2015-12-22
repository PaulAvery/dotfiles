var fs = require('fs');

exports.get = function *() {
	return (yield new Promise(function(res, rej) {
		fs.stat('/home/florian/gpg/gpg.conf', e => res(!e));
	})) ? '!' : '?';
};
