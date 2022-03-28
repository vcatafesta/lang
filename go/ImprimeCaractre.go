package main

import "fmt"

func sum(nums ...int) {
	fmt.Print(nums, " ")
	total := 0
	for _, num := range nums {
		total += num
	}
	fmt.Println(total)
}

func imprimeCaractere(car ...string) {
	fmt.Println(car)
	for _, c := range car {
		fmt.Print(c, "\n")
	}

}

func main() {
	sum(1, 2, 5)
	sum(1, 2, 3)



	imprimeCaractere("VILMAR", "CATAFESTA")
	imprimeCaractere()

	char := []string{"a", "b", "c"}
	imprimeCaractere(char...)

	nums := []int{1, 2, 3, 4}
	sum(nums...)
}
