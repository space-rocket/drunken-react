var Gulp = require('gulp');
var Path = require('path');
var Merge = require('merge-stream');


Gulp.task('media', function () {

    var metas = Gulp.src('./client/media/*')
        .pipe(Gulp.dest(Path.join('./priv/')));

    var fontAwewsome = Gulp.src('./node_modules/font-awesome/fonts/**')
        .pipe(Gulp.dest(Path.join('./priv/static', 'fonts', 'font-awesome', 'fonts')));

    var glyphicons = Gulp.src('./node_modules/bootstrap-sass/assets/fonts/bootstrap/**')
        .pipe(Gulp.dest(Path.join('./priv/static', 'fonts', 'bootstrap')));

		var img = Gulp.src('./client/imgs/*')
		        .pipe(Gulp.dest(Path.join('./priv/static', 'images')));

    return Merge(metas, fontAwewsome, glyphicons, img);
});
