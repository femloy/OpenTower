# Pizza Tower
- A full decompilation of Pizza Tower V1.0.311.
- I am not affiliated with Tour De Pizza in any way.

# Requirements
- [Pizza Tower](https://store.steampowered.com/app/2231450/Pizza_Tower/) on Steam
- [GameMaker `2022.9.1.66`](https://gms.yoyogames.com/GameMaker-Installer-2022.9.1.51.exe) (Future versions need a lot of fixing...)
- [Steamworks SDK](https://partner.steamgames.com/downloads/steamworks_sdk.zip)

This repository doesn't include any of the FMOD banks or sprites. An [UndertaleModTool](https://github.com/krzys-h/UndertaleModTool/releases) script is included to extract everything needed from the `data.win`, and port the required files to the decomp folder.

# The Script

1. Open Pizza Tower's `data.win` in UndertaleModTool. Open the "Scripts" tab at the top of the window, and select "Run other script..."

<img src="github/guide1.png">

2. Go to the decomp's folder, and select the `PTdecompiler.csx` file.

<img src="github/guide2.png">

3. The script will ask you to select a folder. Select the decomp folder.

<img src="github/guide3.png">

4. It takes a while to dump every frame of every sprite. Give it about 15 minutes... Make sure it dumps this to the same folder the YYP file is located.
5. Run the `PizzaTower_GM2.yyp` in the *right version of GameMaker*. Open Extensions > Steamworks and change the "Steam SDK" location to wherever you put your Steamworks SDK. If that doesn't work, try going INTO the Steamworks folder and make that the path instead. 

**If you try building the game with Steamworks, it will just run the unmodded game.** You can always just remove the extension though. Look through all Steam related code, and comment out any use of the `steam_` functions.