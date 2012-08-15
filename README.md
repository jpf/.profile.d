# .profile.d

## Why

Rather than store all of my configuration settings in a huge file. 

I decided to store each "group" of settings in their own file.

## Install

 * Backup your existing ```~/.bash_profile``` - it's about to be replaced
 * ```git clone``` this repo into ~/.profile.d 
 * ```cd ~/.profile.d```
 * ```./setup.sh```

## Hacking

 * You can add new extensions in the ```extensions/``` subdirectory
 * Use ```up``` to reload without having to log back in
 * ```work*``` are .gitignored, so you can name an extension, for example, ```extensions/work-secretstuff``` you might not want to share.
  * This will also keep an as-yet-unwritten unrelated extension from clobbering your local ones.