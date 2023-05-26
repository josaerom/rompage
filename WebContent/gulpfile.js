// gulpfile.js
var gulp = require('gulp')
var sass = require("gulp-sass")(require('sass'));
var rename = require("gulp-rename");

// 일반 컴파일
gulp.task('sass', function () {
  return gulp.src('./v2/scss/*.scss')  // 입력 경로
    .pipe(sass().on('error', sass.logError))
    .pipe(sass({outputStyle: 'compressed'}))
    .pipe(rename({suffix : '.min'}))
    .pipe(gulp.dest('./v2/css'));  // 출력 경로
});

// 런타임 중 파일 감시
gulp.task('sass:watch', function () {
  gulp.watch('./v2/scss/*.scss', ['sass']);  // 입력 경로와 파일 변경 감지 시 실행할 Actions(Task Name)
});