module.exports = (grunt) ->
  "use strict"
  grunt.loadNpmTasks "grunt-bower-task"
  grunt.loadNpmTasks 'grunt-contrib-jade'
  grunt.loadNpmTasks "grunt-contrib-sass"
  grunt.loadNpmTasks "grunt-contrib-coffee"
  grunt.loadNpmTasks "grunt-contrib-clean"
  grunt.loadNpmTasks "grunt-contrib-watch"
  grunt.loadNpmTasks "grunt-contrib-copy"
  grunt.loadNpmTasks "grunt-contrib-connect"
  grunt.loadNpmTasks "grunt-contrib-concat"
  
  grunt.initConfig
    pkg: grunt.file.readJSON("package.json")
    connect:
      server:
        options:
          port: "8000"
          base: "dst"

    bower:
      install:
        options:
          targetDir: "./dst/lib"
          layout: "byComponent"
          install: true
          verbose: false
          cleanTargetDir: true
          cleanBowerDir: false

    watch:
      jade:
        files: '**/*.jade'
        tasks: ['jade']

      coffee:
        files: "**/*.coffee"
        tasks: ["coffee"]

      sass:
        files: "src/sass/*.sass"
        tasks: ["concat:sass", "sass"]

    jade:
      site:
        expand: true
        cwd: 'src/jade'
        src: ['*.jade']
        dest: 'dst'
        ext: '.html'
        options:
          pretty: true

    coffee:
      compile:
        options:
          join: true
        files:
          "dst/js/app.js": ["src/coffee/*.coffee"]

    sass:
      compile:
        options:
          style: 'expanded'
          compass: true
        files:
          "dst/css/style.css": "src/sass/tmp/style.sass"

    copy:
      main:
        files: [
          {
            expand: true
            src: ["src/image/*.*"]
            dest: "dst/img"
            flatten: true
          },
          {
            expand: true
            src: ["src/pdf/*.*"]
            dest: "dst/pdf"
            flatten: true
          }
        ]

    clean:
      build: ["dst"]

    concat:
      sass:
        src: [
          'src/sass/init.sass'
          'src/sass/mixin.sass'
          'src/sass/*.sass'
        ],
        dest: 'src/sass/tmp/style.sass'

  grunt.registerTask "default", [
    "clean"
    "bower:install"
    "concat"
    "sass"
    "coffee"
    "jade"
    "copy"
    "connect"
    "watch"
  ]
  return