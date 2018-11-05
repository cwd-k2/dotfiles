" a function for loading plugin-related configs, after loading all basic configs.
" plugins should be named as 'group/subgroup/basename' in dein.toml
" and their configuration files should be 'a:plugin_config_dir/group/subgroup/basename.vim'
" when using this function, you have to name the root directory for plugin config files
function! SourcePluginConfigsIn(plugin_config_dir) abort
    for plugin in keys(dein#get())
        let l:p_file = g:nvim_dir . '/' . a:plugin_config_dir . '/' . dein#get(plugin)['name'] . '.vim'
        if filereadable(l:p_file) | exec 'source '. l:p_file | endif
    endfor
endfunction
