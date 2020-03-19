package main

import "fmt"

func main() {
	fmt.Println(fmt.Sprintf("sum of 2 and 5 is %v", sum(2, 5)))
	fmt.Println("hello world")
}

func sum(x, y int) int {
	return x + y
}
