# My Customizations on Suckless

## surf

Status: vanilla, custom config

Patched Surf with searchengine patch. 
Manually installed the diff to enable multiple search engines.
We now have the new diff

Installed diff to parseuri

Keeping config

## st

Current status: using shiva fork, no config

I want two patches: Scrollback and Solarized

The thing is that once applied to vanilla version 0.8.1, they dont have color

The one that works well though is shiva/st... 

What to do? Keep outdated fork that works well? For now probably
Or use vanilla and keep up with versions and versioned patches? Which I have to resolve this way
```
git co 0.8.1
git apply ~/.dotfiles/suckless/st/st-scrollback-0.8.1.diff
git ci -am "Scrollback patch"
git am -3 ~/.dotfiles/suckless/st/st-solarized-both-0.8.1.diff
**Fix conflicts as in rebase**
```
