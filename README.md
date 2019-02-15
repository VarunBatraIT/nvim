# NVIM 


This is the Super-Neo-Vim and Idea behind svim is pretty simply - you take your VIM along with you. 

I have added all the plugins I use for development. You can use this image to add more plugins. 

It is based on extended version of [vimrc](https://github.com/amix/vimrc/)


# Plugins
 
List is [organized alphabetically](https://github.com/VarunBatraIT/svim/blob/master/Dockerfile#L100)

# How to use?

Add this to your ~/.bashrc or ~/.zshrc depending on your configuration:

```
alias nvim='docker run -ti -e TERM=xterm -e GIT_USERNAME="You True" -e GIT_EMAIL="you@getyourdatasold"  --rm -v $(pwd):/home/developer/workspace varunbatrait/nvim'
```

Then use 

```
svim path/to/file
```

# Note

Try to be on the directory of project - where you have your git repository. It will have added functionality of git. 

