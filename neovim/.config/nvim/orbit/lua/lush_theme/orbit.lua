local lush = require('lush')
local hsl = lush.hsl

local colors = {
    night = {
        '#121214',
        hsl('#242424'),
        hsl('#4e4e4f'),
    },
    mercury = {
        hsl('#9b98a1'),
    },
    mars = {
        hsl('#ad6242'),
        hsl('#a34a3e'),
    },
    venus = {
        hsl('#c89d62'),
    },
    earth = {
        hsl('#3b8ac4'),
    },
    sol = {
        hsl('#fff4ea'),
    }
}

---@diagnostic disable: undefined-global
return lush(function (added)
    local sym = added.sym

    return {
        -- The following are the Neovim (as of 0.8.0-dev+100-g371dfb174) highlight
        -- groups, mostly used for styling UI elements.
        -- Comment them out and add your own properties to override the defaults.
        -- An empty definition `{}` will clear all styling, leaving elements looking
        -- like the 'Normal' group.
        -- To be able to link to a group, it must already be defined, so you may have
        -- to reorder items as you go.
        --
        -- See :h highlight-groups
        --
        -- ColorColumn    { }, -- Columns set with 'colorcolumn'
        Conceal        { fg = colors.night[3] }, -- Placeholder characters substituted for concealed text (see 'conceallevel')
        Cursor         { }, -- Character under the cursor
        CurSearch      { fg = colors.night[1], bg = colors.venus[1] }, -- Highlighting a search pattern under the cursor (see 'hlsearch')
        -- lCursor        { Cursor }, -- Character under the cursor when |language-mapping| is used (see 'guicursor')
        -- CursorIM       { Cursor }, -- Like Cursor, but used when in IME mode |CursorIM|
        -- CursorColumn   { }, -- Screen-column at the cursor, when 'cursorcolumn' is set.
        CursorLine     { bg = colors.night[2] }, -- Screen-line at the cursor, when 'cursorline' is set. Low-priority if foreground (ctermfg OR guifg) is not set.
        Directory      { fg = colors.sol[1] }, -- Directory names (and other special names in listings)
        -- DiffAdd        { }, -- Diff mode: Added line |diff.txt|
        -- DiffChange     { }, -- Diff mode: Changed line |diff.txt|
        -- DiffDelete     { }, -- Diff mode: Deleted line |diff.txt|
        -- DiffText       { }, -- Diff mode: Changed text within a changed line |diff.txt|
        -- EndOfBuffer    { }, -- Filler lines (~) after the end of the buffer. By default, this is highlighted like |hl-NonText|.
        -- TermCursor     { }, -- Cursor in a focused terminal
        -- TermCursorNC   { }, -- Cursor in an unfocused terminal
        ErrorMsg       { fg = colors.mars[2] }, -- Error messages on the command line
        VertSplit      { fg = colors.night[2] }, -- Column separating vertically split windows
        Folded         { fg = colors.night[3], bg = colors.night[2] }, -- Line used for closed folds
        FoldColumn     { fg = colors.earth[1] }, -- 'foldcolumn'
        SignColumn     { fg = colors.earth[1] }, -- Column where |signs| are displayed
        IncSearch      { fg = colors.earth[1], bg = colors.night[2] }, -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
        Substitute     { CurSearch }, -- |:substitute| replacement text highlighting
        LineNr         { fg = colors.venus[1] }, -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
        -- LineNrAbove    { }, -- Line number for when the 'relativenumber' option is set, above the cursor line
        -- LineNrBelow    { }, -- Line number for when the 'relativenumber' option is set, below the cursor line
        CursorLineNr   { fg = colors.mars[1] }, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
        -- CursorLineFold { }, -- Like FoldColumn when 'cursorline' is set for the cursor line
        -- CursorLineSign { }, -- Like SignColumn when 'cursorline' is set for the cursor line
        MatchParen     { bg = colors.night[3] }, -- Character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
        ModeMsg        { fg = colors.earth[1] }, -- 'showmode' message (e.g., "-- INSERT -- ")
        MsgArea        { fg = colors.mercury[1] }, -- Area for messages and cmdline
        MsgSeparator   { fg = colors.earth[1] }, -- Separator for scrolled messages, `msgsep` flag of 'display'
        MoreMsg        { fg = colors.earth[1] }, -- |more-prompt|
        NonText        { fg = colors.night[2] }, -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
        Normal         { fg = colors.mercury[1], bg = colors.night[1] }, -- Normal text
        NormalFloat    { Normal, bg = colors.night[1] }, -- Normal text in floating windows.
        FloatBorder    { fg = colors.earth[1] }, -- Border of floating windows.
        FloatTitle     { fg = colors.sol[1] }, -- Title of floating windows.
        -- NormalNC       { }, -- normal text in non-current windows
        Pmenu          { Normal, bg = colors.night[2] }, -- Popup menu: Normal item.
        PmenuSel       { Pmenu, fg = colors.venus[1], bg = colors.mars[1] }, -- Popup menu: Selected item.
        -- PmenuKind      { }, -- Popup menu: Normal item "kind"
        -- PmenuKindSel   { }, -- Popup menu: Selected item "kind"
        -- PmenuExtra     { }, -- Popup menu: Normal item "extra text"
        -- PmenuExtraSel  { }, -- Popup menu: Selected item "extra text"
        PmenuSbar      { bg = colors.night[2] }, -- Popup menu: Scrollbar.
        PmenuThumb     { bg = colors.mercury[1] }, -- Popup menu: Thumb of the scrollbar.
        Question       { fg = colors.earth[1], gui = "bold" }, -- |hit-enter| prompt and yes/no questions
        -- QuickFixLine   { }, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
        Search         { CurSearch }, -- Last search pattern highlighting (see 'hlsearch'). Also used for similar items that need to stand out.
        -- SpecialKey     { }, -- Unprintable characters: text displayed differently from what it really is. But not 'listchars' whitespace. |hl-Whitespace|
        -- SpellBad       { }, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
        -- SpellCap       { }, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
        -- SpellLocal     { }, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
        -- SpellRare      { }, -- Word that is recognized by the spellchecker as one that is hardly ever used. |spell| Combined with the highlighting used otherwise.
        StatusLine     { fg = colors.earth[1], bg = colors.night[2] }, -- Status line of current window
        StatusLineNC   { StatusLine, bg = colors.night[1] }, -- Status lines of not-current windows. Note: If this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
        TabLine        { fg = colors.mercury[1], bg = colors.night[1] }, -- Tab pages line, not active tab page label
        TabLineFill    { TabLine }, -- Tab pages line, where there are no labels
        TabLineSel     { TabLine, bg = colors.night[3] }, -- Tab pages line, active tab page label
        Title          { fg = colors.sol[1] }, -- Titles for output from ":set all", ":autocmd" etc.
        Visual         { bg = colors.night[2] }, -- Visual mode selection
        -- VisualNOS      { }, -- Visual mode selection when vim is "Not Owning the Selection".
        WarningMsg     { fg = colors.mars[2] }, -- Warning messages
        -- Whitespace     { }, -- "nbsp", "space", "tab" and "trail" in 'listchars'
        -- Winseparator   { }, -- Separator between window splits. Inherts from |hl-VertSplit| by default, which it will replace eventually.
        -- WildMenu       { }, -- Current match in 'wildmenu' completion
        -- WinBar         { }, -- Window bar of current window
        -- WinBarNC       { }, -- Window bar of not-current windows

        -- Common vim syntax groups used for all kinds of code and markup.
        -- Commented-out groups should chain up to their preferred (*) group
        -- by default.
        --
        -- See :h group-name
        --
        -- Uncomment and edit if you want more specific syntax highlighting.

        Comment        { fg = colors.night[3] }, -- Any comment

        Constant       { fg = colors.venus[1] }, -- (*) Any constant
        String         { Constant, italic = true }, --   A string constant: "this is a string"
        Character      { Constant }, --   A character constant: 'c', '\n'
        Number         { fg = colors.earth[1] }, --   A number constant: 234, 0xff
        Boolean        { fg = colors.mars[1] }, --   A boolean constant: TRUE, false
        Float          { Number }, --   A floating point constant: 2.3e10

        Identifier     { fg = colors.sol[1] }, -- (*) Any variable name
        Function       { fg = colors.earth[1] }, --   Function name (also: methods for classes)

        Statement      { fg = colors.mercury[1] }, -- (*) Any statement
        Conditional    { fg = colors.earth[1] }, --   if, then, else, endif, switch, etc.
        Repeat         { fg = colors.mars[1] }, --   for, do, while, etc.
        Label          { fg = colors.earth[1] }, --   case, default, etc.
        Operator       { fg = colors.mars[2] }, --   "sizeof", "+", "*", etc.
        Keyword        { fg = colors.mars[1] }, --   any other keyword
        Exception      { fg = colors.venus[1] }, --   try, catch, throw

        PreProc        { fg = colors.earth[1] }, -- (*) Generic Preprocessor
        Include        { PreProc }, --   Preprocessor #include
        Define         { PreProc }, --   Preprocessor #define
        Macro          { PreProc, fg = colors.earth[1].da(10), gui = "italic" }, --   Same as Define
        PreCondit      { PreProc }, --   Preprocessor #if, #else, #endif, etc.

        Type           { fg = colors.venus[1] }, -- (*) int, long, char, etc.
        StorageClass   { fg = colors.venus[1] }, --   static, register, volatile, etc.
        Structure      { fg = colors.venus[1] }, --   struct, union, enum, etc.
        Typedef        { fg = colors.mars[1] }, --   A typedef

        Special        { fg = colors.venus[1] }, -- (*) Any special symbol
        SpecialChar    { fg = colors.earth[1] }, --   Special character in a constant
        Tag            { }, --   You can use CTRL-] on this
        Delimiter      { }, --   Character that needs attention
        SpecialComment { fg = colors.earth[1] }, --   Special things inside a comment (e.g. '\n')
        Debug          { fg = colors.mars[1] }, --   Debugging statements

        Underlined     { gui = "underline" }, -- Text that stands out, HTML links
        Ignore         { fg = colors.night[3] }, -- Left blank, hidden |hl-Ignore| (NOTE: May be invisible here in template)
        Error          { fg = colors.mars[2], gui = "underline" }, -- Any erroneous construct
        Todo           { fg = colors.mars[1], bg = colors.night[2] }, -- Anything that needs extra attention; mostly the keywords TODO FIXME and XXX

        -- These groups are for the native LSP client and diagnostic system. Some
        -- other LSP clients may use these groups, or use their own. Consult your
        -- LSP client's documentation.

        -- See :h lsp-highlight, some groups may not be listed, submit a PR fix to lush-template!
        --
        -- LspReferenceText            { } , -- Used for highlighting "text" references
        -- LspReferenceRead            { } , -- Used for highlighting "read" references
        -- LspReferenceWrite           { } , -- Used for highlighting "write" references
        -- LspCodeLens                 { } , -- Used to color the virtual text of the codelens. See |nvim_buf_set_extmark()|.
        -- LspCodeLensSeparator        { } , -- Used to color the seperator between two or more code lens.
        -- LspSignatureActiveParameter { } , -- Used to highlight the active parameter in the signature help. See |vim.lsp.handlers.signature_help()|.

        -- See :h diagnostic-highlights, some groups may not be listed, submit a PR fix to lush-template!
        --
        DiagnosticError            { fg = colors.mars[2] } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
        DiagnosticWarn             { fg = colors.mars[1] } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
        DiagnosticInfo             { fg = colors.mercury[1] } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
        DiagnosticHint             { fg = colors.earth[1] } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
        DiagnosticOk               { fg = colors.night[3] } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
        -- DiagnosticVirtualTextError { } , -- Used for "Error" diagnostic virtual text.
        -- DiagnosticVirtualTextWarn  { } , -- Used for "Warn" diagnostic virtual text.
        -- DiagnosticVirtualTextInfo  { } , -- Used for "Info" diagnostic virtual text.
        -- DiagnosticVirtualTextHint  { } , -- Used for "Hint" diagnostic virtual text.
        -- DiagnosticVirtualTextOk    { } , -- Used for "Ok" diagnostic virtual text.
        DiagnosticUnderlineError   { sp = colors.mars[2].da(60), underline = true } , -- Used to underline "Error" diagnostics.
        DiagnosticUnderlineWarn    { DiagnosticUnderlineError, sp = colors.mars[1].da(60) } , -- Used to underline "Warn" diagnostics.
        DiagnosticUnderlineInfo    { sp = colors.earth[1].da(20), underline = true } , -- Used to underline "Info" diagnostics.
        -- DiagnosticUnderlineHint    { } , -- Used to underline "Hint" diagnostics.
        -- DiagnosticUnderlineOk      { } , -- Used to underline "Ok" diagnostics.
        -- DiagnosticFloatingError    { } , -- Used to color "Error" diagnostic messages in diagnostics float. See |vim.diagnostic.open_float()|
        -- DiagnosticFloatingWarn     { } , -- Used to color "Warn" diagnostic messages in diagnostics float.
        -- DiagnosticFloatingInfo     { } , -- Used to color "Info" diagnostic messages in diagnostics float.
        -- DiagnosticFloatingHint     { } , -- Used to color "Hint" diagnostic messages in diagnostics float.
        -- DiagnosticFloatingOk       { } , -- Used to color "Ok" diagnostic messages in diagnostics float.
        -- DiagnosticSignError        { } , -- Used for "Error" signs in sign column.
        -- DiagnosticSignWarn         { } , -- Used for "Warn" signs in sign column.
        -- DiagnosticSignInfo         { } , -- Used for "Info" signs in sign column.
        -- DiagnosticSignHint         { } , -- Used for "Hint" signs in sign column.
        -- DiagnosticSignOk           { } , -- Used for "Ok" signs in sign column.

        -- Tree-Sitter syntax groups.
        --
        -- See :h treesitter-highlight-groups, some groups may not be listed,
        -- submit a PR fix to lush-template!
        --
        -- Tree-Sitter groups are defined with an "@" symbol, which must be
        -- specially handled to be valid lua code, we do this via the special
        -- sym function. The following are all valid ways to call the sym function,
        -- for more details see https://www.lua.org/pil/5.html
        --
        -- sym("@text.literal")
        -- sym('@text.literal')
        -- sym"@text.literal"
        -- sym'@text.literal'
        --
        -- For more information see https://github.com/rktjmp/lush.nvim/issues/109

        -- sym"@text.literal"      { }, -- Comment
        -- sym"@text.reference"    { }, -- Identifier
        -- sym"@text.title"        { }, -- Title
        sym"@text.uri"          { fg = colors.earth[1], gui = "underline" }, -- Underlined
        -- sym"@text.underline"    { }, -- Underlined
        -- sym"@text.todo"         { }, -- Todo
        -- sym"@comment"           { }, -- Comment
        -- sym"@punctuation"       { }, -- Delimiter
        sym"@constant"          { gui = "bold" }, -- Constant
        sym"@constant.builtin"  { gui = "bold" }, -- Special
        -- sym"@constant.macro"    { }, -- Define
        sym"@define"            { gui = "bold" }, -- Define
        -- sym"@macro"             { }, -- Macro
        sym"@string"            { fg = colors.venus[1].darken(25) }, -- String
        -- sym"@string.escape"     { }, -- SpecialChar
        -- sym"@string.special"    { }, -- SpecialChar
        -- sym"@character"         { }, -- Character
        -- sym"@character.special" { }, -- SpecialChar
        -- sym"@number"            { }, -- Number
        -- sym"@boolean"           { }, -- Boolean
        -- sym"@float"             { }, -- Float
        sym"@function"          { fg = colors.earth[1] }, -- Function
        sym"@function.builtin"  { }, -- Special
        sym"@function.macro"    { gui = "italic" }, -- Macro
        sym"@parameter"         { gui = "italic" }, -- Identifier
        -- sym"@method"            { }, -- Function
        -- sym"@field"             { }, -- Identifier
        sym"@property"          { }, -- Identifier
        -- sym"@constructor"       { }, -- Special
        -- sym"@conditional"       { }, -- Conditional
        -- sym"@repeat"            { }, -- Repeat
        -- sym"@label"             { }, -- Label
        -- sym"@operator"          { }, -- Operator
        -- sym"@keyword"           { }, -- Keyword
        -- sym"@exception"         { }, -- Exception
        -- sym"@variable"          { }, -- Identifier
        -- sym"@type"              { fg = colors.mercury[1] }, -- Type
        -- sym"@type.definition"   { }, -- Typedef
        -- sym"@storageclass"      { }, -- StorageClass
        -- sym"@structure"         { }, -- Structure
        -- sym"@namespace"         { }, -- Identifier
        -- sym"@include"           { }, -- Include
        -- sym"@preproc"           { }, -- PreProc
        -- sym"@debug"             { }, -- Debug
        -- sym"@tag"               { }, -- Tag 

        CmpItemAbbrMatch { Normal },
        CmpItemKindVariable { Identifier },
        CmpItemKindInterface { Typedef },
        CmpItemKindFunction { Function },
        CmpItemKindMethod { CmpItemKindFunction },

        CmpItemKindKeyword { Keyword },
        CmpItemKindProperty { sym"@property" },
        CmpItemKindUnit { sym"@constant.builtin" },
    }
end)
