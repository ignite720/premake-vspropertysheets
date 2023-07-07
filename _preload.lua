--
-- Name:        thismodule/_preload.lua
-- Purpose:     Define the `thismodule` APIs
-- Author:      ignite720
-- Copyright:   (c) 2002-2023 Jason Perkins and the Premake project
--

local p = premake
local api = p.api

--
-- Register the `thismodule` extension
--

--
-- Register `thismodule` properties
--
api.register({
	name = "vspropertysheets",
	scope = "project",
	kind = "table",
	default = nil,
})

--
-- Decide when `thismodule` should be loaded
--
return function(cfg)
	return _ACTION:startswith("vs")
end