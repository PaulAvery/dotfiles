var exec = require('child_process').exec;

exports.get = function *() {
	var res = yield exec.bind(null, 'herbstclient tag_status');

	return ' ' + res[0].split('\t').map(function(tag) {
		if(tag[0] === '.') return ' ◌ ';
		if(tag[0] === '#') return ' ● ';
		if(tag[0] === ':') return ' ○ ';
	}).join('') + ' ';
};

//Rerender on a tag change
exports.wait = function(b) {
	exec('herbstclient -w tag_changed', function() {
		exports.wait(b);
		b.renderCo();
	});
};
