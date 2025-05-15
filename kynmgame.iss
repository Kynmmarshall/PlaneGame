[Setup]
AppName=KynmGame
AppVersion=1.3
DefaultDirName={pf}\KynmGame
DefaultGroupName=KynmGame
OutputDir=.\Output
OutputBaseFilename=KynmGameSetup
Compression=lzma
SolidCompression=yes
ArchitecturesAllowed=x64
ArchitecturesInstallIn64BitMode=x64

[Files]
; Include your executable and required files
Source: "PlaneGame1.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "*.wav"; DestDir: "{app}"; Flags: ignoreversion
Source: "highscore.txt"; DestDir: "{app}"; Flags: onlyifdoesntexist

[Icons]
Name: "{group}\KynmGame"; Filename: "{app}\PlaneGame1.exe"
Name: "{commondesktop}\KynmGame"; Filename: "{app}\PlaneGame1.exe"

[Run]
Filename: "{app}\PlaneGame1.exe"; Description: "Launch PlaneGame1"; Flags: nowait postinstall skipifsilent
