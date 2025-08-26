function fkill -d 'Fuzzy find processes and kill them'
    set -l pids (ps -ef | fzf -m | awk '{print $2}')

    if test -n "$pids"
        echo $pids | xargs kill -9
    end 
end
