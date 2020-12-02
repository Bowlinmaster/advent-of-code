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

    #Filter the character array based on the character we are looking for
    $finalArrayCount = $charArray | Where-Object { $_ -eq $charToLookFor };

    #Get how many records are in the filtered array.
    $theCount = $finalArrayCount.Count;

    #Do the test to see if that count is within our range
    $beginNum = [System.Convert]::ToInt32($beginNumString);
    $endNum = [System.Convert]::ToInt32($endNumString);

    if(($theCount -ge $beginNum) -and ($theCount -le $endNum)){
        $count++;
    }
}

Write-Host "Number of valid passwords are: " $count;