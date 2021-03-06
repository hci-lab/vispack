`#!/usr/bin/env node
`
###
project     | vispack
url         | https://github.com/hci-lab/vispack/blob/master/src/vispack.coffee
module      | vispack
author      | YusufMohamed
description | a cli utility to install and remove plugins.

Copyright (c) 2015 HCI Lab. Licensed under the MIT license.
###
exec    = require 'child_process'
logger  = require 'jethro'
fs      = require 'extfs'
fse     = require 'fs-extra'
program = require 'commander'
pjson   = require '../package.json'


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
  install_dir  = process.env.APPDATA + '/npm/node_modules/vispack' || (process.platform == 'darwin' ? process.env.HOME + 'Library/Preference/npm/node_modules/vispack' : '/usr/lib/node_modules/vispack')
  prefix       = install_dir + '/plugins'
  str          = 'npm install --prefix ' + prefix + ' ' + package_name
  exec.exec str ,(error,stdout,stderr) ->
    logger 'Info' , 'vispack installer' , stdout
    if error isnt null
      logger 'Error', 'vispack installer' , 'something wrong happened. try again later.'
else if program.remove isnt true and program.install is undefined and program.remove isnt undefined
  package_name = program.remove
  install_dir  = process.env.APPDATA + '/npm/node_modules/vispack' || (process.platform == 'darwin' ? process.env.HOME + 'Library/Preference/npm/node_modules/vispack' : '/var/local/npm/node_modules/vispack')
  prefix       = install_dir + '/plugins'
  str          = 'npm remove --prefix ' + prefix + ' ' + package_name
  exec.exec str ,(error,stdout,stderr) ->
    logger 'Info' , 'vispack removal' , stdout
    if error isnt null
      logger 'Error', 'vispack removal' , 'something wrong happened. try again later.'

#exports.awesome = ->
#  "awesome"
