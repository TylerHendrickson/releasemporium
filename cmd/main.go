package main

import (
	"fmt"
	"os"
)

func main() {
	if len(os.Args[1:]) > 0 {
		name := os.Args[1]
		fmt.Printf("O, hai %s!\n", name)
		return
	}
	fmt.Println("O, hai!")
}
