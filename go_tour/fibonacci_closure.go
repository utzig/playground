// Go Tour
// Exercise: Fibonacci closure

package main

import "fmt"

// fibonacci is a function that returns
// a function that returns an int.
func fibonacci() func() int {
    x := 0
    y := 1
    fib := x
    return func() int {
        fib = x
        x = y
        y += fib
        return fib
    }
}

func main() {
    f := fibonacci()
    for i := 0; i < 10; i++ {
        fmt.Println(f())
    }
}
