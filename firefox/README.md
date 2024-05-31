```txt
File: /home/sergio/.dotfiles/firefox/README.md
Last Change: Sat, 07 May 2022 10:00
tags: [firefox]
```

## How to enable your personal userChrome.css:

Find out what is your default profile by typing  `about:profiles` in your firefox url bar

then link the userChrome.css file to the

    ln -sfvn ~/.dotfiles/firefox/userChrome.css ~/.mozilla/firefox/<random>.Sergio/chrome/userChrome.css

