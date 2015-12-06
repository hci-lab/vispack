#!/usr/bin/env node
###
project     | vispack
url         | https://github.com/hci-lab/vispack/blob/master/src/vispack.coffee
module      | vispack
author      | YusufMohamed
description | a cli utility to install and remove plugins.

Copyright (c) 2015 HCI Lab. Licensed under the MIT license.
###
exec = require 'child_process'
logger = require 'jethro'
fs = require 'extfs'
fse = require 'fs-extra'
program = require 'commander'
pjson = require '../package.json'


program
.version pjson.version
.option '-I, --install [plugin]', 'add a new plugin'
.option '-R, --remove [plugin]', 'remove installed plugin'

program.on '--help', ()->
  console.log '  Examples:'
  console.log ''
  console.log '    $ vispack install underscore'
  console.log '    $ vispack remove underscore'
  console.log ''

program.parse(process.argv);



if program.install is true
  logger 'Error', 'vispack', 'missing arguments. [vispack -h] for more help.'
else if program.remove is true
  logger 'Error', 'vispack', 'missing arguments. [vispack -h] for more help.'
else if program.install isnt true and program.remove is undefined and program.install isnt undefined
  package_name = program.install
  prefix = './plugins'
  str = 'npm install --prefix ' + prefix + ' ' + package_name
  exec.exec str ,(error,stdout,stderr) ->
    logger 'Info' , 'vispack installer' , stdout
    if error isnt null
      logger 'Error', 'vispack installer' , 'something wrong happened. try again later.'
else if program.remove isnt true and program.install is undefined and program.remove isnt undefined
  package_name = program.remove
  prefix = './plugins'
  str = 'npm remove --prefix ' + prefix + ' ' + package_name
  exec.exec str ,(error,stdout,stderr) ->
    logger 'Info' , 'vispack removal' , stdout
    if error isnt null
      logger 'Error', 'vispack removal' , 'something wrong happened. try again later.'



#commands = process.argv.slice 2
#
#if commands[0] is 'remove'
#  plugin_name = commands[1]
#  fs.getDirs process.cwd() + '\\plugins\\node_modules\\' + plugin_name, (err, dirs) ->
#    if err
#      console.log 'directory not found'
#    else
#      plugin_dir = process.cwd() + '\\plugins\\node_modules\\' + plugin_name
#      fse.remove plugin_dir, (err)->
#        if err
#         logger 'Error', 'Remove', err
#        logger 'Info' , 'Remove' , 'Success'
#
#
#
#
#
#if commands[0] is 'install'
#  github_url = commands[1]
#  prefix = './plugins'
#  str = 'npm install --prefix ' + prefix + ' ' + github_url
#  exec.exec str, (error,stdout,stderr) ->
#    logger 'Info' , 'stdout' , stdout
#    if error isnt null
#      logger 'Error', 'exec error' , error

#exports.awesome = ->
#  "awesome"
