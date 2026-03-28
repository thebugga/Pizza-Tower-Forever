# Pizza Tower Modding Base
This project is aimed at creating a sustainable and easily extendable base for Pizza Tower mods.

## Features
- The `ispeppino` variable is now completely deprecated, replaced by the `character` variable, making adding new characters to the game much more convenient.
- Almost all unused/cut content has been finally axed from the game, leaving the game lighter and faster to start up.
- Updated in-game character switching is implemented using the `char` command.
- Peppino's player movement behavior is now the default for any new character.

## Planned features
- Fully overhauled code for the main menu save file select and character select.
- (WIP) Removal of all unused states and function calls.
- (WIP) QOL utility functions.

## HOW TO SET UP THE PROJECT
*Note: You have to own Pizza Tower on Steam in order to use this mod base.*

1. Download the latest version of [UndertaleModTool](https://github.com/UnderminersTeam/UndertaleModTool/releases/latest) and install [Gamemaker 2023.1.1.62](https://gms.yoyogames.com/GameMaker-Installer-2023.1.1.62.exe).
2. Open the `data.win` file from your Pizza Tower install folder in UTMT (you can find it by right-clicking Pizza Tower in your library and pressing `Browse local files`)
3. In UTMT, open `Scripts -> Run other script...` and select `SpriteRipper.csx` from the root of the project folder
4. Select the root folder of the project (the one that contains `PizzaTower_GM2.yyp`)
5. When the script will finish extracting all sprites, delete `.gitignore` and move the folder somewhere else
6. Done! Now you can open this project in GameMaker.

**WARNING**: The save file folder in `AppData/Roaming`, by default, is linked to the project file name (`PizzaTower_GM2.yyp`). Do not rename it unless you're planning to use a different folder for your mod.

## Credits
- **setupwitch** for creating Pizza Tower EXtracted and making PT: Optimized possible
- **Dockronic** for creating PT: Optimized, the base for this project
- **26 (lamroja)** for assisting with fixes
