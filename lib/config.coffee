system = require('system')
fs = require('fs')

exports.init = ->
  environment = system.env.NODE_ENV || 'default'
  JSON.parse(fs.read("./config/#{environment}.json", 'utf8'))

