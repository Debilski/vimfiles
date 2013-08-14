A .vim directory
================

This repository bundles all of my efforts to get a functional modern vim configuration.

It includes all configurations which have cumulated over time as well exploitations of recent vim package distributions.

Best used with MacVim.

Included niceties
-----------------
We use [Vundle](https://github.com/gmarik/vundle) and git for plugin management. After cloning, a

    git submodule init
    git submodule update
    vim +BundleInstall +qall

is vital in order to load all plugins.


Unincluded niceties
-------------------
The repository does not bundle eclim but it seems to be compatible.


