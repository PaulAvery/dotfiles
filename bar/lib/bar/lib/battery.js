'use strict';
var battery = require('node-battery');
var colors = require('./colors');

exports.get = function *(util) {
	let data = yield (cb) => battery.percentages(p => cb(null, p), 0);

	let left = Array(Math.ceil(data[0] / 10) + 1).join('|');
	let right = Array(11 - Math.ceil(data[0] / 10)).join('|');

	return ' ' + left + (yield util.color(colors[0], right)) + ' ';
};
