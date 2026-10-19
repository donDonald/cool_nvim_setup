return {
        cmd = { "clangd", "--background-index", "--clang-tidy", "--header-insertion=iwyu" },
        filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
        root_markers = {
                "compile_commands.json",
                "compile_flags.txt",
                ".clangd",
                "CMakeLists.txt",
                "Makefile",
                ".git",
        },
        init_options = {
                usePlaceholders = true,
                completeUnimported = true,
                clangdFileStatus = true,
        },
        capabilities = {
                offsetEncoding = { "utf-16" },
                textDocument = {
                        completion = { editsNearCursor = true },
                },
        },
}
