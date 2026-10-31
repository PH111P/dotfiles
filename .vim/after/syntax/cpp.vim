syn keyword Type u8 u16 u32 u64 s8 s16 s32 s64
syn match Identifier '\<p_[_A-Za-z0-9]*\>'
syn match cCustomMember '\<m_[_A-Za-z0-9]*\>'
syn match Underlined '\<_[_A-Za-z0-9]*\>'
syn match CursorLineNr '\<[A-Z][_A-Z0-9]*\>'

syn match cCustomClass    "[A-Z]*\s*::"

hi def link cCustomScope  Function
hi def link cCustomClass  Function
hi def link cCustomMember Special

