
# Luwam Hailu
# This assignment takes in an excel file of a specified format that contains student grade info and outputs javascript code to a 
# provided .html file that creates a table with each student's calculated grade and assignment/test averages.
# Please run this code as follows: 
# ruby proj7.rb [-ids || -name] > filename.html]

require 'csv'	# allows use of CSV file handling methods
if ARGV.length < 2	# Check to see if necessary arguments have been included
	puts "Too Few Arguments, Try Again in this format: ruby proj7.rb [-ids || - names] > filename.html "
	exit
end

input = ARGV
outID = false	# Boolean to signal that IDs should be displayed
outName = false	 # Boolean to signal that Names should be displayed
type = input[0]
if (type == "-ids")
	outID = true
elsif (type == "-name")
	outName = true
end
table = CSV.parse(File.read(input[1]))	# Converts csv file into multidimensional array (table)
numStudents=0
lines = 0
File.open(input[1]) do |file|	# For the  input CSV file
file.each_line do |line|	# For each line of the input CSV file
lines = lines + 1	# Count number of lines
end
lines = lines - 1 # Row index starts at 0	
numStudents = lines + 1  - 7 # Number of students is equal to # of lines minus headers rows (have to add 1 to get eliminate row index adjustment)
end
aWeight = table[3][2].to_i	# Get weight of assignments for overall grade (from specified location in document format)
tWeight = table[4][2].to_i	# Get weight of tests for overall grade (from specified location in document format)
numOfAssign = table[1][2].to_i	# Get number of assignments (from specified location in document format)
numOfTest = table[2][2].to_i	# Get number of tests (from specified location in document format)
className = table[0][1].to_s
puts "<!DOCTYPE html>"
puts "<html>"
puts "<head>"
puts "<style>"
puts "table, th, td { border: 1px solid black; }"
puts "</style>"
puts "</head>"
puts "<body>"
time = Time.new
puts "<h1>#{className}</h1>"
puts "<h2>As of: #{time.strftime("%A, %B %d, %Y")}</h2>"
puts " <table style='width:100%'> "
cols = numOfAssign + numOfTest + 2 # Number of columns to loop through is # of assigns plus # of tests plus id and name columns



# Function to calculate overall student grade
def calcGrade(totalHW, totalTest, hwPoss, testPoss, aWeight, tWeight)
	totalHW = totalHW.to_f	# Convert totalHW val to float
 	totalTest = totalTest.to_f	# Convert totalTest val to float
	hwPoss = hwPoss.to_f		# Convert hwPoss val to float
	testPoss = testPoss.to_f	# Convert testPoss val to float
	grade = (0).to_f		# Introduce new var to store overall grade value
	grade = (((totalHW/hwPoss) * (aWeight*0.01)) + ((totalTest/testPoss)*(tWeight*0.01))).round(4)	# Calculate overall grade based on weight of assignment and test weights
	grade = (grade * 100).round(2)	# Convert grade value to percentage
return grade
end

hwPoss = 0
testPoss = 0
# Loop to calculate total possible points for assignments and for tests
for z in 2..(cols-1) do		
	if z <= numOfAssign+1	# Check to see if current column is assignment column
                hwPoss = hwPoss + table[6][z].to_i	
        elsif z >= numOfTest	# Check to see if current column is test column
                testPoss = testPoss + table[6][z].to_i
	end
end

puts "<tr>"
# Print either Name or ID for column name
if outID == true
	puts "<th>ID</th>"
elsif outName == true
	puts "<th>Name</th>"
end
# For loop to print column headers
for y in 0..(cols-1) do
	if y > 1 && y <= numOfAssign+1
		puts "<th>Asst # #{y-1}</th>"
	elsif y > 1 && y >= numOfTest 
		puts "<th>Test # #{y-1-numOfAssign}</th>"
	end
end
puts "<th>Grade</th>"
puts "</tr>"
x = 2 # Counter for columns
totalHW = 0
totalTest = 0
# Nested for loop to loop through all students
for a in 6..lines do	# a is row index
puts "<tr>"
for b in 0..(cols-1) do	# b is column index
	
	if b == 0 && outID == true
		puts "<td> #{table[a][b]} </td>"
		# output ID
	elsif b == 1 and outName == true
		puts "<td> #{table[a][b]} </td>"
		# puts "name is #{table[a][b]}"
		# output Name
	elsif (b-1  <= numOfAssign) && (b != 0) && (b != 1)
		puts "<td> #{table[a][b]} </td>"
		totalHW = totalHW + table[a][b].to_i
		# puts "assign score is #{table[a][b]}"
		# go to output assignment # score
	elsif (b-1  >= numOfTest) && (b != 0) && (b != 1)
		puts "<td> #{table[a][b]} </td>"	
		totalTest = totalTest + table[a][b].to_i
		# puts "test score is #{table[a][b]}"
		# go to output test # score
	end
end
# call function to calculate grade
score = calcGrade(totalHW, totalTest, hwPoss, testPoss, aWeight, tWeight)
puts "<td> #{score} </td>"
puts "</tr>"
totalHW = 0
totalTest = 0

end


# Print averages row title
puts "<tr>"
puts "<td> <b>Average </b></td>" 
for c in 2..(cols-1) do
colTotal = (0).to_f

puts "<td> <b>"
# Loop through table to calculate and print average grade for each assignment and test
for d in 7..lines do
	colTotal = colTotal + table[d][c].to_f	
end
colTotal = (colTotal/numStudents.to_f).round(2)
puts "#{colTotal}  </b></td>"
end 


# Print possible points row header
puts "<tr>"
puts "<td> <b>Possible </b></td>"
# Loop through table to print possible points for each assignment and test
for c in 2..(cols-1) do
puts "<td> <b>"
for d in 7..lines do
        x = table[6][c]
end
puts "#{x} </b></td>"
end







puts "</tr>"
puts "</body>"
puts "</html>"
