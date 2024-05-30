require('code_runner').setup({

    filetype = {
        python = "python3 -u",
        typescript = "bun run",
        javascript = "bun run",
        cs = "dotnet run",
        c = function(...)
            c_base = {
                "cd $dir &&",
                "gcc $fileName -o",
                "/tmp/$fileNameWIthoutExt",
            }
            local c_exec = {
                "&& /tmp/$fileNameWithoutExt &&",
                "rm /tmp/$fileNameWithoutExt",
            }
            vim.ui.input({ prompt = "Add more args:" }, function(input)
                c_base[4] = input
                vim.print(vim.tbl_extend("force", c_base, c_exec))
                require("code_runner.commands").run_from_fn(vim.list_extend(c_base,c_exec))
            end)
        end,
    },
})


