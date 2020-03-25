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


# Input text from inline
cat << EOF >> /etc/pam.d/slurm
account  required  pam_unix.so
account  required  pam_slurm.so
auth     required  pam_localuser.so
session  required  pam_limits.so
EOF

# Input text for a while loop
while read line
do
  echo $line
done << EOF1
ab
cd
EOF1
