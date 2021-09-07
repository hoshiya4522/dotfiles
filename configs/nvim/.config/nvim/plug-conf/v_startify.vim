let g:startify_custom_header = [
    \ ' _   ___     _____ __  __ ',
    \ '| \ | \ \   / /_ _|  \/  |',
    \ '|  \| |\ \ / / | || |\/| |',
    \ '| |\  | \ V /  | || |  | |',
    \ '|_| \_|  \_/  |___|_|  |_|',
    \]

let g:startify_lists = [
    \ { 'type': 'dir',       'header': ['   Current Directory '. getcwd()] },
    \ { 'type': 'files',     'header': ['   Files']            },
    \ { 'type': 'sessions',  'header': ['   Sessions']       },
    \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
    \ ]
