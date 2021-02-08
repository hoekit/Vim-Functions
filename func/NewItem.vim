" newitem.vim
" - Creates a new markdown item

" DESCRIPTION {{{
"
" This function helps to create a new item in a markdown file. Markdown
" items have the following structure:
"
"     ----
"     <a id="26"></a>
"     ## 26. Writing a Vim function to use with mdown
"     __ Steps:
"
"         1: Yank current line
"         2: Go to end of buffer
"         3: Paste yanked line
"         4: Copy the number at the start of the line, used in step 9
"         ... <snipped>
"     ..
"
" Lines between '__ Steps:' and '..' are folded automatcally giving a
" nicely folded structure. Useful to give an overview of the item
"
"     ----
"     <a id="26"></a>
"     ## 26. Writing a Vim function to use with mdown
"     +-- 15 lines: __ Steps:--------------------------------------
"
" Each markdown item has a corresponding entry in the table of contents
" at the top of the markdown file:
"
"     # vim - Everything
"
"     ## Contents
"     [
"     1. How to print to a postscript file
"     2. Source .vimrc interactively
"     ... <snipped>
"     26. Writing a Vim function to use with mdown
"     ]
"
" The table of contents provide an easy way to find items.
"
" For the longest time, after the item header has been added to the
" table of contents, the item itself was manually created with the help
" of a template file because of a lack of know-how in Vim programming
"
" This function is a first foray into Vim programming to learn more
" about Vim programming and also to scratch an itch.
"
" }}}

function! NewItem()                         " {{{
    let l:lstr = getline(".")               " Store current line into l:lstr

                                            " Extract the number prefix
                                            "   e.g. 10. Create a function
    let l:inum = strpart(l:lstr, 0, match(l:lstr, '\.'))
                                            " Extracts '10'

                                            " Create new item as follows
    call append('$', '----')                " ----
                                            " <a id="10"></a> 
    call append('$', '<a id="'.l:inum.'"></a>')
    call append('$', '## '.l:lstr)          " ## 10. Create a function
    call append('$', '__ ')                 " __ 
                                            "    ^ Cursor here for editing
    call append('$', '..')                  " ..

    call cursor(line('$')-1, 3)             " Go to end of buffer
endfunction                                 " }}}

