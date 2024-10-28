return {
    "lervag/vimtex",
    lazy=false,
    init=function ()
    vim.g.vimtex_view_method = 'zathura'
    vim.g.vimtex_syntax_enabled = 0
    vim.g.vimtex_compiler_latexmk = {
      options = {
        '-outdir=./PDF/',
         '-synctex=1'
      }
    }
    vim.g.vimtex_view_general_options = {
        '@./PDF/main.pdf'  -- %p will be replaced with the path to the PDF file
    }
  end
  }
