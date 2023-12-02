$in = Get-Content .\input.txt

$totalSum = 0;

function Get-LetterValue{
    param($letter)
    if($letter -ceq 'a'){ return 1; }
    if($letter -ceq 'b'){ return 2; }
    if($letter -ceq 'c'){ return 3; }
    if($letter -ceq 'd'){ return 4; }
    if($letter -ceq 'e'){ return 5; }
    if($letter -ceq 'f'){ return 6; }
    if($letter -ceq 'g'){ return 7; }
    if($letter -ceq 'h'){ return 8; }
    if($letter -ceq 'i'){ return 9; }
    if($letter -ceq 'j'){ return 10; }
    if($letter -ceq 'k'){ return 11; }
    if($letter -ceq 'l'){ return 12; }
    if($letter -ceq 'm'){ return 13; }
    if($letter -ceq 'n'){ return 14; }
    if($letter -ceq 'o'){ return 15; }
    if($letter -ceq 'p'){ return 16; }
    if($letter -ceq 'q'){ return 17; }
    if($letter -ceq 'r'){ return 18; }
    if($letter -ceq 's'){ return 19; }
    if($letter -ceq 't'){ return 20; }
    if($letter -ceq 'u'){ return 21; }
    if($letter -ceq 'v'){ return 22; }
    if($letter -ceq 'w'){ return 23; }
    if($letter -ceq 'x'){ return 24; }
    if($letter -ceq 'y'){ return 25; }
    if($letter -ceq 'z'){ return 26; }

    if($letter -ceq 'A'){ return 27; }
    if($letter -ceq 'B'){ return 28; }
    if($letter -ceq 'C'){ return 29; }
    if($letter -ceq 'D'){ return 30; }
    if($letter -ceq 'E'){ return 31; }
    if($letter -ceq 'F'){ return 32; }
    if($letter -ceq 'G'){ return 33; }
    if($letter -ceq 'H'){ return 34; }
    if($letter -ceq 'I'){ return 35; }
    if($letter -ceq 'J'){ return 36; }
    if($letter -ceq 'K'){ return 37; }
    if($letter -ceq 'L'){ return 38; }
    if($letter -ceq 'M'){ return 39; }
    if($letter -ceq 'N'){ return 40; }
    if($letter -ceq 'O'){ return 41; }
    if($letter -ceq 'P'){ return 42; }
    if($letter -ceq 'Q'){ return 43; }
    if($letter -ceq 'R'){ return 44; }
    if($letter -ceq 'S'){ return 45; }
    if($letter -ceq 'T'){ return 46; }
    if($letter -ceq 'U'){ return 47; }
    if($letter -ceq 'V'){ return 48; }
    if($letter -ceq 'W'){ return 49; }
    if($letter -ceq 'X'){ return 50; }
    if($letter -ceq 'Y'){ return 51; }
    if($letter -ceq 'Z'){ return 52; }
}


#Something to be aware of, the repeated letter can appear multiple times in a container!
$in | ForEach-Object {
    $theSackSize = $_.ToString().Length
    $firstCompartment = $_.ToString().Substring(0,$theSackSize/2);
    $secondCompartment = $_.ToString().Substring($theSackSize/2, $theSackSize/2);
    #Write-Host "This rucksack ($_) has a size of $theSackSize.  First compartment: $firstCompartment. Second: $secondCompartment"

    $firstCompartment.ToCharArray() | ForEach-Object {
        if($secondCompartment.Contains($_)){
            #We found the same letter!
            $val = Get-LetterValue -letter $_
            Write-Host "Found the same letter.  The letter is: $_ with a value of $val";
            $totalSum += $val;
        }
    }
}

Write-Host $totalSum