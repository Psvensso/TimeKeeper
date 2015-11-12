const gulp = require('gulp');
const babel = require('gulp-babel');
const sourcemaps = require('gulp-sourcemaps');
const concat = require('gulp-concat');
const sass = require('gulp-sass');

const paths = {
	sourceRoot: "./web/static",
	destRoot: "./priv/static"
};

function reportChange(event){
  console.log('File ' + event.path + ' was ' + event.type);
}

 
gulp.task('sass', ()=>{
	gulp.src('./priv/static/css/app.scss')
		.pipe(sourcemaps.init())
		.pipe(sass())
		.pipe(sourcemaps.write())
		.pipe(gulp.dest("./priv/static/css/"));
});

gulp.watch("./priv/static/**/*.js", ['scripts']).on('change', reportChange);;
gulp.watch("./priv/static/**/*.scss", ['sass']).on('change', reportChange);;
