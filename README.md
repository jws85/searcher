Exploratory work on a simple `counsel-rg` quasi-replacement using
`completing-read`.  The idea would then be to use selectrum or the
like.

It won't be 100% because `completing-read` can't do the "update as you
type" capability.

Right now, I have:

 - The ability to use ripgrep, the Silver Searcher, and (ugh) grep
   (with a severely reduced capability to filter junk); it tries
   those three in order
   
 - An uncolored but otherwise similar to `counsel-rg` display

 - Detects if you are in a project or not; if so it uses the
   project's directory; otherwise it uses the directory of the
   file your buffer is visiting
   
