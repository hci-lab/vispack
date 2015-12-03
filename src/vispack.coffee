###
project     | vispack
url         | https://github.com/hci-lab/vispack/blob/master/src/vispack.coffee
module      |
author      | YusufMohamed
description |

Copyright (c) 2015 HCI Lab. Licensed under the MIT license.
###
exec = require 'child_process'
logger = require 'jethro'
fs = require 'extfs'
fse = require 'fs-extra'

commands = process.argv.slice 2

if commands[0] is 'remove'
  plugin_name = commands[1]
  fs.getDirs process.cwd() + '\\plugins\\node_modules\\' + plugin_name, (err, dirs) ->
    if err
      console.log 'directory not found'
    else
      plugin_dir = process.cwd() + '\\plugins\\node_modules\\' + plugin_name
      fse.remove plugin_dir, (err)->
        if err
         logger 'Error', 'Remove', err
        logger 'Info' , 'Remove' , 'Success'





if commands[0] is 'install'
  github_url = commands[1]
  prefix = './plugins'
  str = 'npm install --prefix ' + prefix + ' ' + github_url
  exec.exec str, (error,stdout,stderr) ->
    logger 'Info' , 'stdout' , stdout
    if error isnt null
      logger 'Error', 'exec error' , error

#exports.awesome = ->
#  "awesome"
