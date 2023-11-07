CPATH='.;../lib/hamcrest-core-1.3.jar;../lib/junit-4.13.2.jar'

rm -rf student-submission
rm -rf grading-area

mkdir grading-area

git clone $1 student-submission
echo 'Finished cloning'
echo


# Draw a picture/take notes on the directory structure that's set up after
# getting to this point

# Then, add here code to compile and run, and do any post-processing of the
# tests

echo 'Checking for correct submitted file...'
if [ ! -f 'student-submission/ListExamples.java' ]; then
    echo 'ListExamples.java not found'
    exit 1
fi
echo 'Found ListExamples.java'
echo

echo 'Copying files to grading area...'
cp student-submission/ListExamples.java grading-area/
cp TestListExamples.java grading-area/
echo 'Finished copying'
echo

echo 'Compiling...'
cd grading-area
javac -cp $CPATH *.java
echo 'Finished compiling'
echo

echo 'Running tests...'
java -cp $CPATH org.junit.runner.JUnitCore TestListExamples > result.txt
echo 'Finished running tests'
echo

echo 'Checking results...'
# Detect failures in result.txt
if grep -q 'FAILURES!!!' result.txt; then
    echo 'There were test failures'
    grep -A 1 'FAILURES!!!' result.txt | tail -n 1 > grade.txt
    cat grade.txt
    
else
    echo 'There were no test failures'
    grep 'OK' result.txt | grep -oE [0-9]+ > grade.txt
    grade=$(cat grade.txt)
    echo "Tests run: $grade"
    
fi
echo 'Finished checking results'
exit 0