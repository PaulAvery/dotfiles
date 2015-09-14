/* eslint-disable new-cap */
var kodiws = require('xbmc-ws');

function trunc(str, cut) {
	return str.length > cut ? str.substr(0, cut - 3) + '...' : str;
}

module.exports = function(host) {
	var kodi = kodiws(host, 9090);

	return {
		get: function *() {
			try {
				var con = yield kodi;
			} catch(e) {
				return '';
			}

			var player = (yield con.Player.GetActivePlayers())[0];

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

				return symbol + trunc(item.item.title, 60) + trunc(source ? ' - ' + source : '', 20) + ' ';
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
