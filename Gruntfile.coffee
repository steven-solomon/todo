module.exports = (grunt) ->

  grunt.loadNpmTasks('grunt-karma');

  grunt.initConfig
    karma:
      unit:
        configFile: 'karmaConfig.coffee'