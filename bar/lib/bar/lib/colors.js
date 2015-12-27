var shtore = require('shtore');

var hex = c => c.map(r => ('0' + r.toString(16)).substr(-2)).join('');
var colors = shtore.get('colors').palette.map(c => '#' + hex(c.rgb));

colors.fg = '#' + hex(shtore.get('colors').foreground);
colors.bg = '#' + hex(shtore.get('colors').background);

module.exports = colors;
