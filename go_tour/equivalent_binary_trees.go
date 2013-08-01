// vim: set ts=4 noet:

package main

import (
	"fmt"
	"code.google.com/p/go-tour/tree"
)

func WalkHelper(t *tree.Tree, ch chan int) {
	if t.Left != nil {
		WalkHelper(t.Left, ch)
	}
	ch <- t.Value
	if t.Right != nil {
		WalkHelper(t.Right, ch)
	}
}

func Walk(t *tree.Tree, ch chan int) {
	WalkHelper(t, ch)
	close(ch)
}

func Same(t1, t2 *tree.Tree) bool {
	ch1 := make(chan int)
	ch2 := make(chan int)
	go Walk(t1, ch1)
	go Walk(t2, ch2)
	for i := 0; i < 10; i++ {
		if <-ch1 != <-ch2 {
			return false
		}
	}
	return true
}

func main() {
	ch := make(chan int)
	go Walk(tree.New(1), ch)
	for i := range ch {
		fmt.Println(i)
	}
	ch = make(chan int)
	go Walk(tree.New(2), ch)
	for i := range ch {
		fmt.Println(i)
	}
	fmt.Println(Same(tree.New(1), tree.New(1)))
	fmt.Println(Same(tree.New(2), tree.New(2)))
	fmt.Println(Same(tree.New(1), tree.New(2)))
	fmt.Println(Same(tree.New(2), tree.New(1)))
}
