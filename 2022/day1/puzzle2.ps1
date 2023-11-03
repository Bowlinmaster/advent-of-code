$in = Get-Content .\input.txt

$runningSumForAnElf = 0;

$elfsAndTheirCalories = @();

$in | ForEach-Object {
	#If we've reached an empty line, we're done summing up an elf
	if([System.String]::IsNullOrEmpty($_)){
        #Add this elf and their calories to the array.
        $elfsAndTheirCalories += $runningSumForAnElf

        #Then reset the running sum for the elf
        $runningSumForAnElf = 0;
	}
	$runningSumForAnElf += $_;
}

#Finally fint the top 3 and then sum them up

Write-Host "The top 3 Elfs have a sum calories of:";
Write-Host (($elfsAndTheirCalories | Sort-Object -Descending | Select-Object -First 3) | Measure-Object -Sum).Sum