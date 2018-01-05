var gulp = require('gulp'),
    php = require('gulp-connect-php'),
    browserSync = require('browser-sync').create();

gulp.task('css', function(){
    gulp.src('./app/css/*.css')
    .pipe(browserSync.reload({stream:true}));
});

gulp.task('sync', function() {
    browserSync.init({
	proxy: "eduphp"
    });
});


gulp.task('connect', function() {
    return php.server();
});

gulp.task('watch', function() {
    gulp.watch('./app/**/*.+(php|html|js)')
    .on('change', function() { browserSync.reload(); });
    gulp.watch('./app/css/*.css', ['css']);
    //gulp.watch('./app/css/*.css').on('change', browserSync.reload);
});

gulp.task('default', ['watch', 'sync', 'connect']);
