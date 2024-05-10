off_readonly multi_option
multi_option() {
   local end="$2" i=0 loop=false
   [ -z "$1" ] && return 0
   [[ "$3" == "loop" ]] && loop=true 
   while true; do
      i=$(($i+1))
      if $yes; then ui_print "${n} [i] Selected $i" && setdefault "$1" $i && return $i
      else ui_print " [>> Option: $(($i+1))"
      fi
      if is_number $end && is_greater_equal $i $end; then if $loop; then i=0; echo " "; continue; else setdefault "$1" ""; return 0; fi; fi
   done
}
# FOR NOW, EVERYTIME YOU MENTION "multi_option"
# MODIFIED BINARY WILL RUN, INSTEAD OF ORIGINAL ONE.

