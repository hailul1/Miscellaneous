
# Luwam Hailu
=begin
This program calculates a Scrabble score. It prompts for a word and then
calculates and outputs the Scrabble score for that word.
=end

# valid_Word function checks to see if word is valid for score to be calculated or if user has signified they want to quit by entering no date
def valid_Word(_word)
	if _word.strip.empty? # check for empty string
		puts "Bye!"
		return false
	else			# string is not empty, score may be calculated
                return true
        end
end

# try_Again checks to if word has a space in between two words, and if so returns true so that user may be prompted for new input
def try_Again(_word)
	if _word.strip.include?(' ') # check for space character
                puts "Error, found bad character ' '."
                return true
	else
		return false
	end
end


# function to determine score for input word
def score_Word(_word)
charArray = _word.split("")	# seperate letters of word into character array
strLength = _word.length	# determine number of times to loop
mult3 = false		# bool to signify if total score will be multiplied by 3
mult2 = false		# bool to signify if total score will be multiplied by 2
score = 0		# initialize score as 0
scores = { 'A' => 1, 'F' => 4, 'K' => 5, 'P' => 3, 'U' => 1,		#Associative array implemented by hash to relate letters to their associated score
 'B' => 2, 'G' => 2, 'L' => 1, 'Q' => 10, 'V' => 4,
 'C' => 3, 'H' => 4, 'M' => 3, 'R' => 1, 'W' => 4,
 'D' => 2, 'I' => 1, 'N' => 1, 'S' => 1, 'X' => 8,
 'E' => 1, 'J' => 8, 'O' => 1, 'T' => 1, 'Y' => 4,
 'Z' => 10, 'a' => 1, 'b' => 2, 'c' => 3, 'd' => 2, 'e' => 1,
'f' => 4, 'g' => 2, 'h' => 4, 'i' => 1, 'j' => 8, 'k' => 5, 'l'=>1,
'm' => 3, 'n' => 1, 'o' => 1, 'p' => 3, 'q' => 10, 'r' => 1, 's' => 1, 't' => 1, 'u' => 1, 
'v' => 4, 'w' => 4, 'x' => 8, 'y' => 4, 'z' => 10
 };
if charArray[0] == '2' # set bool to true if word score is to be doubled
	mult2 = true
	a = 1 # begin iterating at second letter
elsif charArray[0] == '3' # set bool to true if word score is to be tripled 
	mult3 = true
	a = 1 	# begin iterating at second letter
else
	a = 0 	# begin itrating at first letter
end
for a in 0..strLength do # begin looping over each character in word 
	x = a+1		# increase position counter to see following character
	y = charArray[a]	# y set to next character from current position a
	z = 0
	case y			# switch statement to check value for current character
	when 'A', 'a'
		z = scores.fetch('a')
		if charArray[x] == '2'
    		z = z * 2
    		elsif charArray[x] == '3'
        	z = z * 3
    		end
	when 'B', 'b'
		z = scores.fetch('b')
		if charArray[x] == '2'
    		z = z * 2
    		elsif charArray[x] == '3'
        	z = z * 3
    		end
	when 'C', 'c'
		z = scores.fetch('c')
		if charArray[x] == '2'
    		z = z * 2
    		elsif charArray[x] == '3'
        	z = z * 3
    		end
	when 'D', 'd'
		z = scores.fetch('d')
		if charArray[x] == '2'
    		z = z * 2
    		elsif charArray[x] == '3'
        	z = z * 3
    		end
	when 'E', 'e'
		z = scores.fetch('e')
		if charArray[x] == '2'
    		z = z * 2
    		elsif charArray[x] == '3'
        	z = z * 3
    		end
	when 'F', 'f'
		z = scores.fetch('f')
		if charArray[x] == '2'
    		z = z * 2
    		elsif charArray[x] == '3'
        	z = z * 3
    		end
	when 'G','g'
		z = scores.fetch('g')
		if charArray[x] == '2'
    		z = z * 2
    		elsif charArray[x] == '3'
        	z = z * 3
    		end
	when 'H', 'h'
		z = scores.fetch('h')
		if charArray[x] == '2'
    		z = z * 2
    		elsif charArray[x] == '3'
        	z = z * 3
    		end
	when "I", 'i'
		z = scores.fetch('i')
		if charArray[x] == '2'
    		z = z * 2
    		elsif charArray[x] == '3'
        	z = z * 3
    		end
	when 'J', 'j'
		z = scores.fetch('j')
		if charArray[x] == '2'
    		z = z * 2
    		elsif charArray[x] == '3'
        	z = z * 3
    		end
	when 'K', 'k'
		z = scores.fetch('k')
		if charArray[x] == '2'
    		z = z * 2
    		elsif charArray[x] == '3'
        	z = z * 3
    		end
	when 'L', 'l'
		z = scores.fetch('l')
		if charArray[x] == '2'
    		z = z * 2
    		elsif charArray[x] == '3'
        	z = z * 3
    		end
	when 'M', 'm'
		z = scores.fetch('m')
		if charArray[x] == '2'
    		z = z * 2
    		elsif charArray[x] == '3'
        	z = z * 3
    		end
	when 'N', 'n'
		z = scores.fetch('n')
		if charArray[x] == '2'
    		z = z * 2
    		elsif charArray[x] == '3'
        	z = z * 3
    		end
	when 'O', 'o'
		z = scores.fetch('o')
		if charArray[x] == '2'
    		z = z * 2
    		elsif charArray[x] == '3'
        	z = z * 3
    		end
	when 'P', 'p'
		z = scores.fetch('p')
		if charArray[x] == '2'
    		z = z * 2
    		elsif charArray[x] == '3'
        	z = z * 3
    		end
	when 'Q', 'q'
		z = scores.fetch('q')
		if charArray[x] == '2'
    		z = z * 2
    		elsif charArray[x] == '3'
        	z = z * 3
    		end
	when 'R', 'r'
		z = scores.fetch('r')
		if charArray[x] == '2'
    		z = z * 2
    		elsif charArray[x] == '3'
        	z = z * 3
    		end
	when 'S', 's'
		z = scores.fetch('s')
		if charArray[x] == '2'
    		z = z * 2
    		elsif charArray[x] == '3'
        	z = z * 3
    		end
	when 'T', 't'
		z = scores.fetch('t')
		if charArray[x] == '2'
    		z = z * 2
    		elsif charArray[x] == '3'
        	z = z * 3
    		end
	when 'U', 'u'
		z = scores.fetch('u')
		if charArray[x] == '2'
    		z = z * 2
    		elsif charArray[x] == '3'
        	z = z * 3
    		end
	when 'V', 'v'
		z = scores.fetch('v')
		if charArray[x] == '2'
    		z = z * 2
    		elsif charArray[x] == '3'
        	z = z * 3
    		end
	when 'W', 'w'
		z = scores.fetch('w')
		if charArray[x] == '2'
    		z = z * 2
    		elsif charArray[x] == '3'
        	z = z * 3
    		end
	when 'X', 'x'
		z = scores.fetch('x')
		if charArray[x] == '2'
    		z = z * 2
   		elsif charArray[x] == '3'
        	z = z * 3
    		end
	when 'Y', 'y'
		z = scores.fetch('y')
		if charArray[x] == '2'
    		z = z * 2
    		elsif charArray[x] == '3'
        	z = z * 3
    		end
	when 'Z', 'z'
		z = scores.fetch('z')
		if charArray[x] == '2'
    		z = z * 2
    		elsif charArray[x] == '3'
        	z = z * 3
    		end
	else
	end
score = score + z  	# update score
end

if mult2 == true
	return score * 2
elsif mult3 == true
	return score * 3
else
	return score
end
end

puts "Scrabble Score Calculator"

_word = "temp"

while valid_Word _word
	print "Enter word to score: "
	_word = gets.chomp
	score = score_Word _word
	if score !=0 and !try_Again(_word)
		puts "Score for '#{_word}' is: #{score}"
	end
end



