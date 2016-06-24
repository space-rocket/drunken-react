var gulp = require('gulp');


gulp.task('watch', function() {
  return gulp.watch('./client/**/*.{js,scss}', ['build']);
});
