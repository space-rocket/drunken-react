var gulp = require('gulp');

// gulp.task('serve', ['serve:node', 'serve:api']);
gulp.task('watch', ['build', 'watch:build']);
// gulp.task('default', ['serve']);