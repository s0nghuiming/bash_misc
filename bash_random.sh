echo tensorflow_$(date +"%Y%m%d%H%M%S")_$(head -10 /dev/urandom|md5sum|cut -c 1-5)
