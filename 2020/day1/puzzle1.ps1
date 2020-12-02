$in = @(Get-Content .\input.txt);

$in | ForEach-Object {
    $firstNumber = $_;
    #Loop through the list again to sum the firstNumber to find a 2020 summation.
    $in | ForEach-Object {
        if([int]$firstNumber + [int]$_ -eq 2020){
            Write-Host "The two numbers are: " $firstNumber " and " $_;
            $product = [int]$firstNumber * [int]$_;
            Write-Host "Their product is: " $product
        }
    }
}