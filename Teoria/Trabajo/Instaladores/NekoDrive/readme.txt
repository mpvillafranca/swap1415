NekoDrive - NFS Virtual Drive using Dokan Library
2011 Mirko Gatto - mirko.gatto@gmail.com 
supported by freakmaxi

In order to make it works you need:
- Dokan driver 0.6.0 (http://dokan-dev.net/en/download/ -  DokanInstall_0.6.0.exe)
- Microsoft .NET Framework 4.0

20 Jul 2011 0.9.0

* Is now possible to disable the cache and clean it up if enabled. The cache itself
speed up nekodrive quite a lot but because it is not updated automatically can cause 
problems if some of the canges on the drive are done by other applications.

* Create folder was broken. Is now fixed.

30 May 2011 0.8.0

* Privileged port binding support. This enable the "secure" export option of nfs server.
* timestamp fixed
* it is now possible to set folder permissions on creation.

21 Feb 2011 0.7.1

* Changed installer requirements from .net 4.0 client profile to full profile

5 Feb 2011 - 0.7

* Includes mount points feature of Dokan 0.6.0. It is now possible
to mount a remote device to an empty NTFS local folder.

13 Jan 2011 - 0.6.0

* It is available a new connection option in order to support Unicode

2 Dic 2010 - 0.5.1

* Timeout now is expressed in milliseconds, according to the new RPC library.

1 Dic 2010 - 0.5.0

* This new version is fully in c# and embeds remotetea.net.

* On Ubuntu server if you receive mount error you have to include in the export
the uid and gid. In the following example the client gid and uid are 1000:
/export 192.168.0.14(rw,no_subtree_check,sync,insecure,anonuid=1000,anongid=1000)

* Added cache system from ssh dokan example.

12 May 2010 - 0.4.1.2

Just some code cleanup

10 May 2010 - 0.4.1.1

This version fix the following issues:

* The end of file size and the allocation size attribute were not set correctly.

7 May 2010 - 0.4.0.1

This version adds the following features:
* You can define the mounted volume label

7 May 2010 - 0.3.2.2

This should fix definitely the issues 02 and 03. Tested on Ubuntu 9 and VxWorks 6.4.

6 May 2010 - 0.3.2.1

This version improves the transfer rate. I compared with the previous version
and now it's x2 (I tried on vxworks). This should fix the Issues 02 and 03.

29 Apr 2010 - 0.3.1.1

This version adds the following features:
* NFS V3 support!

28 Apr 2010 - 0.3.0.1

This version adds the following features:
* Auto start option
* Auto mount option
* When reduced to icon now it goes in the system tray
* It executes explorer on the mounted drive automatically
* Read/Write now is much faster and support big files but always with V2 Limit)

Known Issues:
* You must disable recycle bin on this drive by right click on the trash icon
Properties, select the drive and check "Do not move files to the Recycle Bin ..."


27 Apr 2010 - 0.2.6.1

This version fixes this issues:
* Cannot read/copy files > 65000 bytes

24 Apr 2010 - 0.2.5.1:

This version works much better than before:
* Full tree browsing
* Move files from/to subdirectories
* Edit files from subdirectories
* Options are saved for the next time you open the program

It has known issues: 
* when you delete files the Recicle Bin isn't handled correctly
* sometimes the files aren't opened correctly
* the V3 Protocol doesn't work yet properly so I removed from the selections
but I'll fix it in the next release.

4 Mar 2010 - 0.2.0.1:

* This version fix the copy of files from/to the drive root (tested on vxworks nfs).
It's still not possible to browse dirctory and there are still many bugs.


3 Mar 2010 - 0.1.0.2 :

This is a very first alpha release that just connect to a NFS device
and shows the contents in a windows drive. 
There are still many bugs that will be fixed in the next releases.
