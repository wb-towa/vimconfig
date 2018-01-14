set background=dark "or light
highlight clear
if exists("syntax_on")
	syntax reset
endif
let g:colors_name = "vivify"
set t_Co=256
highlight Boolean             guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight CTagsClass          guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight CTagsGlobalConstant guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight CTagsGlobalVariable guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight CTagsImport         guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight CTagsMember         guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight Character           guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight Comment             guifg=#cd8b00 ctermfg=172                           gui=none cterm=none
highlight Conditional         guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight Constant            guifg=#ffcd8b ctermfg=222                           gui=none cterm=none
highlight Cursor              guifg=#404040 ctermfg=238 guibg=#8b8bff ctermbg=105 gui=none cterm=none
highlight CursorColumn        guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight CursorLine          guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight Debug               guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight Define              guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight DefinedName         guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight Delimiter           guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight DiffAdd             guifg=#ffffcd ctermfg=230 guibg=#306d30 ctermbg=71  gui=none cterm=none
highlight DiffChange          guifg=#ffffcd ctermfg=230 guibg=#306b8f ctermbg=74  gui=none cterm=none
highlight DiffDelete          guifg=#ffffcd ctermfg=230 guibg=#6d3030 ctermbg=131 gui=none cterm=none
highlight DiffText            guifg=#f0ad6d ctermfg=215                           gui=none cterm=none
highlight Directory           guifg=#00ff8b ctermfg=48                            gui=none cterm=none
highlight EnumerationName     guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight EnumerationValue    guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight Error               guifg=#ffffff ctermfg=15  guibg=#6e2e2e ctermbg=131 gui=none cterm=none
highlight ErrorMsg            guifg=#ffffff ctermfg=15  guibg=#ce4e4e ctermbg=167 gui=none cterm=none
highlight Exception           guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight Float               guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight FoldColumn          guifg=#8b8bcd ctermfg=104 guibg=#2e2e2e ctermbg=236 gui=none cterm=none
highlight Folded              guifg=#cfcfcd ctermfg=187 guibg=#4b208f ctermbg=98  gui=none cterm=none
highlight Function            guifg=#cfbfad ctermfg=180                           gui=none cterm=none
highlight Identifier          guifg=#ff8bff ctermfg=213                           gui=none cterm=none
highlight Ignore              guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight IncSearch           guifg=#303030 ctermfg=236 guibg=#cd8b60 ctermbg=173 gui=none cterm=none
highlight Include             guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight Keyword             guifg=#cfbfad ctermfg=180                           gui=none cterm=none
highlight Label               guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight LineNr              guifg=#8b8bcd ctermfg=104 guibg=#2e2e2e ctermbg=236 gui=none cterm=none
highlight LocalVariable       guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight Macro               guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight MatchParen          guifg=#404040 ctermfg=238 guibg=#8fff8b ctermbg=120 gui=none cterm=none
highlight ModeMsg             guifg=#7e7eae ctermfg=103                           gui=none cterm=none
highlight MoreMsg             guifg=#7e7eae ctermfg=103                           gui=none cterm=none
highlight NonText             guifg=#8b8bcd ctermfg=104                           gui=none cterm=none
highlight Normal              guifg=#cfbfad ctermfg=180 guibg=#1e1e27 ctermbg=60  gui=none cterm=none
highlight Number              guifg=#f0ad6d ctermfg=215                           gui=none cterm=none
highlight Operator            guifg=#cfbfad ctermfg=180                           gui=none cterm=none
highlight PMenu               guifg=#eeeeee ctermfg=255 guibg=#4e4e8f ctermbg=61  gui=none cterm=none
highlight PMenuSbar           guifg=#eeeeee ctermfg=255 guibg=#6e6eaf ctermbg=61  gui=none cterm=none
highlight PMenuSel            guifg=#eeeeee ctermfg=255 guibg=#2e2e3f ctermbg=60  gui=none cterm=none
highlight PMenuThumb          guifg=#eeeeee ctermfg=255 guibg=#6e6eaf ctermbg=61  gui=none cterm=none
highlight PreCondit           guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight PreProc             guifg=#409090 ctermfg=73                            gui=none cterm=none
highlight Question            guifg=#ffcd00 ctermfg=220                           gui=none cterm=none
highlight Repeat              guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight Search              guifg=#303030 ctermfg=236 guibg=#cd8b60 ctermbg=173 gui=none cterm=none
highlight SignColumn          guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight Special             guifg=#c080d0 ctermfg=176                           gui=none cterm=none
highlight SpecialChar         guifg=#c080d0 ctermfg=176 guibg=#404040 ctermbg=238 gui=none cterm=none
highlight SpecialComment      guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight SpecialKey          guifg=#ab60ed ctermfg=135                           gui=none cterm=none
"the original vivify hides away the spell error sqiggly line which is wrong. I made it red. Too
"red in fact so for SpellBad,SpellCap, SpellLocal,SpellRare I removed guifg=#ff0000 because it was 
"too much red. I may still change it if I can think of another colour that goes with the scheme and 
"isn't an eye sore.
highlight SpellBad            guisp=#ff0000 ctermfg=255                           gui=undercurl cterm=none
highlight SpellCap            guisp=#ff0000 ctermfg=255                           gui=undercurl cterm=none
highlight SpellLocal          guisp=#ff0000 ctermfg=255                           gui=undercurl cterm=none
highlight SpellRare           guisp=#ff0000 ctermfg=255                           gui=undercurl cterm=none
highlight Statement           guifg=#808bed ctermfg=105                           gui=none cterm=none
highlight StatusLine          guifg=#b9b9b9 ctermfg=250 guibg=#3e3e5e ctermbg=60  gui=none cterm=none
highlight StatusLineNC        guifg=#b9b9b9 ctermfg=250 guibg=#3e3e5e ctermbg=60  gui=none cterm=none
highlight StorageClass        guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight String              guifg=#ffcd8b ctermfg=222 guibg=#404040 ctermbg=238 gui=none cterm=none
highlight Structure           guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight TabLine             guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight TabLineFill         guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight TabLineSel          guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight Tag                 guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight Title               guifg=#af4f4b ctermfg=131                           gui=none cterm=none
highlight Todo                guifg=#303030 ctermfg=236 guibg=#d0a060 ctermbg=179 gui=none cterm=none
highlight Type                guifg=#ff8bff ctermfg=213                           gui=none cterm=none
highlight Typedef             guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight Underlined          guifg=#df9f2d ctermfg=172                           gui=none cterm=none
highlight Union               guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight VertSplit           guifg=#b9b9b9 ctermfg=250 guibg=#3e3e5e ctermbg=60  gui=none cterm=none
highlight Visual              guifg=#eeeeee ctermfg=255 guibg=#4e4e8f ctermbg=61  gui=none cterm=none
highlight VisualNOS           guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight WarningMsg          guifg=#ffffff ctermfg=15  guibg=#ce8e4e ctermbg=215 gui=none cterm=none
highlight WildMenu            guifg=#eeeeee ctermfg=255 guibg=#6e6eaf ctermbg=61  gui=none cterm=none
highlight pythonBuiltin       guifg=#cfbfad ctermfg=180                           gui=none cterm=none
highlight JavaScriptStrings   guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight phpStringSingle     guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight phpStringDouble     guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight htmlString          guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight htmlTagName         guifg=#eeeeee ctermfg=255                           gui=none cterm=none
