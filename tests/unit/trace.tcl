start_server {tags {"trace"}} {
    test {TRACE CONFIG on} {
        r config set tracestates yes
    } {OK}

    test {TRACEADD and TRACEKEYS keys} {
        r traceadd x y z
    } {OK}


    test {TRACEDEL keys} {
        r tracedel x z
        r tracekeys
    } {y}

    test {TRACESHOW key} {
        r traceshow y
    } {{20*} {20*}}

    test {TRACE CONFIG off} {
        r tracedel y 
        r config set tracestates no 
        r traceadd x
    } {{Trace function is off now}}
}
