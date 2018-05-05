/**
 * Gulp file to automate the various tasks
 */

var autoprefixer = require('gulp-autoprefixer');
var browserSync = require('browser-sync').create();
var csscomb = require('gulp-csscomb');
var cache = require('gulp-cache');
var cssnano = require('gulp-cssnano');
var del = require('del');
var imagemin = require('gulp-imagemin');
var gulp = require('gulp');
var gulpIf = require('gulp-if');
var npmDist = require('gulp-npm-dist');
var postcss = require('gulp-postcss');
var runSequence = require('run-sequence');
var sass = require('gulp-sass');
var uglify = require('gulp-uglify');
var useref = require('gulp-useref-plus');
var wait = require('gulp-wait');

// Define paths

var paths = {
  dist: {
    base: 'dist',
    img:  'dist/assets/img',
    libs: 'dist/assets/plugins'
  },
  base: {
    base: './',
    node: 'node_modules'
  },
  src: {
    base: 'src',
    css:  'src/assets/css',
    html: 'src/*.html',
    img:  'src/assets/img/**/*.+(png|jpg|gif|svg)',
    js:   'src/assets/js/**/*.js',
    scss: 'src/assets/scss/**/*.scss'
  }
}

// Compile SASS

gulp.task('sass', function() {
  return gulp.src(paths.src.scss)
    .pipe(wait(500))
    .pipe(sass().on('error', sass.logError))
    .pipe(postcss([require('postcss-flexbugs-fixes')]))
    .pipe(autoprefixer({
        browsers: ['> 1%']
    }))
    .pipe(csscomb())
    .pipe(gulp.dest(paths.src.css))
    .pipe(browserSync.reload({
        stream: true
    }));
});

// Live reload

gulp.task('browserSync', function() {
  browserSync.init({
    server: {
        baseDir: [paths.src.base, paths.base.base]
    },
  })
});

// Watch for changes

gulp.task('watch', ['browserSync', 'sass'], function() {
  gulp.watch(paths.src.scss, ['sass']);
  gulp.watch(paths.src.js, browserSync.reload);
  gulp.watch(paths.src.html, browserSync.reload); 
});

// Clean

gulp.task('clean:dist', function() {
  return del.sync(paths.dist.base);
});

// Copy

gulp.task('copy:assets', function() {
  return gulp.src([
    paths.src.base + '/**/*',
    '!' + paths.src.base + '/assets/scss', '!' + paths.src.base + '/assets/scss/**'
    ])
    .pipe(gulp.dest(paths.dist.base))
});

gulp.task('copy:libs', function() {
  gulp.src(npmDist(), {base: paths.base.node})
    .pipe(gulp.dest(paths.dist.libs));
});

// Replace and optimize

gulp.task('useref', function() {
  return gulp.src(paths.src.html)
    .pipe(useref({
      transformPath: function(filePath) {
        return filePath.replace('node_modules/','../node_modules/')
      }
    }))
    .pipe(gulpIf('*.js', uglify()))
    .pipe(gulpIf('*.css', cssnano()))
    .pipe(gulp.dest(paths.dist.base))
});

// Optimize images

gulp.task('images', function() {
  return gulp.src(paths.src.img)
    .pipe(cache(imagemin()))
    .pipe(gulp.dest(paths.dist.img))
});

// Build

gulp.task('build', function(callback) {
  runSequence('clean:dist', 'copy:assets', 'copy:libs',
    ['sass', 'useref'], 
    callback);
});


// Default

gulp.task('default', function (callback) {
  runSequence(['sass','browserSync', 'watch'],
    callback
  )
});