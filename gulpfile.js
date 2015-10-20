var gulp = require('gulp');
var sass = require('gulp-sass');
var babel = require('gulp-babel');
var concat = require('gulp-concat');
var sourcemaps = require('gulp-sourcemaps');
var plumber = require('gulp-plumber');
var cssSrc = 'web/**/*.scss';
var cssDest = 'priv/static/css';
var assetsSrc = 'web/static/assets/**/*';
var assetsDest = 'priv/static';
var jsSrc = 'web/static/js/**/*.js*';
var jsDest = 'priv/static/js'


function reportChange(event){
  console.log('File ' + event.path + ' was ' + event.type + ', running tasks...');
}

gulp.task('build-sass', function() {
  gulp.src([cssSrc, '!web/static/css/bootstrap/**/*'])
			.pipe(sourcemaps.init())
      .pipe(sass())
      .pipe(concat('app.css'))
			.pipe(sourcemaps.write())
      .pipe(gulp.dest(cssDest));
});

gulp.task('build-js', function() {
    console.log("Building js");
      gulp.src(jsSrc)
      .pipe(gulp.dest(jsDest));
});

gulp.task('copy-assets', function(){
	gulp.src(assetsSrc)
      .pipe(gulp.dest(assetsDest));
});

gulp.task('build', ['copy-assets','build-js', 'build-sass']);

gulp.task('watch', ['build'], function() {
  gulp.watch([cssSrc], ['build-sass']).on('change', reportChange);
  gulp.watch(jsSrc, ['build-js']).on('change', reportChange);
  gulp.watch(assetsDest, ['copy-assets']).on('change', reportChange);
});


gulp.task('default', ['build']);
