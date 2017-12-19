var gulp = require('gulp');
var sass = require('gulp-sass');
var browserSync = require('browser-sync');
var reload = browserSync.reload;
var connectPHP = require('gulp-connect-php');

var paths = {
    html:['./public/*.php'],
    css:['./css/*.css']
};

// HTML reload
gulp.task('html', function() {
    gulp.src(paths.html)
	.pipe(reload({stream:true}))
});

// CSS reload
gulp.task('css', function() {
    gulp.src(paths.css)
	.pipe(reload({stream:true}))
});

// JS reload
//
//

// PHP reload
gulp.task('php', function() {
    connectPHP.server({
	    base: './public/',
		keepalive:true,
		hostname: 'localhost',
		port: 8001,
		open: false,
	});
});

gulp.task('browserSync', function() {
    browserSync({
		proxy: '127.0.0.1',
		port: 8002,
	});
});


gulp.task('watcher', function(){
    gulp.watch(paths.html, ['html']);
	gulp.watch(paths.css, ['css']);
});


gulp.task('default', ['watcher', 'browserSync', 'php']);

