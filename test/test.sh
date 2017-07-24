#!/bin/bash

python app/mars.py &
PID=$!
sleep 2

post="curl -s --request POST http://localhost:8080/rest/mars/"

testes="
(2,0,S):MMRMMRMM
(0,2,W):MML
(2,2,S):MMRMMR
(1,3,N):RMMMMLMMMLMMMR
(0,0,S):MMMMLLMMMM
(4,4,E):MMRMMLMMRMM
(0,4,W):MMRMMLMMLMM
(0,4,N):MMMM
(0,0,N):MMMMRMMMMRMMMMRMMMMR
(4,4,N):RMLMRMLMRMLMRMLM
(2,2,N):RMMLMM
(2,2,N):RMMLMMRRLL
(4,3,W):MMMRMMMMLL
"

rm -f mars_test.log
RETURN=0

for teste in $testes; do
    expect=${teste/:*/}
    commands=${teste/*:/}
    result=$($post$commands)
    debug="$expect $result $commands"

    if [ $expect == $result ]; then
        echo "OK - $debug" >> mars_test.log
    else
        echo "NOK - $debug" >> mars_test.log
        RETURN=1
    fi
done

kill -9 $PID 1>/dev/null 2>/dev/null

cat mars_test.log
rm -f mars_test.log

if [ $RETURN == "1" ]; then
   exit 1
else
   exit 0
fi

