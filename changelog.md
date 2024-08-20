*Test Release!*
*Version 27 try999999*

*Changelog*
- Revert "nuke overlay"
- Nuke permission, since it works at least with app
- Cook the `abort` coomand to nuke temporary folder
- Use old apktool, officially
- *Use another way to detect whenever folder is deleted or not

*Test list*
- Final check with overlay/charging

*Important note*
*: if you installed the module with `e01c701` commit, you have to delete the
`/data/adb/rm.pending` file
so that module can continue installation