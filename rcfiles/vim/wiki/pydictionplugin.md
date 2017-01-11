### Plugin para completar códigos python

snipMate does not come with a setting to customize the trigger key, but you
can remap it easily in the two lines it's defined in the 'after' directory
under 'plugin/snipMate.vim'. For instance, to change the trigger key
to CTRL-J, just change this: >

 ino <tab> <c-r>=TriggerSnippet()<cr>
 snor <tab> <esc>i<right><c-r>=TriggerSnippet()<cr>

to this: >
 ino <c-j> <c-r>=TriggerSnippet()<cr>
 snor <c-j> <esc>i<right><c-r>=TriggerSnippet()<cr>

Pressing Tab again while the menu is open will scroll down the menu so
you can choose whatever item you want to go with, using the popup-menu
keys:

    CTRL-Y        Accept the currently selected match and stop completion.
    <Space>      Accept the currently selected match and insert a space.
    CTRL-E       Close the menu and not accept any match.

