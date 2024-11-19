" Maintainer: Rolf Stargate

set background=dark
hi clear
if exists('syntax_on')
 syntax reset
endif
let g:colors_name='stargate'

" ### Javascript #################################################################
hi MyDebug guifg=#616161 guibg=NONE gui=NONE


hi cErrInBracket guifg=#de1d83 guibg=NONE gui=NONE

hi CodeBlock guifg=NONE guibg=#2F002C gui=NONE
hi Dash guifg=#630033 guibg=NONE gui=NONE
hi FloatTitle guifg=#d726c6 guibg=NONE gui=NONE
hi NormalFloat guifg=#d726c6 guibg=NONE gui=NONE
hi Normal guifg=#B1BAD4 guibg=#0f0016 gui=NONE
hi Comment guifg=#6272a4 guibg=NONE gui=italic
hi Constant guifg=#9372cb guibg=NONE gui=NONE
hi Character guifg=#e644f6 guibg=NONE gui=NONE
hi Number guifg=#d726c6 guibg=NONE gui=NONE
hi Boolean guifg=#82cfe0 guibg=NONE gui=NONE
hi Float guifg=#d726c6 guibg=NONE gui=NONE
hi Identifier guifg=#82cfe0 guibg=NONE gui=NONE
hi Function guifg=#de1d83 guibg=NONE gui=NONE
hi Statement guifg=#c4a4f9 guibg=NONE gui=NONE
hi Conditional guifg=#c3fc8e guibg=NONE gui=NONE
hi Repeat guifg=#2bff00 guibg=NONE gui=NONE
hi Label guifg=#82cfe0 guibg=NONE gui=NONE
hi Operator guifg=#c4a4f9 guibg=NONE gui=NONE
hi Keyword guifg=#9372cb guibg=NONE gui=italic
hi Exception guifg=#c4a4f9 guibg=NONE gui=NONE
hi PreProc guifg=#CD93D7 guibg=NONE gui=italic
hi Include guifg=#c4a4f9 guibg=NONE gui=NONE
hi Define guifg=#c4a4f9 guibg=NONE gui=NONE
hi Title guifg=#82cfe0 guibg=NONE gui=NONE
hi Macro guifg=#c4a4f9 guibg=NONE gui=NONE
hi PreCondit guifg=#82cfe0 guibg=NONE gui=NONE
hi Type guifg=#82cfe0 guibg=NONE gui=italic
hi StorageClass guifg=#c3fc8e guibg=NONE gui=NONE
hi Structure guifg=#de1d83 guibg=NONE gui=NONE
hi Typedef guifg=#de1d83 guibg=NONE gui=NONE
hi Special guifg=#c4a4f9 guibg=NONE gui=bold
hi SpecialComment guifg=#6272a4 guibg=NONE gui=NONE
hi Error guifg=#f44747 guibg=NONE gui=bold

hi @comment.todo guifg=#09a4f9 guibg=NONE gui=bold,italic
hi @comment.note guifg=#00E27B guibg=NONE gui=bold,italic
hi @comment.warning guifg=#c3fc8e guibg=NONE gui=bold,italic
hi @comment.error guifg=#f44747 guibg=NONE gui=bold,italic
" hi @text.note.rare guifg=#7E6575 guibg=NONE gui=bold,italic
hi @text.note.rare guifg=#7F89A9 guibg=NONE gui=bold,italic

hi Underlined guifg=#82cfe0 gui=NONE
hi Cursor guifg=NONE guibg=NONE gui=reverse
hi ColorColumn guifg=NONE guibg=#1E232A gui=NONE
hi CursorLineNr guifg=#abb2bf guibg=NONE gui=bold
hi SignColumn guifg=NONE guibg=#0f0016 gui=NONE
hi Conceal guifg=#6272a4 guibg=NONE gui=NONE
hi CursorColumn guifg=NONE guibg=#2c323c gui=NONE
hi CursorLine guifg=NONE guibg=#313131 gui=NONE
hi Directory guifg=#82cfe0 guibg=NONE gui=NONE
hi DiffAdd guifg=#e644f6 guibg=NONE gui=NONE
hi DiffChange guifg=#d726c6 guibg=NONE gui=NONE
hi DiffDelete guifg=#ff5555 guibg=NONE gui=NONE
hi DiffText guifg=#6272a4 guibg=NONE gui=NONE
hi ErrorMsg guifg=#f44747 guibg=NONE gui=NONE
hi VertSplit guifg=#181a1f guibg=NONE gui=NONE
hi Folded guifg=#6272a4 guibg=NONE gui=NONE
hi FoldColumn guifg=NONE guibg=NONE gui=NONE
hi IncSearch guifg=#310049 guibg=#25DB6C gui=NONE
hi LineNr guifg=#6272a4 guibg=NONE gui=NONE
hi MatchParen guifg=#F9CD00 guibg=NONE gui=NONE
hi NonText guifg=#3b4048 guibg=NONE gui=NONE
hi Pmenu guifg=#abb2bf guibg=#282c34 gui=NONE
hi PmenuSel guifg=#1e1e1e guibg=#82cfe0 gui=NONE
hi PmenuSbar guifg=NONE guibg=#3b4048 gui=NONE
hi PmenuThumb guifg=NONE guibg=#abb2bf gui=NONE
hi Question guifg=#c4a4f9 guibg=NONE gui=NONE
hi QuickFixLine guifg=#1e1e1e guibg=#de1d83 gui=NONE
hi Search guifg=#1e1e1e guibg=#de1d83 gui=NONE
hi SpecialKey guifg=#3b4048 guibg=NONE gui=NONE
hi StatusLine guifg=#abb2bf guibg=#2c323c gui=NONE
hi StatusLineNC guifg=#6272a4 guibg=NONE gui=NONE
hi StatusLineTerm guifg=#abb2bf guibg=#2c323c gui=NONE
hi StatusLineTermNC guifg=#2c323c guibg=NONE gui=NONE
hi TabLine guifg=#6272a4 guibg=NONE gui=NONE
hi TabLineSel guifg=#abb2bf guibg=NONE gui=NONE
hi TabLineFill guifg=NONE guibg=#0f0016 gui=NONE
hi Terminal guifg=#abb2bf guibg=#1e1e1e gui=NONE
hi Visual guifg=NONE guibg=#3e4452 gui=NONE
hi VisualNOS guifg=#3e4452 guibg=NONE gui=NONE
hi WarningMsg guifg=#de1d83 guibg=NONE gui=NONE
hi WildMenu guifg=#1e1e1e guibg=#82cfe0 gui=NONE
hi EndOfBuffer guifg=#1e1e1e guibg=NONE gui=NONE
hi TSError guifg=#f44747 guibg=NONE gui=NONE
hi TSPunctDelimiter guifg=#e5e5e2 guibg=NONE gui=NONE
hi TSPunctBracket guifg=#e5e5e2 guibg=NONE gui=NONE
hi TSPunctSpecial guifg=#2bff00 guibg=NONE gui=NONE
hi TSConstant guifg=#c4a4f9 guibg=NONE gui=NONE
hi TSConstBuiltin guifg=#c4a4f9 guibg=NONE gui=NONE
hi TSConstMacro guifg=#82cfe0 guibg=NONE gui=NONE
hi TSStringRegex guifg=#ff5555 guibg=NONE gui=NONE
hi TSString guifg=#de1d83 guibg=NONE gui=NONE
hi TSStringEscape guifg=#82cfe0 guibg=NONE gui=NONE
hi TSCharacter guifg=#e644f6 guibg=NONE gui=NONE
hi TSNumber guifg=#c4a4f9 guibg=NONE gui=NONE
hi TSBoolean guifg=#c4a4f9 guibg=NONE gui=NONE
hi TSFloat guifg=#e644f6 guibg=NONE gui=NONE
hi TSAnnotation guifg=#de1d83 guibg=NONE gui=NONE
hi TSAttribute guifg=#82cfe0 guibg=NONE gui=NONE
hi TSNamespace guifg=#ff00ff guibg=NONE gui=NONE
hi TSFuncBuiltin guifg=#82cfe0 guibg=NONE gui=NONE
hi TSFunction guifg=#e644f6 guibg=NONE gui=NONE
hi TSFuncMacro guifg=#e644f6 guibg=NONE gui=NONE
hi TSParameter guifg=#d726c6 guibg=NONE gui=NONE
hi TSParameterReference guifg=#d726c6 guibg=NONE gui=NONE
hi TSMethod guifg=#e644f6 guibg=NONE gui=NONE
hi TSField guifg=#d726c6 guibg=NONE gui=NONE
hi TSProperty guifg=#e5e5e2 guibg=NONE gui=NONE
hi TSConstructor guifg=#82cfe0 guibg=NONE gui=NONE
hi TSConditional guifg=#c3fc8e guibg=NONE gui=NONE
hi TSRepeat guifg=#2bff00 guibg=NONE gui=NONE
hi TSLabel guifg=#82cfe0 guibg=NONE gui=NONE
hi TSKeyword guifg=#c3fc8e guibg=NONE gui=NONE
hi TSKeywordFunction guifg=#82cfe0 guibg=NONE gui=NONE
hi TSKeywordOperator guifg=#c3fc8e guibg=NONE gui=NONE
hi TSOperator guifg=#c3fc8e guibg=NONE gui=NONE
hi TSException guifg=#c4a4f9 guibg=NONE gui=NONE
hi TSType guifg=#c3fc8e guibg=NONE gui=NONE
hi TSTypeBuiltin guifg=#82cfe0 guibg=NONE gui=italic
hi TSStructure guifg=#c4a4f9 guibg=NONE gui=NONE
hi TSInclude guifg=#c3fc8e guibg=NONE gui=NONE
hi TSVariableBuiltin guifg=#c4a4f9 guibg=NONE gui=NONE
hi TSText guifg=#ffff00 guibg=NONE gui=NONE
hi TSStrong guifg=#ffff00 guibg=NONE gui=NONE
hi TSEmphasis guifg=#ffff00 guibg=NONE gui=NONE
hi TSUnderline guifg=#ffff00 guibg=NONE gui=NONE
hi TSTitle guifg=#ffff00 guibg=NONE gui=NONE
hi TSLiteral guifg=#ffff00 guibg=NONE gui=NONE
hi TSURI guifg=#ffff00 guibg=NONE gui=NONE
hi TSTag guifg=#82cfe0 guibg=NONE gui=NONE
hi TSTagDelimiter guifg=#abb2bf guibg=NONE gui=NONE

hi @variable guifg=#B1BAD4 guibg=NONE gui=NONE
hi @punctuation guifg=#A3B5EA guibg=NONE gui=NONE
hi @string guifg=#BF7EB2 guibg=NONE gui=italic
hi @string.escape guifg=#98F09F guibg=NONE gui=bold
hi @character guifg=#c4a4f9 guibg=NONE gui=NONE
hi @character.escape guifg=NONE guibg=NONE gui=bold

" ### HTML #######################################################################
hi htmlH1 guifg=#FC8EE8 guibg=#fff gui=NONE
hi htmlH2 guifg=#c3fc8e guibg=NONE gui=NONE
hi htmlH3 guifg=#c3fc8e guibg=NONE gui=NONE
hi htmlH4 guifg=#c3fc8e guibg=NONE gui=NONE
hi htmlH5 guifg=#c3fc8e guibg=NONE gui=NONE
hi htmlH6 guifg=#c3fc8e guibg=NONE gui=NONE
hi htmlArg guifg=#de1d83 guibg=NONE gui=NONE
hi htmlBold guifg=#C89FF3 guibg=NONE gui=bold
hi htmlEndTag guifg=#abb2bf guibg=NONE gui=NONE
hi htmlError guifg=#de1d83 guibg=NONE gui=NONE
hi htmlItalic guifg=#c4a4f9 guibg=NONE gui=italic
hi htmlLink guifg=#849CFF guibg=NONE gui=NONE
hi htmlSpecialChar guifg=#de1d83 guibg=NONE gui=NONE
hi htmlSpecialTagName guifg=#82cfe0 guibg=NONE gui=NONE
hi htmlTag guifg=#c3fc8e guibg=NONE gui=NONE
hi htmlTagN guifg=#c3fc8e guibg=NONE gui=NONE
hi htmlTagName guifg=#82cfe0 guibg=NONE gui=NONE
hi htmlTitle guifg=#abb2bf guibg=NONE gui=NONE

" ### MARKDOWN ###################################################################
hi Headline1 guifg=#EAFFD5 guibg=#402342 gui=NONE
hi Headline2 guifg=#c3fc8e guibg=#311B33 gui=NONE
hi Headline3 guifg=#c3fc8e guibg=#231E33 gui=NONE
hi Headline4 guifg=#c3fc8e guibg=#231E33 gui=NONE
hi Headline5 guifg=#c3fc8e guibg=#231E33 gui=NONE
hi Headline6 guifg=#c3fc8e guibg=#231E33 gui=NONE

hi Arrow guifg=#616161 guibg=NONE gui=NONE
hi markdownBlockquote guifg=#de1d83 guibg=NONE gui=italic
hi markdownBold guifg=#C89FF3 guibg=NONE gui=bold
hi markdownCode guifg=#e644f6 guibg=NONE gui=NONE
hi markdownCodeBlock guifg=#d726c6 guibg=NONE gui=NONE
hi markdownCodeDelimiter guifg=#ff5555 guibg=NONE gui=NONE
hi markdownHeadingDelimiter guifg=#ff5555 guibg=NONE gui=NONE
hi markdownHeadingRule guifg=#6272a4 guibg=NONE gui=NONE
hi markdownId guifg=#c4a4f9 guibg=NONE gui=NONE
hi markdownIdDeclaration guifg=#82cfe0 guibg=NONE gui=NONE
hi markdownIdDelimiter guifg=#c4a4f9 guibg=NONE gui=NONE
hi markdownItalic guifg=#de1d83 guibg=NONE gui=italic
hi markdownLinkDelimiter guifg=#c4a4f9 guibg=NONE gui=NONE
hi markdownLinkText guifg=#c3fc8e guibg=NONE gui=NONE
hi markdownListMarker guifg=#82cfe0 guibg=NONE gui=NONE
hi markdownOrderedListMarker guifg=#ff5555 guibg=NONE gui=NONE
hi markdownRule guifg=#6272a4 guibg=NONE gui=NONE
hi markdownUrl guifg=#828FE0 guibg=NONE gui=underline

hi CocExplorerIndentLine guifg=#6272a4 guibg=NONE gui=NONE
hi CocExplorerBufferRoot guifg=#82cfe0 guibg=NONE gui=NONE
hi CocExplorerFileRoot guifg=#82cfe0 guibg=NONE gui=NONE
hi CocExplorerBufferFullPath guifg=#6272a4 guibg=NONE gui=NONE
hi CocExplorerFileFullPath guifg=#6272a4 guibg=NONE gui=NONE
hi CocExplorerBufferReadonly guifg=#ff5555 guibg=NONE gui=NONE
hi CocExplorerBufferModified guifg=#c4a4f9 guibg=NONE gui=NONE
hi CocExplorerBufferNameVisible guifg=#e644f6 guibg=NONE gui=NONE
hi CocExplorerFileReadonly guifg=#ff5555 guibg=NONE gui=NONE
hi CocExplorerFileModified guifg=#c4a4f9 guibg=NONE gui=NONE
hi CocExplorerFileHidden guifg=#6272a4 guibg=NONE gui=NONE
hi CocExplorerHelpLine guifg=#c4a4f9 guibg=NONE gui=NONE
hi EasyMotionTarget guifg=#f44747 guibg=NONE gui=bold
hi EasyMotionTarget2First guifg=#f44747 guibg=NONE gui=bold
hi EasyMotionTarget2Second guifg=#f44747 guibg=NONE gui=bold
hi EasyMotionShade guifg=NONE guibg=NONE gui=NONE
hi IlluminatedWordText guifg=#ffde00 guibg=NONE gui=NONE
hi IlluminatedWordRead guifg=#2bff00 guibg=NONE gui=NONE
hi IlluminatedWordWrite guifg=#2bff00 guibg=NONE gui=NONE
hi StartifyNumber guifg=#d726c6 guibg=NONE gui=NONE
hi StartifySelect guifg=#e644f6 guibg=NONE gui=NONE
hi StartifyBracket guifg=#c3fc8e guibg=NONE gui=NONE
hi StartifySpecial guifg=#82cfe0 guibg=NONE gui=NONE
hi StartifyVar guifg=#c3fc8e guibg=NONE gui=NONE
hi StartifyPath guifg=#82cfe0 guibg=NONE gui=NONE
hi StartifyFile guifg=#ff5555 guibg=NONE gui=NONE
hi StartifySlash guifg=#c3fc8e guibg=NONE gui=NONE
hi StartifyHeader guifg=#e644f6 guibg=NONE gui=NONE
hi StartifySection guifg=#c4a4f9 guibg=NONE gui=NONE
hi StartifyFooter guifg=#e644f6 guibg=NONE gui=NONE
hi WhichKey guifg=#c4a4f9 guibg=NONE gui=NONE
hi WhichKeySeperator guifg=#e644f6 guibg=NONE gui=NONE
hi WhichKeyGroup guifg=#82cfe0 guibg=NONE gui=NONE
hi WhichKeyDesc guifg=#82cfe0 guibg=NONE gui=NONE
hi diffAdded guifg=#e644f6 guibg=NONE gui=NONE
hi diffRemoved guifg=#ff5555 guibg=NONE gui=NONE
hi diffFileId guifg=#de1d83 guibg=NONE gui=bold,reverse
hi diffFile guifg=#3b4048 guibg=NONE gui=NONE
hi diffNewFile guifg=#e644f6 guibg=NONE gui=NONE
hi diffOldFile guifg=#ff5555 guibg=NONE gui=NONE

" ### Debug ######################################################################
hi debugPc guifg=#000 guibg=#4D4950 gui=bold,
hi debugBreakpoint guifg=#ff5555 guibg=NONE gui=reverse

" LSP
hi DiagnosticVirtualTextError guifg=#9078B9 guibg=NONE gui=NONE
hi DiagnosticUnderlineError guifg=#FF2F4B guibg=NONE gui=italic
hi DiagnosticVirtualTextWarn guifg=#9078B9 guibg=NONE gui=NONE
hi DiagnosticUnderlineWarn guifg=#DADA5C guibg=NONE gui=italic

" ### Vimwiki ####################################################################
hi VimwikiHeader1 guifg=#c4a4f9 guibg=NONE gui=bold
hi VimwikiHeader2 guifg=#c4a4f9 guibg=NONE gui=bold
hi VimwikiHeader3 guifg=#c4a4f9 guibg=NONE gui=bold
hi VimwikiHeader4 guifg=#c4a4f9 guibg=NONE gui=bold
hi VimwikiHeader5 guifg=#c4a4f9 guibg=NONE gui=bold
hi VimwikiHeader6 guifg=#c4a4f9 guibg=NONE gui=bold
hi VimwikiTodo guifg=#c4a4f9 guibg=NONE gui=bold
hi VimwikiLink guifg=#82cfe0 guibg=NONE gui=NONE
hi VimwikiBold guifg=#B6DD5A guibg=NONE gui=bold
hi VimwikiItalic guifg=#93D8BA guibg=NONE gui=italic
hi VimwikiHeaderChar guifg=#F6447E guibg=NONE gui=NONE
hi VimwikiHR guifg=#de1d83 guibg=NONE gui=NONE
hi VimwikiList guifg=#d726c6 guibg=NONE gui=NONE
hi VimwikiTag guifg=#d726c6 guibg=NONE gui=NONE
hi VimwikiMarkers guifg=#6272a4 guibg=NONE gui=NONE

" ### SPELL ######################################################################
hi SpellBad guifg=#B2B2B2 guibg=NONE gui=NONE
hi SpellCap guifg=#B2B2B2 guibg=NONE gui=NONE
hi SpellLocal guifg=#B2B2B2 guibg=NONE gui=NONE
hi SpellRare guifg=#B2B2B2 guibg=NONE gui=NONE
