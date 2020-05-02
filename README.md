# Portal 2 Jammers
This is an implementation of the Jammers from The Talos Principle in Portal 2. It can be used for workshop maps or mods.

## Installation
[Download it from here](https://github.com/LordVonAdel/P2-Jammer/archive/master.zip).

To install this "Addon", copy the files from the downloaded portal2 directory into your portal mod folder. I recommend creating a directory called `portal2_dlc3` and use that, to not mix up custom from stock content. Also copy the `instances/jammer` folder to `sdk_content/maps/instances/jammer`. Remember to pack the content into the bsp file if you want to publish the map on the Portal 2 workshop.

## Usage
Place the objects as func_instance into your level. The example map shows how to use them.

`wall_256` and `wall_128` are simple walls that can be jammed.

`jammable_base` can be used to create own things that can be jammed.

`jammer_default` is your basic jammer. Place it in the level and it should work.

## Creating custom Jammers
The default Jammer can be used in old aperture or in newer chambers without looking out of place. But because I am a bad artist you may want to create your own model. Use ``jammer_default`` as an template or use `jammer_base` to create one from scratch.

## Notes
* Do not have multiple jammable targets near each other. The aming is very inaccurate.
* Don't use `scripted_target` in the presents of jammers. This classname is used internally by the script.
* Pack custom content before publishing to the workshop.
* The maximum range for a jammer is 512 units. This limit can be changed in `scripts/vscript/jammer/jammer.nut`.

This implementation is not much play tested. If you find a problem, please open an issue on this GitHub repository.

Feel free to use or modify this content to adjust it to your map. 