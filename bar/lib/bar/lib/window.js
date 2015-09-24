'use strict';

var exec = require('child_process').exec;

exports.get = function *() {
	try {
		let res = yield exec.bind(null, 'herbstclient substitute t clients.focus.title echo t');

		return res[0].substr(0, res[0].length - 1);
	} catch(e) {
		return '';
	}
};

//Rerender on a tag change
exports.wait = function(b) {
	function waitTitle() {
		exec('herbstclient -w window_title_changed', () => {
			waitTitle();
			b.renderCo();
		});
	}

	function waitFocus() {
		exec('herbstclient -w focus_changed', function() {
			waitFocus();
			b.renderCo();
		});
	}

	function waitClose() {
		exec('herbstclient -w tag_flags', function() {
			waitClose();
			b.renderCo();
		});
	}

	waitTitle();
	waitFocus();
	waitClose();
};
