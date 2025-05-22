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
Source: "planeGame.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "*.wav"; DestDir: "{app}"; Flags: ignoreversion
Source: "highscore.txt"; DestDir: "{app}"; Flags: onlyifdoesntexist
Source: "README.md"; DestDir: "{app}"; Flags: onlyifdoesntexist

[Icons]
Name: "{group}\KynmGame"; Filename: "{app}\planeGame.exe"
Name: "{commondesktop}\KynmGame"; Filename: "{app}\planeGame.exe"

[Run]
Filename: "{app}\planeGame.exe"; Description: "Launch planeGame"; Flags: nowait postinstall skipifsilent
