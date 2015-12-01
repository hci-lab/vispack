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
console.log process.argv.slice 2

commands = process.argv.slice 2

if commands[0] is 'install'
  github_url = commands[1]
  prefix = './plugins'
  str = 'npm install --prefix ' + prefix + ' ' + github_url
  exec.exec str, (error,stdout,stderr) ->
    console.log 'stdout: ' + stdout
    console.log 'stderr: ' + stderr
    if error isnt null
      console.log 'exec error: ' + error

exports.awesome = ->
  "awesome"
