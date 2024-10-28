local lspconfig = require "lspconfig"

local function load_dictionary(file_path)
    local words = {}
    if vim.fn.filereadable(file_path) == 1 then
        for line in io.lines(file_path) do
            line = line:match("^%s*(.-)%s*$")  -- Rimuove spazi all'inizio e alla fine
            if line ~= "" then
                table.insert(words, line)
            end
        end
    else
        print("File non trovato: " .. file_path)
    end
    return words
end

-- Configurazione di ltex-ls
lspconfig.ltex.setup {
    filetypes = { "tex", "bib" },
    settings = {
        ltex = {
            language = "it",
            additionalLanguages = { "en-US" },
            dictionary = {
                ["it"] = load_dictionary(vim.fn.stdpath("config") .. "/dict/english3.txt"),  -- Percorso per l'inglese
            },
            additionalRules = {
              enablePickyRules = true,
              hiddenFalsePositive = true,
              enableNumbAsWords = false,
              allowNumericalWords = true,
            },
            disabledRules = {
              ["it"] = {
                "ST_04_001",
                "ST_01_005"
              }
            }
        },
    },
}

