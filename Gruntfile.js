module.exports = function(grunt) {

  grunt.initConfig({
    pkg: grunt.file.readJSON('package.json'),
    haml: {
      compile: {
        files: {
          "dst/index.html": ["src/haml/index.haml"]
        }
      }
    },
    sass: {
      compile: {
        options: {
        },
        files: {
          "dst/stylesheets/style.css": "src/sass/style.sass"
        }
      }
    },
    coffee: {
      compile: {
        files: {
          "dst/javascripts/app.js": "src/coffee/app.coffee"
        }
      }
    },
    clean: {
      build: ["dst"]
    }
  });

  grunt.loadNpmTasks('grunt-contrib-haml');
  grunt.loadNpmTasks('grunt-contrib-sass');
  grunt.loadNpmTasks('grunt-contrib-coffee');
  grunt.loadNpmTasks('grunt-contrib-clean');

  grunt.registerTask('default', ['clean', 'haml', 'sass', 'coffee']);

};
