module.exports = (grunt) ->
  'use strict'

  # Project configuration
  grunt.initConfig

    # Metadata
    pkg: grunt.file.readJSON 'package.json'

    # Task configuration
    coffeelint:
      src: [ 'src/*.coffee', 'Gruntfile.coffee' ]

    coffee:
      glob_to_multiple:
        expand: true
        flatten: true
        cwd: 'src'
        src: [ '*.coffee' ]
        dest: 'bin'
        ext: '.js'

    stylus:
      compile:
        files:
          'bin/styles.css': 'src/styles.styl'

    jade:
      compile:
        files:
          'bin/index.html': 'src/index.jade'

    vulcanize:
      default:
        options:
          csp: true
          strip: true
        files:
          'bin/vulcanized.html': 'bin/index.html'

    watch:
      gruntfile:
        files: 'src/*.coffee'
        tasks: [ 'coffeelint' ]


  # These plugins provide necessary tasks
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-coffeelint'
  grunt.loadNpmTasks 'grunt-contrib-stylus'
  grunt.loadNpmTasks 'grunt-contrib-jade'
  grunt.loadNpmTasks 'grunt-vulcanize'
  grunt.loadNpmTasks 'grunt-contrib-watch'

  # Default task
  grunt.registerTask 'default', [
    'coffeelint'
    'coffee'
    'stylus'
    'jade'
    'vulcanize'
  ]
