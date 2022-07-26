.Net Dependency
===============

You may have come to this page because you read about the .Net dependency in another chapter, or because Quakestarter refused to start and told you to come here. The basic situation is as follows:

The Quakestarter script uses .Net assemblies to decompress the zipfiles for mods and patches, and in some cases (particularly on Windows 7/8) to do the downloads too. Simple Quake Launcher 2 also relies on .Net. In both cases, .Net Framework 4.5 is the minimum requirement. And at least in the case of Quakestarter this places a requirement on your version of Powershell as well.

If you're using Windows 8 or Windows 10 or later, then you shouldn't have to worry about this; you can ignore this chapter unless you're getting that aforementioned Quakestarter error message.

On Windows 7 though it's likely you'll need to upgrade something. For various Microsoft-y reasons it can be a little awkward so I apologize in advance for that. Let's walk through it...


Finding what you have
---------------------

You can determine your current PowerShell version just by running "powershell" and then entering the command "$PSVersionTable". The "PSVersion" shown in the output of that command is what you are looking for.

Determining the installed .Net framework version(s) is trickier, as `described by Microsoft`_. One nice way though is with the `DotNetVersions tool`_.

As mentioned above, you must have .Net Framework 4.5 or later installed. Also, if your most recent installed .Net Framework version is 4.7.1 or later, then you must be using PowerShell 5.1 or later.


Upgrading .Net
--------------

If your latest installed .Net version is less than 4.5, you can upgrade your .Net framework using a download `from Microsoft`_. If your PowerShell version is pre-5.1 then make sure to pick a .Net version that is 4.7 or earlier. Also make sure that you get a ".Net Framework" runtime package, *not* anything else like ".Net Core" or a developer pack or etc.

If you upgrade .Net, make sure to reboot afterward.


Upgrading PowerShell
--------------------

Hopefully you won't have to touch PowerShell. But let's say your .Net version is already 4.7.1 or later, and your PowerShell version is older than 5.1. In that case, you can get PowerShell 5.1 `from Microsoft too`_.

Make sure to choose the download appropriate for your OS. Likely you're looking for the Windows 7 download, which last time I looked was called "Win7-KB3191566-x86.zip". I downloaded that zipfile, decompressed it, right-clicked on the resulting "Install-WMF5.1.ps1" file, and chose "Run with PowerShell". That properly installed the new version of PowerShell.

If you upgrade PowerShell, make sure to reboot afterward.


.. _described by Microsoft: https://docs.microsoft.com/en-us/dotnet/framework/migration-guide/how-to-determine-which-versions-are-installed
.. _DotNetVersions tool: https://github.com/jmalarcon/DotNetVersions
.. _from Microsoft: https://www.microsoft.com/net/download/all
.. _from Microsoft too: https://www.microsoft.com/en-us/download/details.aspx?id=54616
