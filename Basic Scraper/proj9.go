
/* Luwam Hailu 
	This program is a webscraper that creates a list of external links and a list of image files
	found at the URL, and downloads the image files at the url, for a series of UNLV websites.
	This program performs the scraping in parallel via go routines and channels, and also 
	displays the time required to execute.
*/

package main

import (
	"fmt"
	"io"
	"strings"
	"os"
	"time"
	"path"
	"net/http"
	"golang.org/x/net/html"
)

func DownloadFile(filepath string) error {
	link := filepath //Saves original filepath before splitting it 
	dir, imgname := path.Split(filepath)  //Splits filepath up into pieces by slashes to determin file name
	if dir == "0" {
		fmt.Println("err")
	}	
	out, err := os.Create(imgname)	//Creates file for image
        if err != nil {
                return err
        }
	defer out.Close()	//Close file

	resp, err := http.Get(link) 	//Opens image link
	if err != nil {
		return err
	}
	defer resp.Body.Close() 	//Close link

	_, err = io.Copy(out, resp.Body)	//Copys contents of image into newly created image file
	if err != nil {
		return err
	}
	return nil
}

func myScraper(url string, imgfile *os.File, linkfile *os.File, done chan bool) {
resp, err := http.Get(url) 	//Opens link
done <- true	//Signals main so that next goroutine may begin
if err != nil {
	fmt.Println("Error opening url")
}
defer resp.Body.Close()	//Close link

bdy := resp.Body	//Save html contents of link into bdy
tkn := html.NewTokenizer(bdy)	//Creat tokenizer to parse through html file

for {
currTkn := tkn.Next()	//Save next token
switch {
	case currTkn == html.ErrorToken :
		return
	case currTkn == html.StartTagToken :
		token := tkn.Token()
		if token.Data == "a" { // We found a link
			//Extract the href value
			for _, a := range token.Attr {
				if a.Key == "href" {
					href := a.Val 
				if (strings.Contains(href, "https") || strings.Contains(href, "http")) {	//Make sure link is fully qualified
					linkfile.WriteString(href)	//Write link to file
					linkfile.WriteString("\n")}	//Write end of line char
				}
			} 
		}
		if token.Data == "img" { //We found an image
			//Extraxt the src value
			for _, a := range token.Attr {
				if a.Key == "src" {
					src := a.Val 
					imgfile.WriteString(src)	//Write image name to file
					imgfile.WriteString("\n")	//Write end of line char
					if (strings.Contains(src, "http") || strings.Contains(src, "https")) {	//Make sure link to image is fully qualified
					err := DownloadFile(src)	//Function to download image
					if err != nil {
						fmt.Println("Error downloading")
						//panic(err)
					}}
				
				}
			}
		}
	}

}

}

func main() {

urlList := []string {
"https://www.unlv.edu/cs",
"https://www.unlv.edu/engineering",
"https://www.unlv.edu/engineering/advising-center",
"https://www.unlv.edu/engineering/about",
"https://www.unlv.edu/engineering/academic-programs",
"https://www.unlv.edu/ceec",
"https://ece.unlv.edu/",
"https://www.unlv.edu/me",
"https://www.unlv.edu/rotc",
"https://www.unlv.edu/afrotc",
"https://www.unlv.edu/eed",
"https://www.unlv.edu/engineering/mendenhall",
"https://www.unlv.edu/engineering/uas",
"https://www.unlv.edu/engineering/solar",
"https://www.unlv.edu/engineering/techcommercialization",
"https://www.unlv.edu/engineering/railroad",
"https://www.unlv.edu/engineering/future-students",
"http://www.physics.unlv.edu/",
}

imgfile, err := os.Create("foundImages.txt")	//Create file to store found image links
if err != nil {
	fmt.Println("Error opening file")
}
defer imgfile.Close()	//Close file

linkfile, err := os.Create("foundUrls.txt")	//Create file to store found site links
if err != nil {
	fmt.Println("Error opening file")
}
defer linkfile.Close()	//Close file

done := make(chan bool)	//Create channel
start := time.Now()	//Begin timerr
for _, url := range urlList {
go myScraper(url, imgfile, linkfile, done)	//Send thread to scrape
<-done	//Wait for signal to continue
}
elapsed := time.Since(start)	//Calculate elapsed time
fmt.Printf("Downloads completed in %s \n", elapsed)	//Print elapsed time


}
