/*
 * Copyright (c) 2016-present Sven Greb <development@svengreb.de>
 * This source code is licensed under the MIT license found in the license file.
 */

/**
 * @file Gulp configurations.
 * @see http://gulpjs.com
 * @see https://www.npmjs.com
 */

const gulp = require("gulp-help")(require("gulp"));
const eslint = require("gulp-eslint");

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
gulp.task("lint", "Lints the color theme JSON file", () => gulp.src("./src/json/nord.json").pipe(eslint()).pipe(eslint.format()).pipe(eslint.failAfterError()));
