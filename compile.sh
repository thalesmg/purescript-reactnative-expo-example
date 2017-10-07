#!/bin/bash

pulp build --to index.js --skip-entry-point \
     && (echo 'module.exports.app = PS.Main.app;' >> ./index.js)
