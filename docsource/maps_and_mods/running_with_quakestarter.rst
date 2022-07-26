Running with Quakestarter
=========================

Launching addons with Quakestarter is as easy as selecting a choice from a menu, with as much of the complexity hidden as possible. However a few topics deserve more explanation:


Skill selection
---------------

After you have installed an addon from the Quakestarter menus, or if you select an already-installed item, Quakestarter will give you the option to play or uninstall that addon. The choices for playing look like this::

 y: launch without explicitly setting a skill
 n: do not launch
 0-3: launch and set a default initial skill

If you choose "y" or just press Enter, the addon will be launched using a default skill value. Usually the default skill is 1 ("Normal"), but you may want to set up a different default skill for yourself in your "id1\\autoexec.cfg" file. Then you can always just hammer the Enter key to quickly launch stuff without needing to specifically enter a skill value. (If the addon comes with its own "start" map, it may also provide a way to select the skill value in-game.)

The :ref:`"Setting difficulty"<other_stuff/no_launcher:setting difficulty>` section of the Launcherless Launch chapter goes into more detail about setting a default skill value, if you want to do that. Even though that chapter is about topics useful for when you're *not* using a launcher frontend, that particular section can be helpful here too.


Example command line
--------------------

When you launch your choice, Quakestarter will print the command line arguments used to launch Quake in order to run that addon correctly. This can be a helpful example if you want to launch things outside of Quakestarter in the future.


Collections with no startmap
----------------------------

If an addon is a multi-map collection that doesn't have its own startmap, you will need to select the map you want to play after Quake has launched. Some Quake engines provide an in-game menu for map selection in these custom addons, but most do not (like vkQuake and Ironwail at the time of writing this doc). If not, then you'll need to use the Quake console.

Once Quake has launched, if you are at the main menu with no game or demo running, then you can open the console with the ESC key. When a game or demo is running you can get to the console with the "~" key, or on international keyboards typically whatever key is under ESC.

At the console prompt use the "map" command to start a map, e.g. you would type "map jam2_mfx" and press Enter to run the jam2_mfx map.

In most Quake engines you can use autocomplete in the console to see what maps are available. Just type "map" followed by a space and then press the Tab key. You can also use the autocomplete feature to avoid having to type the entire name of the map.
