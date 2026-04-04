-- ProcessLang :: Main Entry Point
-- Version: 1.0
-- Author: @slasten3826
-- Usage: local pl = require("processlang")

local processlang = {}

-- Load all 10 operators
processlang.FLOW     = require("FLOW")
processlang.CONNECT  = require("CONNECT")
processlang.DISSOLVE = require("DISSOLVE")
processlang.ENCODE   = require("ENCODE")
processlang.CHOOSE   = require("CHOOSE")
processlang.OBSERVE  = require("OBSERVE")
processlang.CYCLE    = require("CYCLE")
processlang.LOGIC    = require("LOGIC")
processlang.RUNTIME  = require("RUNTIME")
processlang.MANIFEST = require("MANIFEST")

-- Lowercase aliases kept for compatibility
processlang.flow     = processlang.FLOW
processlang.connect  = processlang.CONNECT
processlang.dissolve = processlang.DISSOLVE
processlang.encode   = processlang.ENCODE
processlang.choose   = processlang.CHOOSE
processlang.observe  = processlang.OBSERVE
processlang.cycle    = processlang.CYCLE
processlang.logic    = processlang.LOGIC
processlang.runtime  = processlang.RUNTIME
processlang.manifest = processlang.MANIFEST

-- Version info
processlang._version = "1.0"
processlang._operators = 10

-- Shorthand: pl.pipe instead of pl.FLOW.pipe
processlang.pipe    = processlang.FLOW.pipe
processlang.chain   = processlang.FLOW.chain

return processlang
