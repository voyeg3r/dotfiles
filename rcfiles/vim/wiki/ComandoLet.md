
let contador++
contador=$((contador+1))

let commands is used to perform arithmetic operations on shell variables.

$ cat arith.sh
#!/bin/bash

    let arg1=12
    let arg2=11

    let add=$arg1+$arg2
    let sub=$arg1-$arg2
    let mul=$arg1*$arg2
    let div=$arg1/$arg2
    echo $add $sub $mul $div

    $ ./arith.sh
    23 1 132 1
