function pkgver --description 'Print full version of last git tag'
    echo (git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g')
end
