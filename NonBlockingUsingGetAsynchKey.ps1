#NonBlockingUsingGetAsynchKey

while ($true)
{
    If (GetAsyncKeyState('S'))
    {
        echo 'True'
        # sed -i '1s/^/\n/' ghost1.txt
    }
    # Clear
    # cat ghost1.txt
    # Start-Sleep -Seconds .8
}
