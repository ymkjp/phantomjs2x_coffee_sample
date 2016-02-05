
config = require('../lib/config').init()
logger = require('../lib/logger').init()

casper.userAgent(config['user_agent']['nexus5_chrome'])

casper.start 'http://example.com/', ->
  @.waitForSelector 'h1', ->
    logger.visitPage(@)
    logger.capture('page')
    @test.assertTitle('Example Domain', 'example.com has expected title.');
    @test.assertTextExists('Example Domain', 'example.com has expected text.');

.run ->
  @test.done()
  @test.renderResults(true, 0, 'coverage/test-result.xml')
