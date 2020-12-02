$in = @(Get-Content .\input.txt);

$in | ForEach-Object {
    $firstNumber = $_;
    #Loop through the list again to get s second number
    $in | ForEach-Object {
        $secondNumber = $_;
        #Finally loop through a 3rd time to finally sum up all 3 to get a summation of 2020 O(n^3)
        $in | ForEach-Object {
            $thirdNumber = $_;
            if([int]$firstNumber + [int]$secondNumber + [int]$thirdNumber -eq 2020){
                Write-Host "The three numbers are: " $firstNumber " and " $secondNumber " and " $thirdNumber;
                $product = [int]$firstNumber * [int]$secondNumber * [int]$thirdNumber;
                Write-Host "Their product is: " $product
            }
        }
        
    }
}