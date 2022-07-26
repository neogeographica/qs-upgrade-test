Running with SQL2
=================

This chapter is strictly about considerations for using Simple Quake Launcher 2 or a similar launcher.

One general thing to keep in mind is that the box at the bottom of the launcher shows the Quake-launching command line that is being constructed by the various choices you make. If you're unsure about your choices, you can compare this against the command line shown when Quakestarter launches the same mod, to see if the right thing is being done.


Game
----

The "Game" setting in Simple Quake Launcher 2 refers to the basic set of content that any mod will then build on.

Most addons just use "Quake" for the "Game" setting, indicating that they build on the original Quake campaign content (from the "id1" folder). But in some cases an included readme file may tell you differently.

A readme that mentions the "-hipnotic" command-line argument is an indicator that you should specify "MP1: Scourge of Armagon" as the "Game" in the launcher. A mention of "-rogue" is an indicator to specify "MP2: Dissolution of Eternity" as the "Game".

Some addons may ask that you use missionpack 1 even if you don't have that missionpack installed. In that case, the mod doesn't use any assets from the missionpack, but it does use some missionpack-specific code inside your Quake engine.

Some addons require using the mod Quoth as the base game content. If you don't have Quoth you can get it from `its website`_ and install it into a mod folder named "quoth". Quoth is the "Game" to specify in the launcher if a readme mentions using the "-quoth" command-line argument or generally talks about having a Quoth requirement.

Even if the readme mentions both "-quoth" and "-hipnotic", then specifying just "Quoth" as the "Game" in the launcher is still the thing to do.


Mod
---

If you're not playing a mod, but just running the content selected by the "Game" setting above, leave the "Mod" set to "[Default]".

If the content you want to play has been dumped into the folder for the original "Game", e.g. when a new map has just been placed into "id1\\maps", then that is also a case where you would leave "Mod" set to "[Default]".

However if you're playing mod content that is in its own separate folder -- which will always be the case for content installed through Quakestarter -- then use Simple Quake Launcher 2 to select that folder as the "Mod" to launch.


Mod dependencies
----------------

If the mod you've chosen is a map release for Arcane Dimensions or Copper that has been installed into its own separate folder, there's one more thing to do here, and the launcher unfortunately doesn't provide a nice button or dropdown menu to do it. First, make sure that you understand the :ref:`"Mod dependencies"<other_stuff/mod_requirements:mod dependencies>` section of the Mod Requirements chapter (under Other Topics). You'll see that what you need to do is get another "-game" argument placed into the Quake command line that the launcher is going to use.

To do this, look at the box at the bottom of the launcher that shows the Quake command line that is being built. There are some gray sections that mark spots where you can insert stuff. Click inside the first of these gray sections so you can type a "-game" argument that specifies the other mod that this map release depends on.

* If this mod depends on Arcane Dimensions, and Arcane Dimensions is installed into the "ad_v1_80p1final" folder, then you would type the following into that first gray box: ``-game ad_v1_80p1final``

|br|

* If this mod depends on Copper, and Copper is installed into the "copper_v1_17" folder, then you would type the following into that first gray box: ``-game copper_v1_17``

The resulting Quake command line shown in the box should have your new argument inserted *before* the "-game" argument that specifies the folder containing the map release. For example if the folder containing the map release is "udob_v1_1", and that depends on Copper, then the command line should end up looking like this::

 vkQuake.exe -game copper_v1_17 -game udob_v1_1 +map start

As mentioned in :doc:`Mod Requirements<../other_stuff/mod_requirements>`, this will only work with Quake engines that support multiple "-game" arguments on the command line.

**Note:** The qbism Super8 engine uses a different syntax on the command line, where the text that you manually enter here would use "-game2" rather than "-game".


Launching
---------

Now pick the map and skill setting you want to play, and launch.

For custom episodes/hubs, Simple Quake Launcher 2 will often figure out the correct starting map and select it by default. You can also check any included readme file to see what the first map should be.

Some addons do not have a startmap or hub map, and are just a collection of individual maps. In that case you'll need to select and launch each map individually to play it.


.. _its website: https://tomeofpreach.wordpress.com/quoth/
