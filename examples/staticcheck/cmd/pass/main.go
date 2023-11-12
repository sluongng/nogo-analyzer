package main

import (
	"fmt"
	"time"
)

func main() {
	d, err := time.Parse("01-02-2006", "01-01-2023")
	if err != nil {
		panic(err)
	}

	fmt.Printf("date: %s\n", d)
}
