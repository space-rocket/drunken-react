var gulp = require('gulp');
var runSequence = require('run-sequence');

gulp.task('build', function(done) {
    runSequence('webpack', 'sass', 'media', function() {
			    // runSequence('serve', function() {});
        done();
    });
});