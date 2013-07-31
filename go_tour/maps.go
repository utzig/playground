// Go Tour
// Exercise: Slices

package main

import (
    "strings"
    "code.google.com/p/go-tour/wc"
)

func WordCount(s string) map[string]int {
    fields := strings.Fields(s)
    wc := make(map[string]int)
    for i := 0; i < len(fields); i++ {
        wc[fields[i]]++
    }
    return wc
}

func main() {
    wc.Test(WordCount)
}
