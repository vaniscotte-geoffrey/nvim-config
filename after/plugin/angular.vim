" Forcer le runner Jasmine (vim-test intégré)
let g:test#javascript#runner = 'npm run test:headless'

" Optionnel : s'assurer que tous les fichiers spec.ts sont testables
let g:test#javascript#jasmine#file_pattern = '\.spec\.ts$'

