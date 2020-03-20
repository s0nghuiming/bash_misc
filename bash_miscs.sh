# Options:
# Define arguments of programs
function setup_args() {
    local options=
    local src=
    local dest=
    while [ $# -gt 0 ]
    do
        case "$1" in
            -o|--option)
                options=$2
                shift
                ;;
            -s|--source)
                src=$2
                SOURCE=$src
                SOURCE2=${src}_GEN
                shift
                ;;
            -d|--destination)
                dest=$2
                DEST=$dest
                shift
                ;;
        esac
        shift
    done
    echo ${options}
    for opt in $(echo "$options" | sed "s/,/ /g")
    do
        eval $(echo $opt)
    done
}
setup_args $@
