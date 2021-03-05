This code is to parse a kv pairs string separate by space into OS env.
String like ARGUMENTS="A=1 B=2 a:LD_LIBRARY_PATH=${HOME}/lib"
Here a leading char 'a' is to say you want to append an item into an already exist variable.
```bash
for c in ${PLATFORM_ARGUMENTS} ${ARGUMENTS}; do
    case $(expr index $c :) in
        0)
            export $c;
            ;;
        *)
            opt_=$(echo $c | cut -d: -f1)
            kv_=$(echo $c | cut -d: -f2)
            k_=$(echo $kv_ | cut -d= -f1)
            v_=$(echo $kv_ | cut -d= -f2)
            if [ "${opt_}" == "a" ]; then
                eval export ${k_}=${v_}:\\\$${k_}
            fi
            ;;
    esac
done
```
