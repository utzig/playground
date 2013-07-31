// Tour of Go
// Exercise: Loops and Functions
//   Square root function using Newton's method.

package main

import (
  "fmt"
  "math"
)

func Sqrt(x float64) float64 {
  z := x
  last := float64(0)
  var i int
  for i = 0; i < 10 && last != z; i++ {
    last = z
    z = z - ((z * z - x) / (2 * z))
    //fmt.Printf("last=%v, z=%v\n", last, z)
  }
  return z
}

func main() {
  for i := 1; i <= 10; i++ {
    fmt.Printf("Sqrt(%v) = %v, math.Sqrt = %v\n", i, Sqrt(float64(i)), math.Sqrt(float64(i)))
  }
}
