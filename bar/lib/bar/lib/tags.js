'use strict';

var exec = require('child_process').exec;
var colors = require('./colors');

exports.get = function *(util) {
	let res = yield exec.bind(null, 'herbstclient tag_status');

	let reg = /[\S]/;
	let tags = res[0].split('\t').filter(s => reg.test(s));

	return (yield tags.map(tag => util.color(tag[0] === '#' ? colors[7] : colors[0], ' ' + tag.substr(1) + ' '))).join('') + ' ';
};

//Rerender on a tag change
exports.wait = function(b) {
	exec('herbstclient -w tag_changed', function() {
		exports.wait(b);
		b.renderCo();
	});
};
