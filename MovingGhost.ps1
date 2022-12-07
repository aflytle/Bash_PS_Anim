using system;

while (1)
{
    foreach ($i in (Get-ChildItem -Filter "*.txt"))
    {
        Clear-Host
        cat $i
        Start-Sleep -Seconds 0.8
        
        #check for user input with non-blocking command
        If ([Console]::KeyAvailable)
        {
            # read the key, and consume it so it won't
            # be echoed to the console:
            $keyInfo = [Console]::ReadKey($true)
            #$keyinfo = [Console]::ReadKey()
            # exit loop

        
            # write a dot if key pressed
            #Write-Host '.' -NoNewline
            #Start-Sleep -Seconds 0.2

            If ($keyinfo -eq "w")
            {

                #check for empty first line, else move up
                #by deleting empty first line. If the 
                #string is not empty, this first line
                #will return a boolean True.
                if (Get-Content $i -First 1) 
                {
                    foreach ($j in (Get-ChildItem -Filter "*.txt"))
                    {
                        sed '1d' $j #delete first line, pipe into same script
                    } 
                    Continue
                }

            }
            ElseIf ($keyinfo -eq "s")
            {

                #add new line at top to animate ghost.
                foreach ($j in (Get-ChildItem -Filter "*.txt"))
                {
                    #regex for line 1, s for subst., / ^\s$ / 
                    # is regex for ^ begininning of line, \s for 
                    #whitespace, and $ for end of line. Sed then 
                    #appends a newline character. 
                    sed -i '1s/^/\n/' $j #delete first line, pipe into same script
                } 
                Continue
            }
            Else
            {
                Continue
            }
        }
    }
}