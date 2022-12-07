# do
# {
#     # wait for a key to be available:
#     if ([Console]::KeyAvailable)
#     {
#         # read the key, and consume it so it won't
#         # be echoed to the console:
#         #$keyInfo = [Console]::ReadKey($true)
#         $keyinfo = Console.ReadKey().Key
#         # exit loop
#         Write-Host $keyinfo
#     }

#     # write a dot and wait a second
#     Write-Host '.' -NoNewline
#     Start-Sleep -Seconds 1

# } while ($true)

$key = [Byte][Char]'A'    
$Signature = @'
    [DllImport("user32.dll", CharSet=CharSet.Auto, ExactSpelling=true)] 
    public static extern short GetAsyncKeyState(int virtualKeyCode); 
'@
Add-Type -MemberDefinition $Signature -Name Keyboard -Namespace PsOneApi
do
{
  $keypress = [bool]([PsOneApi.Keyboard]::GetAsyncKeyState($key) -eq -32767)
  If ($keypress)
  {
    if (Get-Content ghost1.txt -First 1)
    {
        sed '1d' ghost1.txt
    }

  }
  Clear
  cat ghost1.txt
  Start-Sleep -Milliseconds 500
  
} while($true)
# emit a new line
#Write-Host

# show the received key info object:
#$keyInfo