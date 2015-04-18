module.exports = (grunt) ->
  grunt.initConfig
    pkg:
      grunt.file.readJSON 'package.json'
    coffee:
      app:
        options:
          join: true
          sourceMap: true
        files:
          'build/todo/app.js': ['src/**/*.coffee']
    copy:
      main:
        files: [
          {expand: true, flatten: true, src: ['presentationFrameworks/jquery/**'], dest: 'build/jquery/', filter: 'isFile'}
          {expand: true, flatten: true, src: ['bower_components/jquery/dist/**'], dest: 'build/jquery/', filter: 'isFile'}
        ]

  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-copy'

  grunt.registerTask 'default', ['coffee', 'copy']

  return null
