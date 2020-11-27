# set timer
START=$SECONDS

# remove old results
rm -rf results_10M

# run traces
n=0
pids=()
for trace in traces/*
do
    echo Running $trace
    ./run_champsim.sh bimodal-no-no-no-no-lru-1core 1 10 $(basename $trace) &
    pids[$n]=$!
    let n++
done

# compile the extractor
g++ -O2 -w -o extract extract.cpp

# wait for all processes to complete
for pid in ${pids[*]}
do
    echo Waiting $pid
    wait $pid
done

# extract hit rates
echo
echo --------------- RESULTS ---------------
for result in results_10M/*
do
    ./extract $(basename $result) < $result
done
echo ---------------------------------------

let TIME=$SECONDS-$START
echo
echo Time elapsed: $TIME seconds
