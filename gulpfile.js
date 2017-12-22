
////////////...TASK...Базовый.синтаксис...////////////////////////////////////////////////////////
///
///   gulp.task('task', function() {
///       return gulp.src('file/s')                       ресурс
///       .pipe(plugin())                                 выполнение плагина над ресурсом
///       .pipe(gulp.dest('dir'))                         выгрузка в каталог
///       .pipe(browserSync.reload({stream: true}))       если необходим reload
///   });
///
///   Шаблоны ресурса:
///   'filename.js'                                       один файл
///   '[filename1.js, filename2.js, ..., filenameN.js']   массив файлов
///   'dir/filename.js'                                   один файл из каталога 
///   'dir/*.js'                                          все файлы с расширением .js из каталога 
///   '/**/*.js'                                          любая вложенность каталогов
///   '!filename.js'                                      исключить файл
///   '*.+(js|css)'                                       все файлы js и css
///                              
///////////////////////////////////////////////////////////////////////////////////////////////////

////////////...TASK...Слежение.за.изменением...////////////////////////////////////////////////////
///
///   gulp.task('watch', ['browserSync', 'anyTask'], function() {  + таск browserSync
///       gulp.watch('file/s', ['task/s_name']);                   при изменении file/s выполнить таск
///       gulp.watch('file/s', browserSync.reload);                при изменении file/s выполнить reload
///   });
///
///////////////////////////////////////////////////////////////////////////////////////////////////

////////////...TASK...browserSync...///////////////////////////////////////////////////////////////
///
///   gulp.task('browserSync', function() {
///       browserSync({
///           server: {
///               baseDir: 'dir'
///           },
///           notify: true
///       });
///   });
///      
///////////////////////////////////////////////////////////////////////////////////////////////////

//////  !ДЛЯ LIVERELOAD ТЭГ <body>..</body> ОБЯЗАТЕЛЕН В ФАЙЛЕ! ////////


var gulp = require('gulp'), 
    php = require('gulp-connect-php'),
    browserSync = require('browser-sync').create();

gulp.task('sync', function() {
    browserSync.init({
	proxy: "eduphp.loc"
    });
});


gulp.task('connect', function() {
    return php.server();
});

gulp.task('watch', function() {
    gulp.watch('./public/*.+(php|html|css|js)')
    .on('change', function() { browserSync.reload(); });
});

gulp.task('default', ['watch', 'sync', 'connect']);