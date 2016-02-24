'use strict';

var exec = require('child_process').exec;
var colors = require('./colors');

var count = '?';

function countUpdates() {
	exec('checkupdates', (e, ou) => {
		if(e) {
			count = '!';
		} else {
			exec('cower -u', (e, oc) => {
				if(e) {
					count = '!';
				} else {
					count = ou.toString('utf8').split('\n').length + oc.toString('utf8').split('\n').length - 2;
				}
			});
		}
	});
}

setInterval(countUpdates, 1000 * 60 * 15);
countUpdates();

exports.get = function *(util) {
	if(count === '?') {
		return `(${count})`;
	} else if(count === '!') {
		return yield util.color(colors[1], `(${count})`);
	} else if(count === 0) {
		return yield util.color(colors[2], `(${count})`);
	} else {
		return yield util.color(colors[3], `(${count})`);
	}
};

exports.update = '(notify-send -a pacaur Updating && gksu --description pacaur pacaur -- -Syu --noconfirm --noedit && notify-send -a pacaur "Updated everything" || notify-send -a pacaur "Errors while updating") &> /dev/null'
