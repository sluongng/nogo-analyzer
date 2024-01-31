package main

import (
	"time"
)

func main() {
	_, _ = time.Parse("01-01-2023", "2023-01-01")
	if !!true {
		time.Sleep(1)
	}
}
