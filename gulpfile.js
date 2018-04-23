var gulp = require('gulp');
var sass = require('gulp-sass');
var browserSync = require('browser-sync');
var imagemin = require('gulp-imagemin');
var uglify = require('gulp-uglifyjs');
var concat = require('gulp-concat');
var autoprefixer = require('gulp-autoprefixer');
var imageminJpegRecompress = require('imagemin-jpeg-recompress');
var pngquant = require('pngquant');
var htmlmin = require('gulp-htmlmin');
var cache = require('gulp-cache');


gulp.task('sass', function(){
    return gulp.src(['app/scss/*.scss'])
        .pipe(sass().on('error', sass.logError))
        .pipe(autoprefixer(['last 15 versions', '> 1%', 'ie 8', 'ie 7'], { cascade: true }))
        .pipe(gulp.dest('dist/css'))
        .pipe(browserSync.reload({stream:true}))
});

gulp.task('images', function(){
    return gulp.src('app/images/**/*.+(png|jpg|svg)')
    .pipe(cache(imagemin([
      imagemin.gifsicle({interlaced: true}),
      imagemin.jpegtran({progressive: true}),
      imageminJpegRecompress({
        loops: 5,
        min: 65,
        max: 70,
        quality:'medium'
      }),
      imagemin.svgo(),
      imagemin.optipng({optimizationLevel: 3}),
      pngquant({quality: '65-70', speed: 5})
    ],{
      verbose: true
    })))
    .pipe(gulp.dest('dist/images'))
});

gulp.task('fonts', function(){
    return gulp.src('app/fonts/**/*')
    .pipe(gulp.dest('dist/fonts'))
});

gulp.task('common', function(){
    return gulp.src([
            'node_modules/jquery/dist/jquery.min.js'
        ])
    .pipe(concat('common.js'))
    .pipe(uglify())
    .pipe(gulp.dest('dist/js'))
});

gulp.task('js', function(){
    return gulp.src([
            'app/js/app.js'
        ])
    .pipe(concat('app.js'))
    .pipe(uglify())
    .pipe(gulp.dest('dist/js'))
});

gulp.task('html', function() {
  return gulp.src('app/*.html')
    .pipe(htmlmin({collapseWhitespace: true}))
    .pipe(gulp.dest('dist/'))
    .pipe(browserSync.reload({stream:true}))
});

gulp.task('browserSync', function(){
    browserSync({
        server: {
            baseDir: 'dist'
        },
    })
});

gulp.task('watch', ['browserSync', 'sass', 'images', 'fonts', 'js', 'html', 'common'], function(){
    gulp.watch('app/scss/**/*.scss', ['sass']);
    gulp.watch('app/js/*.js', ['js']);
    gulp.watch('app/*.html', ['html']);
    gulp.watch('app/images/', ['images']);
});

gulp.task('run', ['sass', 'images', 'fonts', 'js', 'html', 'common'])