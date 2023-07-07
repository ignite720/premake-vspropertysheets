--
-- Create a `thismodule` namespace to isolate the additions
--
local p = premake

p.modules.vspropertysheets = {}

local m = p.modules.vspropertysheets
m._VERSION = "0.0.1"

--
-- Local functions
--
local function s_DoVSPropertySheets(prj)
	if prj.vspropertysheets ~= nil then
		premake.push('<ImportGroup Label="PropertySheets">')
		for i, v in ipairs(prj.vspropertysheets) do
			premake.w(string.format('<Import Project="%s" />', v))
		end
		premake.pop('</ImportGroup>')
	end
end

--
-- Override vs2010 project creation functions
--
require("vstudio")

premake.override(p.vstudio.vc2010.elements, "project", function(base, prj)
	local calls = base(prj)
	table.insertafter(calls, p.vstudio.vc2010.importExtensionSettings, s_DoVSPropertySheets)
	return calls
end)

--
-- `thismodule` variables and functions
--

include("_preload")
return m