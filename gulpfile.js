const chug = require('gulp-chug');
const clean = require('gulp-clean');
const fs = require('fs');
const git = require('gulp-git');
const gulp = require('gulp');
const runsequence = require('run-sequence');
const subtree = require('gulp-subtree');
const zip = require('gulp-zip');

const paths = {
  preview: {
    dir: 'preview',
    files: 'preview/**/*'
  },
  theme: {
    base: {
      dir: 'theme',
      files: 'theme/**/*'
    },
    dist: {
      dir: 'theme/dist',
      files: 'theme/dist/**/*'
    },
    gulpfile: {
      file: 'theme/gulpfile.js'
    },
    node: {
      dir: 'theme/node_modules',
      files: 'theme/node_modules/**/*'
    },
    package: {
      file: 'theme/package.json'
    }
  },
  releases: {
    dir: 'releases',
    files: 'releases/**/*'
  }
}

const package = JSON.parse(fs.readFileSync(paths.theme.package.file));
const packageName = package.name;
const packageVersion = package.version;

gulp.task('compress', function() {
  gulp.src([paths.theme.base.files, '!' + paths.theme.node.dir, '!' + paths.theme.node.files])
    .pipe(zip(packageName + '-' + packageVersion + '.zip'))
    .pipe(gulp.dest(paths.releases.dir))
});

gulp.task('zip', function () {
  gulp.src(paths.theme.gulpfile.file, {read: false})
    .pipe(chug({
      tasks: ['build']
    }, function() {
      gulp.start('compress');
    }))
});

gulp.task('add', function(){
  return gulp.src(paths.preview.dir)
    .pipe(git.add());
});

gulp.task('commit', function(){
  return gulp.src(paths.preview.files)
    .pipe(git.commit('v-' + packageVersion));
});

gulp.task('subtree', function () {
  return gulp.src(paths.preview.dir)
    .pipe(subtree({
      branch: 'test'
    }))
    .pipe(clean());
});

gulp.task('publish', function (callback) {
  runsequence('add', 'commit', 'subtree',
    callback)
});