# Description
#   Uptodate staging branch
#
# Dependencies:
#   "<module name>": "<module version>"
#
# Configuration:
#   LIST_OF_ENV_VARS_TO_SET
#
# Commands:
#   hubot make caregeneral uptodate - <what the respond trigger does>
#   <trigger> - <what the hear trigger does>
#
# Notes:
#   <optional notes required for the script>
#
# Author:
#   @pftg
#
module.exports = (robot) ->
  github = require("githubot")(robot)

  github.handleErrors (response) ->
    msg.reply "Oh no! #{response.body}!"

  robot.respond /make ([-_\.0-9a-zA-Z]+) uptodate$/i, (msg) ->
    app = github.qualified_repo msg.match[1]

    github.branches(app).merge "master", into: "staging", (commit) ->
      msg.reply "Master have been merged into staging: '#{commit.url}'"

  robot.respond /make ([^ ]+)$/i, (msg) ->
    robot.logger.info msg.match[1]
    msg.reply msg.match[1]

