module.exports = function(grunt) {

  grunt.loadNpmTasks('grunt-contrib-haml');
  grunt.loadNpmTasks('grunt-contrib-sass');
  grunt.loadNpmTasks('grunt-contrib-coffee');
  grunt.loadNpmTasks('grunt-contrib-clean');
  grunt.loadNpmTasks('grunt-contrib-watch');

  grunt.initConfig({
    pkg: grunt.file.readJSON('package.json'),
    watch: {
      haml: {
        files: '**/*.haml',
        tasks: ['haml'],
        options: {
          livereload: true,
        },
      },
      coffee: {
        files: '**/*.coffee',
        tasks: ['coffee'],
        options: {
          livereload: true,
        },
      },
      sass: {
        files: '**/*.sass',
        tasks: ['sass'],
        options: {
          livereload: true,
        },
      },
    },
    haml: {
      compile: {
        files: {
          "dst/index.html": ["src/haml/index.haml"]
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
    sass: {
      compile: {
        options: {
        },
        files: {
          "dst/stylesheets/style.css": "src/sass/style.sass"
        }
      }
    },
    clean: {
      build: ["dst"]
    }
  });

  grunt.registerTask('default', ['clean', 'haml', 'sass', 'coffee'])
  
};
