# premake-vspropertysheets
```lua
require("premake5-modules/vspropertysheets")
workspace("MyWorkspace")
	configurations({ "Debug", "Release" })
project("MyProject")
	kind("ConsoleApp")
	language("C")
	files({
		"src/**.c",
	})
	filter("action:vs*")
		vspropertysheets({
			"D:\\dev2\\foo.props",
			"D:\\dev2\\bar.props",
		})
```
