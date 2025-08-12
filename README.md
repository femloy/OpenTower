# Warning
This game sucks. My buddy agrees -- majority wins.<br>
Try Undertale or Deltarune instead. They're GameMaker games. Here's a pretty good [UndertaleDecomp](https://github.com/danielah05/UndertaleDecomp).<br>
I haven't seen a good Deltarune one yet but I'm working on one. Very, very, very slowly.<br>
<br>
Anyway, unfortunately, everything on the Internet is permanent, so I kinda have to keep this available.

# Attribution
OpenTower is licensed under [CC BY 4.0](https://creativecommons.org/licenses/by/4.0/).<br>
Credit my GitHub profile.

# Requirements
- [Pizza Tower on Steam](https://store.steampowered.com/app/2231450/Pizza_Tower/), or through "other means". I personally prefer the latter.
- [GameMaker 2023.1.1.62](https://gms.yoyogames.com/GameMaker-Installer-2023.1.1.62.exe). This specific version has the same quirks the retail game comes with.
- [Steamworks SDK v1.55](https://partner.steamgames.com/downloads/steamworks_sdk_155.zip), unless you're making a standalone no patch mod.
- [UndertaleModTool](https://github.com/UnderminersTeam/UndertaleModTool/releases/tag/0.5.1.0). Not Bleeding Edge.
- A brain. I know it may be hard to come around one for someone like you, but I believe in you!

This repository doesn't include any of the datafiles or sprites.

# The Script
1. Make sure Pizza Tower is up to date. No mods. If you have `.po` files around then you probably have a mod installed.

2. Open the `data.win` file in the game's installation folder with UndertaleModTool.

3. Open the "Scripts" tab at the top of the UndertaleModTool window and select "Run other script..."

<img src="github/guide1.png">

4. Go to OpenTower's folder and select one of the two `PTdecompiler.csx` files. Whichever one works for you.

<img src="github/guide2.png">

4. It will ask you to select a folder; select the OpenTower folder. Should have all of these folders inside of it.

<img src="github/guide3.png">

5. It takes a while to dump every frame of every sprite. Don't panic.
6. After it's done, open `PizzaTower_GM2.yyp` in the specified version of GameMaker. That's about it.
7. To fix Steam SDK errors, open Extensions > Steamworks and change the SDK location setting to wherever you put it.

**If you don't remove Steamworks before making a build, it'll just run the game on Steam instead, unmodified.** I recommend removing the extension entirely for standalone mods. Look through all Steam related code and comment out any use of the `steam_` functions. You could also get ballsy and try to make your own fake Steam implementation.

# Upgrading GameMaker

If you want to move to a future GameMaker version you'll need to make some changes.

1. Upgrade or remove the Steamworks extension.
2. New GameMaker versions re-order and move assets around, making the code run in a different order. This breaks everything. The way I fix it is I make a persistent object that manually runs each broken object's step events in the intended order. Sounds terrible and tedious but if you really hate old GameMaker then you must.
3. The specific version of GameMaker used to build the game originally had a bug that you now have to replicate. Whenever text is drawn to the screen, offset it by the font's sprite origin. You can replace every `draw_text` with your own.
4. Rename the `string_split` script and function to something else, since that became an actual GameMaker built-in.
5. If your mod is going to be a patch rather than standalone keep in mind that the .exe would have to be included now as well.
6. Probably more. I forgot. If you got this far you can figure out the rest anyway.

# Issues
### Empty GameMaker
Delete the `%programdata%/GameMakerStudio2` folder while GameMaker is closed. Then reopen it.<br>
It happens when you use a newer GameMaker version. It breaks this older one.

### ImageMagick error when opening .csx
You have the wrong UndertaleModTool version. Try [this stable version](https://github.com/UnderminersTeam/UndertaleModTool/releases/tag/0.5.1.0) and/or try the "old" version of the script.

### Please update this
Well,
