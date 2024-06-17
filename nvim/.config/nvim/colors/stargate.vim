" Maintainer: Rolf Stargate

set background=dark
hi clear
if exists('syntax_on')
  syntax reset
endif
let g:colors_name='stargate'

" ### Javascript #################################################################
hi MyDebug guifg=#616161 ctermfg=171 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE


hi cErrInBracket guifg=#de1d83 ctermfg=162 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE

hi CodeBlock guifg=NONE ctermfg=171 guibg=#2F002C ctermbg=NONE gui=NONE cterm=NONE
hi Dash guifg=#630033 ctermfg=171 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi FloatTitle guifg=#d726c6 ctermfg=164 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi NormalFloat guifg=#d726c6 ctermfg=164 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Normal guifg=#e5e5e2 ctermfg=254 guibg=#0f0016 ctermbg=232 gui=NONE cterm=NONE
hi Comment guifg=#6272a4 ctermfg=61 guibg=NONE ctermbg=NONE gui=italic cterm=italic
hi Constant guifg=#9372cb ctermfg=98 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi String guifg=#b7acc1 ctermfg=249 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Character guifg=#e644f6 ctermfg=171 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Number guifg=#d726c6 ctermfg=164 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Boolean guifg=#82cfe0 ctermfg=116 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Float guifg=#d726c6 ctermfg=164 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Identifier guifg=#82cfe0 ctermfg=116 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Function guifg=#de1d83 ctermfg=162 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Statement guifg=#c4a4f9 ctermfg=183 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Conditional guifg=#c3fc8e ctermfg=192 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Repeat guifg=#2bff00 ctermfg=46 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Label guifg=#82cfe0 ctermfg=116 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Operator guifg=#c4a4f9 ctermfg=183 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Keyword guifg=#9372cb ctermfg=98 guibg=NONE ctermbg=NONE gui=italic cterm=italic
hi Exception guifg=#c4a4f9 ctermfg=183 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi PreProc guifg=#CD93D7 ctermfg=162 guibg=NONE ctermbg=NONE gui=italic cterm=italic
hi Include guifg=#c4a4f9 ctermfg=183 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Define guifg=#c4a4f9 ctermfg=183 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Title guifg=#82cfe0 ctermfg=116 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Macro guifg=#c4a4f9 ctermfg=183 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi PreCondit guifg=#82cfe0 ctermfg=116 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Type guifg=#82cfe0 ctermfg=116 guibg=NONE ctermbg=NONE gui=italic cterm=italic
hi StorageClass guifg=#c3fc8e ctermfg=192 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Structure guifg=#de1d83 ctermfg=162 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Typedef guifg=#de1d83 ctermfg=162 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Special guifg=#c4a4f9 ctermfg=183 guibg=NONE ctermbg=NONE gui=bold cterm=bold
hi SpecialComment guifg=#6272a4 ctermfg=61 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Error guifg=#f44747 ctermfg=203 guibg=NONE ctermbg=NONE gui=bold,reverse cterm=bold,reverse
hi Todo guifg=#c4a4f9 ctermfg=183 guibg=NONE ctermbg=NONE gui=bold,italic cterm=bold,italic
hi Underlined guifg=#82cfe0 ctermfg=116 gui=NONE cterm=NONE
hi Cursor guifg=NONE ctermfg=NONE guibg=NONE ctermbg=NONE gui=reverse cterm=reverse
hi ColorColumn guifg=NONE ctermfg=NONE guibg=#2c323c ctermbg=236 gui=NONE cterm=NONE
hi CursorLineNr guifg=#abb2bf ctermfg=249 guibg=NONE ctermbg=NONE gui=bold cterm=bold
hi SignColumn guifg=NONE ctermfg=NONE guibg=#0f0016 ctermbg=232 gui=NONE cterm=NONE
hi Conceal guifg=#6272a4 ctermfg=61 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi CursorColumn guifg=NONE ctermfg=NONE guibg=#2c323c ctermbg=236 gui=NONE cterm=NONE
hi CursorLine guifg=NONE ctermfg=NONE guibg=#313131 ctermbg=236 gui=NONE cterm=NONE
hi Directory guifg=#82cfe0 ctermfg=116 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi DiffAdd guifg=#e644f6 ctermfg=234 guibg=NONE ctermbg=171 gui=NONE cterm=NONE
hi DiffChange guifg=#d726c6 ctermfg=164 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi DiffDelete guifg=#ff5555 ctermfg=203 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi DiffText guifg=#6272a4 ctermfg=61 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi ErrorMsg guifg=#f44747 ctermfg=203 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi VertSplit guifg=#181a1f ctermfg=234 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Folded guifg=#6272a4 ctermfg=61 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi FoldColumn guifg=NONE ctermfg=NONE guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi IncSearch guifg=#310049 ctermfg=162 guibg=#25DB6C ctermbg=61 gui=NONE cterm=NONE
hi LineNr guifg=#6272a4 ctermfg=61 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi MatchParen guifg=#F9CD00 ctermfg=254 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi NonText guifg=#3b4048 ctermfg=238 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Pmenu guifg=#abb2bf ctermfg=249 guibg=#282c34 ctermbg=236 gui=NONE cterm=NONE
hi PmenuSel guifg=#1e1e1e ctermfg=234 guibg=#82cfe0 ctermbg=116 gui=NONE cterm=NONE
hi PmenuSbar guifg=NONE ctermfg=NONE guibg=#3b4048 ctermbg=238 gui=NONE cterm=NONE
hi PmenuThumb guifg=NONE ctermfg=NONE guibg=#abb2bf ctermbg=249 gui=NONE cterm=NONE
hi Question guifg=#c4a4f9 ctermfg=183 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi QuickFixLine guifg=#1e1e1e ctermfg=234 guibg=#de1d83 ctermbg=162 gui=NONE cterm=NONE
hi Search guifg=#1e1e1e ctermfg=234 guibg=#de1d83 ctermbg=162 gui=NONE cterm=NONE
hi SpecialKey guifg=#3b4048 ctermfg=238 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi StatusLine guifg=#abb2bf ctermfg=249 guibg=#2c323c ctermbg=236 gui=NONE cterm=NONE
hi StatusLineNC guifg=#6272a4 ctermfg=61 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi StatusLineTerm guifg=#abb2bf ctermfg=249 guibg=#2c323c ctermbg=236 gui=NONE cterm=NONE
hi StatusLineTermNC guifg=#2c323c ctermfg=236 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TabLine guifg=#6272a4 ctermfg=61 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TabLineSel guifg=#abb2bf ctermfg=249 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TabLineFill guifg=NONE ctermfg=NONE guibg=#0f0016 ctermbg=232 gui=NONE cterm=NONE
hi Terminal guifg=#abb2bf ctermfg=249 guibg=#1e1e1e ctermbg=234 gui=NONE cterm=NONE
hi Visual guifg=NONE ctermfg=NONE guibg=#3e4452 ctermbg=238 gui=NONE cterm=NONE
hi VisualNOS guifg=#3e4452 ctermfg=238 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi WarningMsg guifg=#de1d83 ctermfg=162 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi WildMenu guifg=#1e1e1e ctermfg=234 guibg=#82cfe0 ctermbg=116 gui=NONE cterm=NONE
hi EndOfBuffer guifg=#1e1e1e ctermfg=234 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSError guifg=#f44747 ctermfg=203 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSPunctDelimiter guifg=#e5e5e2 ctermfg=254 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSPunctBracket guifg=#e5e5e2 ctermfg=254 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSPunctSpecial guifg=#2bff00 ctermfg=46 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSConstant guifg=#c4a4f9 ctermfg=183 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSConstBuiltin guifg=#c4a4f9 ctermfg=183 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSConstMacro guifg=#82cfe0 ctermfg=116 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSStringRegex guifg=#ff5555 ctermfg=203 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSString guifg=#de1d83 ctermfg=162 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSStringEscape guifg=#82cfe0 ctermfg=116 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSCharacter guifg=#e644f6 ctermfg=171 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSNumber guifg=#c4a4f9 ctermfg=183 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSBoolean guifg=#c4a4f9 ctermfg=183 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSFloat guifg=#e644f6 ctermfg=171 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSAnnotation guifg=#de1d83 ctermfg=162 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSAttribute guifg=#82cfe0 ctermfg=116 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSNamespace guifg=#ff00ff ctermfg=201 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSFuncBuiltin guifg=#82cfe0 ctermfg=116 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSFunction guifg=#e644f6 ctermfg=171 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSFuncMacro guifg=#e644f6 ctermfg=171 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSParameter guifg=#d726c6 ctermfg=164 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSParameterReference guifg=#d726c6 ctermfg=164 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSMethod guifg=#e644f6 ctermfg=171 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSField guifg=#d726c6 ctermfg=164 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSProperty guifg=#e5e5e2 ctermfg=254 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSConstructor guifg=#82cfe0 ctermfg=116 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSConditional guifg=#c3fc8e ctermfg=192 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSRepeat guifg=#2bff00 ctermfg=46 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSLabel guifg=#82cfe0 ctermfg=116 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSKeyword guifg=#c3fc8e ctermfg=192 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSKeywordFunction guifg=#82cfe0 ctermfg=116 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSKeywordOperator guifg=#c3fc8e ctermfg=192 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSOperator guifg=#c3fc8e ctermfg=192 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSException guifg=#c4a4f9 ctermfg=183 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSType guifg=#c3fc8e ctermfg=192 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSTypeBuiltin guifg=#82cfe0 ctermfg=116 guibg=NONE ctermbg=NONE gui=italic cterm=italic
hi TSStructure guifg=#c4a4f9 ctermfg=183 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSInclude guifg=#c3fc8e ctermfg=192 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSVariable guifg=#e5e5e2 ctermfg=254 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSVariableBuiltin guifg=#c4a4f9 ctermfg=183 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSText guifg=#ffff00 ctermfg=226 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSStrong guifg=#ffff00 ctermfg=226 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSEmphasis guifg=#ffff00 ctermfg=226 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSUnderline guifg=#ffff00 ctermfg=226 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSTitle guifg=#ffff00 ctermfg=226 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSLiteral guifg=#ffff00 ctermfg=226 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSURI guifg=#ffff00 ctermfg=226 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSTag guifg=#82cfe0 ctermfg=116 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSTagDelimiter guifg=#abb2bf ctermfg=249 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE

" ### HTML #######################################################################
hi htmlH1 guifg=#FC8EE8 ctermfg=192 guibg=#fff ctermbg=NONE gui=NONE cterm=NONE
hi htmlH2 guifg=#c3fc8e ctermfg=192 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi htmlH3 guifg=#c3fc8e ctermfg=192 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi htmlH4 guifg=#c3fc8e ctermfg=192 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi htmlH5 guifg=#c3fc8e ctermfg=192 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi htmlH6 guifg=#c3fc8e ctermfg=192 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi htmlArg guifg=#de1d83 ctermfg=162 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi htmlBold guifg=#C89FF3 ctermfg=162 guibg=NONE ctermbg=NONE gui=bold cterm=bold
hi htmlEndTag guifg=#abb2bf ctermfg=249 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi htmlError guifg=#de1d83 ctermfg=NONE guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi htmlItalic guifg=#c4a4f9 ctermfg=183 guibg=NONE ctermbg=NONE gui=italic cterm=italic
hi htmlLink guifg=#849CFF ctermfg=171 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi htmlSpecialChar guifg=#de1d83 ctermfg=162 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi htmlSpecialTagName guifg=#82cfe0 ctermfg=116 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi htmlTag guifg=#c3fc8e ctermfg=192 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi htmlTagN guifg=#c3fc8e ctermfg=192 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi htmlTagName guifg=#82cfe0 ctermfg=116 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi htmlTitle guifg=#abb2bf ctermfg=249 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE

" ### MARKDOWN ###################################################################
hi Headline1 guifg=#EAFFD5 ctermfg=192 guibg=#402342 ctermbg=NONE gui=NONE cterm=NONE
hi Headline2 guifg=#c3fc8e ctermfg=192 guibg=#311B33 ctermbg=NONE gui=NONE cterm=NONE
hi Headline3 guifg=#c3fc8e ctermfg=192 guibg=#231E33 ctermbg=NONE gui=NONE cterm=NONE
hi Headline4 guifg=#c3fc8e ctermfg=192 guibg=#231E33 ctermbg=NONE gui=NONE cterm=NONE
hi Headline5 guifg=#c3fc8e ctermfg=192 guibg=#231E33 ctermbg=NONE gui=NONE cterm=NONE
hi Headline6 guifg=#c3fc8e ctermfg=192 guibg=#231E33 ctermbg=NONE gui=NONE cterm=NONE

hi Arrow guifg=#616161 ctermfg=171 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi markdownBlockquote guifg=#de1d83 ctermfg=162 guibg=NONE ctermbg=NONE gui=italic cterm=italic
hi markdownBold guifg=#C89FF3 ctermfg=164 guibg=NONE ctermbg=NONE gui=bold cterm=bold
hi markdownCode guifg=#e644f6 ctermfg=171 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi markdownCodeBlock guifg=#d726c6 ctermfg=164 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi markdownCodeDelimiter guifg=#ff5555 ctermfg=203 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi markdownHeadingDelimiter guifg=#ff5555 ctermfg=203 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi markdownHeadingRule guifg=#6272a4 ctermfg=61 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi markdownId guifg=#c4a4f9 ctermfg=183 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi markdownIdDeclaration guifg=#82cfe0 ctermfg=116 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi markdownIdDelimiter guifg=#c4a4f9 ctermfg=183 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi markdownItalic guifg=#de1d83 ctermfg=162 guibg=NONE ctermbg=NONE gui=italic cterm=italic
hi markdownLinkDelimiter guifg=#c4a4f9 ctermfg=183 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi markdownLinkText guifg=#c3fc8e ctermfg=192 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi markdownListMarker guifg=#82cfe0 ctermfg=116 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi markdownOrderedListMarker guifg=#ff5555 ctermfg=203 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi markdownRule guifg=#6272a4 ctermfg=61 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi markdownUrl guifg=#828FE0 ctermfg=116 guibg=NONE ctermbg=NONE gui=underline cterm=underline

hi CocExplorerIndentLine guifg=#6272a4 ctermfg=61 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi CocExplorerBufferRoot guifg=#82cfe0 ctermfg=116 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi CocExplorerFileRoot guifg=#82cfe0 ctermfg=116 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi CocExplorerBufferFullPath guifg=#6272a4 ctermfg=61 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi CocExplorerFileFullPath guifg=#6272a4 ctermfg=61 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi CocExplorerBufferReadonly guifg=#ff5555 ctermfg=203 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi CocExplorerBufferModified guifg=#c4a4f9 ctermfg=183 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi CocExplorerBufferNameVisible guifg=#e644f6 ctermfg=171 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi CocExplorerFileReadonly guifg=#ff5555 ctermfg=203 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi CocExplorerFileModified guifg=#c4a4f9 ctermfg=183 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi CocExplorerFileHidden guifg=#6272a4 ctermfg=61 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi CocExplorerHelpLine guifg=#c4a4f9 ctermfg=183 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi EasyMotionTarget guifg=#f44747 ctermfg=203 guibg=NONE ctermbg=NONE gui=bold cterm=bold
hi EasyMotionTarget2First guifg=#f44747 ctermfg=203 guibg=NONE ctermbg=NONE gui=bold cterm=bold
hi EasyMotionTarget2Second guifg=#f44747 ctermfg=203 guibg=NONE ctermbg=NONE gui=bold cterm=bold
hi EasyMotionShade guifg=NONE ctermfg=NONE guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi IlluminatedWordText guifg=#ffde00 ctermfg=220 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi IlluminatedWordRead guifg=#2bff00 ctermfg=46 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi IlluminatedWordWrite guifg=#2bff00 ctermfg=46 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi StartifyNumber guifg=#d726c6 ctermfg=164 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi StartifySelect guifg=#e644f6 ctermfg=171 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi StartifyBracket guifg=#c3fc8e ctermfg=192 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi StartifySpecial guifg=#82cfe0 ctermfg=116 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi StartifyVar guifg=#c3fc8e ctermfg=192 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi StartifyPath guifg=#82cfe0 ctermfg=116 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi StartifyFile guifg=#ff5555 ctermfg=203 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi StartifySlash guifg=#c3fc8e ctermfg=192 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi StartifyHeader guifg=#e644f6 ctermfg=171 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi StartifySection guifg=#c4a4f9 ctermfg=183 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi StartifyFooter guifg=#e644f6 ctermfg=171 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi WhichKey guifg=#c4a4f9 ctermfg=183 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi WhichKeySeperator guifg=#e644f6 ctermfg=171 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi WhichKeyGroup guifg=#82cfe0 ctermfg=116 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi WhichKeyDesc guifg=#82cfe0 ctermfg=116 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi diffAdded guifg=#e644f6 ctermfg=171 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi diffRemoved guifg=#ff5555 ctermfg=203 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi diffFileId guifg=#de1d83 ctermfg=162 guibg=NONE ctermbg=NONE gui=bold,reverse cterm=bold,reverse
hi diffFile guifg=#3b4048 ctermfg=238 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi diffNewFile guifg=#e644f6 ctermfg=171 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi diffOldFile guifg=#ff5555 ctermfg=203 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE

" ### Debug ######################################################################
hi debugPc guifg=#000 ctermfg=NONE guibg=#4D4950 ctermbg=NONE gui=bold, cterm=NONE
hi debugBreakpoint guifg=#ff5555 ctermfg=203 guibg=NONE ctermbg=NONE gui=reverse cterm=reverse

" LSP
hi DiagnosticVirtualTextError guifg=#9078B9 ctermfg=164 guibg=NONE ctermbg=NONE gui=NONE cterm=bold
hi DiagnosticUnderlineError guifg=#FF2F4B ctermfg=164 guibg=NONE ctermbg=NONE gui=italic cterm=bold
hi DiagnosticVirtualTextWarn guifg=#9078B9 ctermfg=164 guibg=NONE ctermbg=NONE gui=NONE cterm=bold
hi DiagnosticUnderlineWarn guifg=#F8F724 ctermfg=164 guibg=NONE ctermbg=NONE gui=italic cterm=bold

" ### Vimwiki ####################################################################
hi VimwikiHeader1 guifg=#c4a4f9 ctermfg=164 guibg=NONE ctermbg=NONE gui=bold cterm=bold
hi VimwikiHeader2 guifg=#c4a4f9 ctermfg=171 guibg=NONE ctermbg=NONE gui=bold cterm=bold
hi VimwikiHeader3 guifg=#c4a4f9 ctermfg=192 guibg=NONE ctermbg=NONE gui=bold cterm=bold
hi VimwikiHeader4 guifg=#c4a4f9 ctermfg=116 guibg=NONE ctermbg=NONE gui=bold cterm=bold
hi VimwikiHeader5 guifg=#c4a4f9 ctermfg=162 guibg=NONE ctermbg=NONE gui=bold cterm=bold
hi VimwikiHeader6 guifg=#c4a4f9 ctermfg=183 guibg=NONE ctermbg=NONE gui=bold cterm=bold
hi VimwikiLink guifg=#82cfe0 ctermfg=116 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi VimwikiBold guifg=#c4a4f9 ctermfg=116 guibg=NONE ctermbg=NONE gui=bold cterm=bold
hi VimwikiItalic guifg=#93D8BA ctermfg=116 guibg=NONE ctermbg=NONE gui=italic cterm=italic
hi VimwikiHeaderChar guifg=#F6447E ctermfg=61 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi VimwikiHR guifg=#de1d83 ctermfg=162 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi VimwikiList guifg=#d726c6 ctermfg=164 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi VimwikiTag guifg=#d726c6 ctermfg=164 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi VimwikiMarkers guifg=#6272a4 ctermfg=61 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE

" ### SPELL ######################################################################
hi SpellBad guifg=#B2B2B2 ctermfg=203 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi SpellCap guifg=#B2B2B2 ctermfg=162 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi SpellLocal guifg=#B2B2B2 ctermfg=162 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi SpellRare guifg=#B2B2B2 ctermfg=162 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
