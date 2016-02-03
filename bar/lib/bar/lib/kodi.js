'use strict'

var kodiws = require('kodi-ws');

module.exports = function(host) {
	let con;
	let kodi = kodiws(host, 9090);

	kodi.then(kodi => {
		con = kodi;

		kodi.on('error', function() {
			con = null;
		});
	});

	return {
		get: function *() {
			if(con) {
				try {
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
					return '';
				}
			} else {
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
