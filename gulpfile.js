/*
 * Copyright (c) 2016-present Arctic Ice Studio <development@arcticicestudio.com>
 * Copyright (c) 2016-present Sven Greb <code@svengreb.de>

 * Project:    Nord Tilix
 * Repository: https://github.com/arcticicestudio/nord-tilix
 * License:    MIT
 * References:
 *   http://gulpjs.com
 *   https://www.npmjs.com
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
