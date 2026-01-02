# https://github.com/dideler/dotfiles/blob/master/.config/fish/functions/extract.fish

function extract --description "Expand or extract bundled & compressed files"
    for file in $argv
        if ! test -f $file
            echo "error: file '$file' is not valid"
        else
            switch $file
                case '*.tar'
                    tar -xvf $file
                case '*.tar.bz2' '*.tbz2'
                    tar -jxvf $file
                case '*.tar.gz' '*.tgz'
                    tar -zxvf $file
                case '*.bz2'
                    bunzip2 $file
                    # Can also use: bzip2 -d $file
                case '*.gz'
                    gunzip $file
                case '*.rar'
                    unrar x $file
                case '*.zip' '*.ZIP'
                    unzip $file
                case '*.pax'
                    pax -r < $file
                case '*'
                    echo "error: extension of '$file' not recognized"
            end
        end
    end
end
