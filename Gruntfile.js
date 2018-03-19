module.exports = function(grunt) {

  // Project configuration.
  grunt.initConfig({
    pkg: grunt.file.readJSON('package.json'),
    copy: {
        bootstrapCss: {
          src: "./node_modules/bootstrap/dist/css/bootstrap.css",
          dest: "./public/src/css/bootstrap.css"
        },
        bootstrapJs: {
          src: "./node_modules/bootstrap/dist/js/bootstrap.js",
          dest: "./public/src/js/bootstrap.js"
        },
        jqueryJs: {
          src: "./node_modules/jquery/dist/jquery.js",
          dest: "./public/src/js/jquery.js"
        },
        popperJs: {
          src: "./node_modules/popper.js/dist/umd/popper.js",
          dest: "./public/src/js/popper.js"
        }
    }
  });

  // Load grunt plugins
  grunt.loadNpmTasks('grunt-contrib-copy');
  //running "grunt" on console will execute the following tasks
  grunt.registerTask('default', ['copy']);
};