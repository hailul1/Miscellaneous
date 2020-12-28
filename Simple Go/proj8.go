/* Luwam Hailu 
	This program creates a random list of numbers, the size of this list is determined
	by the command line argument, ranging from 0-1,000,000. These values are sorted using
	the quickSort algorithm, stats such as average, variance, and standard deviation are
	calculated, and the sorted data and stats are outputted. Run code as follows:
	go run proj8.go 50000 */

package main

import (
        "fmt"
	"os"
	"strconv"
	"math"
	"math/rand"
)

const MAX int = 1000000
const MIN int = 10

func getData(count int, values []int) []int{
var i int
for i = 0; i < count; i++ {
values = append(values, rand.Intn(10000))
}

return values
}

func displayNums(count int, values []int) {
var i int
var j int = 0
for i = 0; i < count; i++ {
fmt.Print(values[i], " ")
j++
if j == 10 {
fmt.Print("\n")
j =0
}
}
fmt.Print("\n")
}


func quickSort(values []int, lo int, hi int)  {
var i int = lo // i is lower index
var j int = hi // j is higher index

var h int 
var index = (lo+hi)/2
var x int = values[index]

for i <= j {
for values[i] < x {
i++
}
for values[j] > x {
j--
}
if i <= j {
h = values[i]
values[i] = values[j]
values[j] = h
i++
j--
}
}

if lo < j {
quickSort(values, lo, j)
} 
if i < hi {
quickSort(values, i, hi)
}
}


func stats(values []int, len int) (float64, float64, float64) {
var variance float64 = 0.0
var i int
var j int
var sd float64 = 0.0
var num float64 = 0
var ave float64 = 0
var total float64 = 0.0
for i = 0; i < len; i++ {
total = total + float64(values[i])
}
ave = total / float64(len)
var x float64 = 0
for j = 0; j < len; j++ {
x = float64(values[j]) - ave
x = math.Pow(x,2)
num = num + x
}
variance = num/(float64(len)-1)
sd = math.Sqrt(variance)
return variance, sd, ave
}

func displayData(count int, values []int, vari float64, sd float64, ave float64) {
fmt.Println("Sorted Values: ")
displayNums(count, values)
fmt.Print("Variance = ")
fmt.Println(vari)
fmt.Print("Standard Deviation = ")
fmt.Println(sd)
fmt.Print("Average = ")
fmt.Println(ave)
}

func main() {

if len(os.Args) < 2 {
fmt.Println("Please provide count of numbers to generate between 10 and 1,000,000")
} else {
var count_arg string = os.Args[1]
count, err := strconv.Atoi(count_arg)
if count < 10 {
fmt.Println("Number must be greater than or equal to 10")
os.Exit(0)
 } else if count > MAX {
fmt.Println("Number must be less than or equal to 1000000")
os.Exit(0)
}
if err != nil {
	fmt.Println("Error with value entered")
}
var  values []int
values = getData(count, values)
fmt.Println("Values before sort:")
displayNums(count, values)
var lo int = 0
var hi int = count-1
var vals []int = values[0:count]
quickSort(vals, lo, hi)
values = vals
fmt.Println("Sorting completed and statistics calculated\n")
vari, sd, ave := stats(values, count)
displayData(count, values, vari, sd, ave)
}
}
