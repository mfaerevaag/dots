set -l plugins_root "$__fish_config_dir/plugins"

set -l plugin_order \
    fish-ssh-agent \
    nvm \
    wd-fish \
    compression \
    dots \
    theme-bobthefish

for plugin in $plugin_order
    set -l plugin_dir "$plugins_root/$plugin"

    if test -d "$plugin_dir/functions"
        if not contains -- "$plugin_dir/functions" $fish_function_path
            set -p fish_function_path "$plugin_dir/functions"
        end
    end

    if test -d "$plugin_dir/completions"
        if not contains -- "$plugin_dir/completions" $fish_complete_path
            set -p fish_complete_path "$plugin_dir/completions"
        end
    end
end

for plugin in $plugin_order
    set -l plugin_conf_dir "$plugins_root/$plugin/conf.d"
    if test -d "$plugin_conf_dir"
        for conf_file in "$plugin_conf_dir"/*.fish
            if test -f "$conf_file"
                source "$conf_file"
            end
        end
    end
end
