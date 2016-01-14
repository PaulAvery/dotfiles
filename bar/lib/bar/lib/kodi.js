'use strict'

var kodiws = require('kodi-ws');

module.exports = function(host) {
	let kodi;
	let clear = true;

	function reconnect() {
		if(clear) {
			clear = false;
			kodi = kodiws(host, 9090);
			kodi.then((con) => {
				con.on('error', reconnect);
			});

			setTimeout(() => clear = true, 500);
		}
	}

	reconnect();

	return {
		get: function *() {
			try {
				let con = yield kodi;
				let player = (yield con.Player.GetActivePlayers())[0];

				if(player) {
					var item = yield con.Player.GetItem(player.playerid, [
						'title',
						'artist',
						'showtitle'
					]);

					var status = yield con.Player.GetProperties(player.playerid, [
						'speed',
						'type',
						'time',
						'percentage',
						'totaltime'
					]);

					var symbol = status.speed === 0 ? ' | ' : ' > ';
					var source = item.item.showtitle || item.item.artist;

					return symbol + item.item.title + (source ? ' - ' + source : '') + ' ';
				} else {
					return '';
				}
			} catch(e) {
				reconnect();
				return '';
			}
		},

		wait: function(bar) {
			var redraw = bar.renderCo.bind(bar);

			kodi.then(function(con) {
				con.Player.OnPlay(redraw);
				con.Player.OnPause(redraw);
				con.Player.OnStop(redraw);
			});
		}
	};
};
