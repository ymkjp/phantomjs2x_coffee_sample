system = require('system')
timeStamp = (new Date).getTime()

log = (message) ->
  casper.test.comment(message) unless casper.cli.get('quiet')

capture = (name) ->
  step = casper.status().step
  filePath = "logs/capture/#{timeStamp}_#{step}_#{name}.png"
  casper.capture(filePath) unless casper.cli.get('no-capture')

exports.init = (timeout) ->
  casper.options.onWaitTimeout = (timeout) ->
    @test.error("Timed out error in #{timeout}ms. Now taking capture...")
    capture('on_wait_timeout')
    @die("Error onWaitTimeout.", 1)
  return exports

exports.visitPage = (self) ->
  message = "[Visit page] title: \"#{self.getTitle()}\", url: \"#{self.getCurrentUrl()}\""
  log(message)

exports.log = (message) ->
  log(message)

exports.capture = (name) ->
  capture(name)
