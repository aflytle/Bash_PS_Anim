#GameOfLifeAttemptOne

#testing out the printing properties
# vvv so this is all for debugging vvv
# $a = New-Object 'object[,]' 3,3
# $b = @(1,2,3)
# $c = @(@(1,2,3),@(4,5,6),@(7,8,9))
# echo $a
# echo $b
# $c[1] -join ' '



#FUNCTIONS

#Boundaries must be zero; adding ghost boundary values
function Boundary-Assignment ($lifeArray) 
{
    for ($i = 0; $i -lt $lifeArray.Length; $i++)
    {
        for ($j = 0; $j -lt $lifeArray.Length; $j++)
        {
            if ($i -eq 0 -Or $j -eq 0 -Or $i -eq ($lifeArray.Length - 1) -Or $j -eq ($lifeArray.Length - 1))
            {
                $lifeArray[$i][$j] = 0
            }
        } 
    }
    return $lifeArray
}

#function that makes a square life array given size m x m
function Initialize-Life-Array($m)
{
    $arr1 = 1..$m

    for($i = 0; $i -lt $arr1.Length; $i++)
    {
        $arr1[$i] = 1..$m
        for ($j = 0; $j -lt $arr1[$i].Length; $j++)
        {
            $arr1[$i][$j] = @(0,1) | Get-Random #choose 0 or 1 randomly
        }
    }
    $arr1 = Boundary-Assignment ($arr1)
    return $arr1
}

#parses line of function in color, to color 1s and 0s
function Write-Colorized-Line($arrLine)
{
    #$colors2 = Yellow
    #$colors1 = Blue
    for ($i = 0; $i -lt ($arrLine.Length - 1); $i++)
    {
        switch ($arrLine[$i])
        {
            0 {Write-Host ($arrLine[$i].ToString() + " ") -ForegroundColor Blue -NoNewLine}
            1 {Write-Host ($arrLine[$i].ToString() + " ") -ForegroundColor Yellow -NoNewLine}

        }
    }
    switch ($arrLine[$arrLine.Length - 1])
    {
        0 {Write-Host ($arrLine[$arrLine.Length - 1].ToString() + " ") -ForegroundColor Blue}
        1 {Write-Host ($arrLine[$arrLine.Length - 1].ToString() + " ") -ForegroundColor Yellow}

    }

} 

#function to display array
function Display-Life-Array($arr1)
{
    for($i = 0; $i -lt $arr1.Length; $i++){
        Write-Colorized-Line($arr1[$i])
        #$arr1[$i] -join ' '
        #Write-Host $arr1[$i] -Foreground $Color[$arr1[$i]] -NoNewLine
    }
}

#function to update the arrays
function Update-Life-Array($arr1)
{
    $arr2 = $arr1
    for ($i = 1; $i -lt ($arr1.Length - 1); $i++)
    {
      for ($j = 1; $j -lt ($arr1.Length - 1); $j++)
      {
        #Display-Life-Array($arr1) #for testing
        #add up surrounding values
        
        $behavior1 = $arr1[$i - 1][$j - 1] + $arr1[$i][$j - 1] + $arr1[$i + 1][$j - 1]
        $behavior2 = $arr1[$i - 1][$j] + $arr1[$i + 1][$j]
        $behavior3 = $arr1[$i - 1][$j + 1] + $arr1[$i][$j + 1] + $arr1[$i + 1][$j + 1]
        switch ($behavior1 + $behavior2 + $behavior3)
        {
           0 {$arr2[$i][$j] = 0}
           1 {$arr2[$i][$j] = 0}
           2 {$arr2[$i][$j] = $arr1[$i][$j]}
           3 {$arr2[$i][$j] = 1}
           4 {$arr2[$i][$j] = 0}
           5 {$arr2[$i][$j] = 0}
           6 {$arr2[$i][$j] = 0}
           7 {$arr2[$i][$j] = 0}
           8 {$arr2[$i][$j] = 0}
        }
      }  
    }
    $arr2 = Boundary-Assignment($arr2)
    return $arr2
}
#note that the loop needs to start at the second value
#and end at the second to last, so that we don't
#accidentally consider values outside the array




###################################################
###################################################

#Main Loop

# vvv Magic variable for now vvv
# function Get-Array-Size{
#     $n = Read-Host -Prompt "enter an array size between 4 and 25"
#     $n = $n.ToInt
#     if ($n -le 4)
#     {
#         $n = 4
#     }
#     elseif ($n -ge 25)
#     {
#         $n = 25
#     }
#     else
#     {
#         $n = $n.ToInt
#     }
#     return $n
# }

# $m = Get-Array-Size
$m = Read-Host -Prompt "enter an array size between 4 and 25"
$lifeOne = Initialize-Life-Array($m)
#$lifeOne
while(1)
{
    Clear
    Display-Life-Array($lifeOne)
    $lifeOne = Update-Life-Array($lifeOne)
    Start-Sleep -Seconds .8
}
