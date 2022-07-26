quake.rc
========

What is it?
-----------

"quake.rc" is sort of a master config file included among the original Quake gamedata. It executes some other config files, including "autoexec.cfg" if that exists, and also can start playing the attract-mode demos.

When you start up Quake, it will execute "quake.rc". In the console you will even see a message that says "execing quake.rc" (and then more messages for the other files that "quake.rc" itself executes in turn).

The files in a mod release may contain a new different "quake.rc" that sets some console variable values, creates new console commands, or does other things. Or the mod might not have a new "quake.rc", but it might have new versions of the *other* config scripts that get executed when you execute "quake.rc".

If you want to learn more about "quake.rc", see `the comprehensive discussion by "Preach"`_.


Considerations when using the "game" console command
----------------------------------------------------

In the original Quake, before the "game" console command existed, mods could have the expectation that "quake.rc" would be run when a mod was activated... because a mod could only be activated as part of starting Quake. Some mods rely on this behavior.

When various modern Quake engines added a "game" console command to let you activate a mod *after* Quake startup though, they did not initially make that command also execute "quake.rc" after the mod folder was activated. There were various reasons for that, but any current version of Quakespasm or a Quakespasm variant now *will* execute "quake.rc" after a "game" command. This is a good thing that makes some mods behave better, and any downsides are pretty speculative and esoteric. (You will always avoid any potential problems if you avoid using the "game" command multiple times in the same play session.)

So if you use the "game" console command and you do *not* see "execing quake.rc" printed to the console, you may be using an old version of Quakespasm, or some other Quake engine that doesn't exec "quake.rc" in this situation. What you probably want to do in this case is just manually enter that command in the console yourself::

    exec quake.rc


Quakestarter-generated quake.rc
-------------------------------

In cases where a mod does not have its own "quake.rc" (and does not rely on a "quake.rc" from a dependency like Quoth), Quakestarter will often put a generated "quake.rc" file into the mod folder. This file may be customized to set up the unique startdemos (if any) for that mod, and it will also execute a "modsettings.cfg" file.

"modsettings.cfg" is where Quakestarter puts any recommended settings for the mod. A lot of these settings may no longer be useful in modern Quake engines, but some (like settings for water transparency) can still be good for preserving the intent of the author. This file will be empty if there are no recommended settings, which is often the case.

Whether or not the "modsettings.cfg" file has stuff in it, if it exists you are free to edit it yourself -- remove, add, or change various settings. It is a handy place to put mod-specific stuff without getting in the way of whatever you might have in your "id1\\autoexec.cfg" file.


.. _the comprehensive discussion by "Preach": https://tomeofpreach.wordpress.com/2013/09/05/quake-rc-and-being-a-good-citizen/
