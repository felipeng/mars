#!/bin/bash

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

for teste in $testes; do
    expect=${teste/:*/}
    commands=${teste/*:/}
    result=$($post$commands)
    debug="$expect $result $commands"

    if [ $expect == $result ]; then
        echo "OK - $debug"
    else
        echo "NOK - $debug"
    fi
done
