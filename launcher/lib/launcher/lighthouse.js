#!/usr/bin/env node
var Lighthouse = require('lighthouse-provider');
var common = require('lighthouse-provider-common');
var lighthouse = new Lighthouse();

//Provide xdg-menu based applications
lighthouse.attach('a', common.xdg);

//Simply execute the input
lighthouse.attach('e', common.exec);

//Run default action via xdg-open
lighthouse.attach('d', common.open);

//Open url
lighthouse.attach('u', common.url);

process.stdin.pipe(lighthouse).pipe(process.stdout);
