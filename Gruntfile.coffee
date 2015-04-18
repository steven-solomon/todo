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
          'build/js/app.js': ['src/**/*.coffee']

  grunt.loadNpmTasks 'grunt-contrib-coffee'

  grunt.registerTask 'default', ['coffee']

  return null
