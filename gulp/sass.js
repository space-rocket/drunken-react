var path = require('path');
var Gulp = require('gulp');
var newer = require('gulp-newer');
var concat = require('gulp-concat');
var sass = require('gulp-sass');
var sourcemaps = require('gulp-sourcemaps');

Gulp.task('sass', function () {

    var bundleConfigs = [{
        entries: [
            './client/sass/variables.scss',
            './client/sass/bootstrap.scss',
            './client/sass/font-awesome.scss',
            './client/sass/custom.scss',
            // './client/sass/media-queries-helpers.scss',
            './client/sass/media-queries.scss'
        ],
        dest: './priv/static/css/',
        outputName: 'app.css'
    }];

    return bundleConfigs.map(function (bundleConfig) {

        return Gulp.src(bundleConfig.entries)
            .pipe(sourcemaps.init())
            .pipe(newer(path.join(bundleConfig.dest, bundleConfig.outputName)))
            .pipe(concat(bundleConfig.outputName))
            .pipe(sass({outputStyle: 'compressed'}))
            .pipe(sass())
            .pipe(sourcemaps.write())
            .pipe(Gulp.dest(bundleConfig.dest));
    });
});
