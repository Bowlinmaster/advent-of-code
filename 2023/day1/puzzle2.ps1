#Get the input
$in = Get-Content .\input.txt

$runningTotal = 0;

$in | ForEach-Object {
    #First, convert and single digit words into their number counterpart
    #There are some word combination that letters can belong into two numbers so add back the first and last letter.
    #Example "oneight", "twone", "threeight", "sevenine"
    $justTheNumber = $_ -replace "one", "o1e";
    $justTheNumber = $justTheNumber -replace "two", "t2o";
    $justTheNumber = $justTheNumber -replace "three", "t3e";
    $justTheNumber = $justTheNumber -replace "four", "f4r";
    $justTheNumber = $justTheNumber -replace "five", "f5e";
    $justTheNumber = $justTheNumber -replace "six", "s6x";
    $justTheNumber = $justTheNumber -replace "seven", "s7n";
    $justTheNumber = $justTheNumber -replace "eight", "e8t";
    $justTheNumber = $justTheNumber -replace "nine", "n9e";

    #Strip out anything that's not a number
    $justTheNumber = $justTheNumber -replace "[^\d]", "";

    $theFinalNumber = "";
    
    #Now I just need the first and last digit

    #There's always going to be at least 1 digit...
    $theFinalNumber += $justTheNumber[0];

    #Even if there is only 1 digit, this still adds it as the last digit
    $theFinalNumber += $justTheNumber[$justTheNumber.Length - 1];

    #Write-Host "Original: $($_). Replace: $($justTheNumber): Final: $($theFinalNumber)"

    $runningTotal += $theFinalNumber;
}

Write-Host $runningTotal