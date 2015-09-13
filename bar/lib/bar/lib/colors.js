var tstore = require('tstore');

var hex = c => c.map(r => ('0' + r.toString(16)).substr(-2)).join('');
var colors = tstore.get('colors').palette.map(c => '#' + hex(c.rgb));

colors.fg = '#' + hex(tstore.get('colors').foreground);
colors.bg = '#' + hex(tstore.get('colors').background);

module.exports = colors;
