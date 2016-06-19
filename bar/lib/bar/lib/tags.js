'use strict';

var exec = require('child_process').exec;
var colors = require('./colors');

exports.get = function *(util) {
	try {
		let res = yield exec.bind(null, 'herbstclient tag_status');

		let reg = /[\S]/;
		let tags = res[0].split('\t').filter(s => reg.test(s));

		return (yield tags.map(tag => {
			let selected = tag[0] === '#';

			let text = selected ? ' ● ' : ' ○ ';
			let color = selected ? colors[7] : colors[0];

			return util.color(color, text);
		})).join('') + ' ';
	} catch(e) {
		return '';
	}
};

//Rerender on a tag change
exports.wait = function(b) {
	exec('herbstclient -w tag_changed', (e) => {
		setTimeout(() => {
			exports.wait(b);
		}, e ? 200 : 0);

		b.renderCo();
	});
};
