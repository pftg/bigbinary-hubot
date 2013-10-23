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

  robot.respond /make ([-_\.0-9a-zA-Z]+) uptodate$/i, (msg) ->
    app      = github.qualified_repo msg.match[1]

    github.branches(app).merge "master", into: "staging", (mergeCommit) ->
      console.log mergeCommit.message


