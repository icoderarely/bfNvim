return {
	name = "clangd",
	-- cmd = { "clangd" },
	cmd = {
		"clangd",
		"--fallback-style={BasedOnStyle: LLVM, IndentWidth: 4, TabWidth: 4, UseTab: Never}",
	},
	filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
	root_markers = {
		".clangd",
		".clang-tidy",
		".clang-format",
		"compile_commands.json",
		"compile_flags.txt",
		"configure.ac",
		"main.cpp",
	},
}
