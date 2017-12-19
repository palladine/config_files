var gulp = require('gulp');
var sass = require('gulp-sass');
var browserSync = require('browser-sync');
var reload = browserSync.reload;
var connectPHP = require('gulp-connect-php');

var paths = {
    html:['./public/index.html'],
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
//
//

gulp.task('browserSync', function() {
    browserSync({
	    server: {
		    baseDir: "./public/"
		},
		port:8080,
		open: true,
		notify: false
	});
});


gulp.task('watcher', function(){
    gulp.watch(paths.html, ['html']);
	gulp.watch(paths.css, ['css'])
});


gulp.task('default', ['watcher', 'browserSync']);

