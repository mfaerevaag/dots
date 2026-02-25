function compress --description 'Compress files into bundle'
    set format $argv[1]
    set archive_name $argv[2]$format

    # no files given
    if [ (count $argv) -lt 3 ]
        echo 'error: no files given'
        return
    end

    set files $argv[3..-1]

    set msg 'compressing files to'

    switch $format
        case '.zip'
            echo $msg $archive_name ...
            zip -r $archive_name $files

        case '.tar'
            echo $msg $archive_name ...
            tar -cvf $archive_name $files

        case '.tar.gz'
            echo $msg $archive_name ...
            tar -zcvf $archive_name $files

        case '.tar.bz2'
            echo $msg $archive_name ...
            tar -jcvf $archive_name $files

        case '*'
            echo 'error: unknown format \'$format\''
    end
end
