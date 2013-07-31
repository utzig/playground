// Go Tour
// Exercise: Complex cube roots
//    Newton's method for cube roots

package main

import (
    "fmt"
    "math/cmplx"
)

func Cbrt(x complex128) complex128 {
  z := x
  last := complex128(0)
  var i int
  for i = 0; i < 10 && last != z; i++ {
    last = z
    z = z - ((cmplx.Pow(z, 3) - x) / (3 * cmplx.Pow(z, 2)))
    //fmt.Printf("last=%v, z=%v\n", last, z)
  }
  return z
}

func main() {
    x := Cbrt(2)
    fmt.Println(x)
    fmt.Println(cmplx.Pow(x, 3))
    x = Cbrt(complex(2, 2))
    fmt.Println(x)
    fmt.Println(cmplx.Pow(x, 3))
}
