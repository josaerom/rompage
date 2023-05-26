// gulpfile.js
var gulp = require('gulp'), 
	sass = require("gulp-sass")(require('sass')),
	rename = require("gulp-rename"),
	sourcemaps = require("gulp-sourcemaps");

// 일반 컴파일
gulp.task('sass', function () {
  return gulp.src('./WebContent/v2/scss/*.scss')  // 입력 경로
  	.pipe(sourcemaps.init())  
  	.pipe(sass().on('error', sass.logError))
    .pipe(sass({outputStyle: 'compressed'}))
    .pipe(rename({suffix : '.min'}))
    .pipe(sourcemaps.write('./maps'))
    .pipe(gulp.dest('./WebContent/v2/css'));  // 출력 경로
});

gulp.task('library', function () {
  return gulp.src('./WebContent/scss/*.scss')  // 입력 경로
    .pipe(sass().on('error', sass.logError))
    .pipe(sass({outputStyle: 'compressed'}))
    .pipe(rename({suffix : '.min'}))
    .pipe(sourcemaps.write('./WebContent/maps'))
    .pipe(cleanCSS({compatibility: 'ie9'}))
    .pipe(gulp.dest('./WebContent/css/v2'));  // 출력 경로
});

// 런타임 중 파일 감시
gulp.task('sass:watch', function () {
  gulp.watch('./WebContent/scss/*.scss', ['sass']);  // 입력 경로와 파일 변경 감지 시 실행할 Actions(Task Name)
});