$in = @(Get-Content .\input.txt)

$count = 0;

$in | ForEach-Object {
    #First split up all the pieces
    $splitUp = $_.Split(" ");

    #Get the range of number of time character can appear in password
    $beginNumString = $splitUp[0].Split("-")[0];
    $endNumString = $splitUp[0].Split("-")[1];

    #Get the character that we are supposed to look for, removing the colon.
    $charToLookFor = $splitUp[1].Substring(0, $splitUp[1].Length - 1);

    #Convert the password to a character array
    $charArray = $splitUp[2].ToCharArray();

    #Convert to numbers
    $beginIndex = [System.Convert]::ToInt32($beginNumString);
    $endIndex = [System.Convert]::ToInt32($endNumString);

    #Do the test to see if that count is within our range (No zero indexing)
    if(($charToLookFor -eq $charArray[$beginIndex - 1]) -xor ($charToLookFor -eq $charArray[$endIndex - 1])){
        $count++;
    }
}

Write-Host "Number of valid passwords are: " $count;