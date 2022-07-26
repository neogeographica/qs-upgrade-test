Mod Folders
===========

Installing
----------

Quake mods are "installed" by putting them into a folder next to the "id1" folder. This folder can be called a game directory, or a mod folder, or something similar. Content in a mod folder can add to and even override/replace the original game content.

Addons that don't override any original content don't necessarily need to be put into their own mod folder. They can instead just have their files placed into the appropriate subfolders of "id1", or of the existing mod folder that they are intended for.

Quakestarter however will always install an addon into its own folder, essentially making any addon a "mod". If you're curious about why it's handled that way here, there's a few reasons, including:

* There's no chance of accidental conflicts with other addons.
* If it's a multi-map set, it's easy to come back at some later time and find which maps belong to it.
* It's easy to have config settings that are specific to the maps.
* It's easy to keep track of which savegames are for which maps.
* It's easy to correctly uninstall it later (see below), including all related config and savegames etc.

This does potentially result in a lot of folders in your Quake directory... everything's a tradeoff!


Uninstalling
------------

Any Quake mod folder can be "uninstalled" by just deleting it.

The menu options presented by Quakestarter for an installed mod include a choice to "uninstall"; this choice will delete the relevant mod folder. It doesn't matter whether you uninstall a mod through Quakestarter or manually delete its folder using the Windows Explorer: the result is the same.

If you haven't modified your Quakestarter configuration (see the :doc:`Advanced Configuration<../other_stuff/advanced_quakestarter_cfg>` chapter) then that's really all there is to it.

If however you have changed your Quakestarter configuration: you might have chosen to preserve the downloaded zipfile(s) that were used to install mods and/or patches. If this is the case, then at the time of uninstalling a mod you will be given the option to also delete those zipfiles. If you choose to delete a mod *without* deleting its saved zipfiles, they will remain until either a) you manually delete them, or b) you reinstall the mod and then eventually delete it through the Quakestarter menus again, this time choosing to remove the zipfiles.
