/*
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
title      Project Gulp File                                +
project    nord-terminix                                    +
repository https://github.com/arcticicestudio/nord-terminix +
author     Arctic Ice Studio                                +
email      development@arcticicestudio.com                  +
copyright  Copyright (C) 2017                               +
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

[References]
Gulp
  (http://gulpjs.com)
npmjs
  (https://www.npmjs.com)
*/
/*+---------+
  + Imports +
  +---------+*/
const gulp = require("gulp-help")(require("gulp"));
const eslint = require("gulp-eslint");

/*+-------+
  + Tasks +
  +-------+*/
/**
 * Shows the help.
 *
 * @since 0.2.0
 */
gulp.task("default", ["help"]);

/**
 * Lints the color theme JSON file.
 *
 * @since 0.2.0
 */
gulp.task("lint", "Lints the color theme JSON file", () => {
  return gulp.src("./src/json/nord.json")
    .pipe(eslint())
    .pipe(eslint.format())
    .pipe(eslint.failAfterError());
});
