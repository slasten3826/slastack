-- ProcessLang :: Main Entry Point
-- Version: 1.0
-- Author: @slasten3826
-- Usage: local pl = require("processlang")

local processlang = {}

-- Load all 10 operators
processlang.flow     = require("flow")
processlang.connect  = require("connect")
processlang.dissolve = require("dissolve")
processlang.encode   = require("encode")
processlang.choose   = require("choose")
processlang.observe  = require("observe")
processlang.cycle    = require("cycle")
processlang.logic    = require("logic")
processlang.runtime  = require("runtime")
processlang.manifest = require("manifest")

-- Version info
processlang._version = "1.0"
processlang._operators = 10

-- Shorthand: pl.pipe instead of pl.flow.pipe
processlang.pipe    = processlang.flow.pipe
processlang.chain   = processlang.flow.chain

return processlang
