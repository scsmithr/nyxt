(in-package :next)

(defun tutorial-content ()
  (markup:markup
   (:h1 "Next tutorial")
   (:p "By reading this tutorial you'll learn:")
   (:ul
    (:li "Core concepts")
    (:li "Basic keybindings")
    (:li "How to use the help system to learn more about Next"))
   (:h2 "Core Concepts")
   (:h3 "Keybindings and Commands")
   (:p "Commands in Next are invoked by pressing specific keys or from
the " (:code "execute-command") " menu (" (:code (binding-keys
'execute-command)) ") which will prompt you for a list of commands which you can
then select from.")
   (:p "In Next, keybindings are represented as in 'control-space' or
equivalently 'C-space'. In this example, 'C' is a shortcut for the modifier
'control', and 'space' represents the character ' '.  A modifier is a key that
does not do anything on its own, its purpose is to alter the meaning of a
non-modifier key when pressed together.  Therefore, to input the 'C-x'
keybinding you would have to keep 'control' pressed and they hit 'x'.  Multiple
key presses can be chained: in 'C-x C-M-left', you would have to press 'C-x',
let go of all keys, and then press 'control', 'meta' and 'left'.")
   (:p "Modifier keys legend:")
   (:ul
    (:li (:code "control") " (" (:code "C") "): Control key")
    (:li (:code "super") " (" (:code "S") "): Windows key, Command key")
    (:li (:code "meta") " (" (:code "M") "): Alt key, Option key")
    (:li (:code "shift") " (" (:code "s") "): Shift key"))

   (:h3 "Buffers")
   (:p "Next uses the concept of buffers instead of the \"tabs\" used by many
applications. Beyond tabs, buffers provide additional functionality. For
example, two buffers can have a completely different set of keybindings. Unlike
tabs, the buffer display scales, that is to say, it's just as convenient to
navigate 2 or 100 buffers.")
   (:h3 "Modes")
   (:p "Each buffer has its own set of modes. A mode is a set of functions,
hooks, keybindings and other facilities that modify the behavior of a buffer.
For example, 'blocker-mode' can be used for domain-based adblocking while
noscript-mode disables JavaScript.")
   (:h3 "Minibuffer")
   (:p "The minibuffer is a menu that will appear when a command requests user
input. For example, when invoking the " (:code "set-url") " command, you must
supply the URL you would like to navigate to. The minibuffer can provide
suggestions for you when using it.  The list of suggestions will automatically
narrow down to those matching your input as you type.")
   (:h3 "Message Area")
   (:p "The message area represents a space (typically at the bottom of a
window) where Next outputs messages back to you. To view the history of all
messages, invoke the command 'messages'.")
   (:h3 "Status Area")
   (:p "The status area is where information about the state of that buffer is
printed. By default this includes the active modes, the URL, and the title of
the current buffer.")
   (:h2 "Basic controls")
   (:h3 "Moving within a buffer")
   (:p "To Move within a buffer, several commands are provided:")
   (:ul
    (:li (command-markup 'scroll-down) "): Move down")
    (:li (command-markup 'scroll-up) "): Move up")
    (:li (command-markup 'scroll-to-bottom) ": Jump to bottom of page")
    (:li (command-markup 'scroll-to-top) ": Jump to top of page"))
   (:h3 "Setting the URL")
   (:p "When ambiguous URLs are inputted, Next will attempt the best guess it
can. If the you do not supply a protocol in a URL, HTTPS will be assumed. To
visit a site supporting only the less secure HTTP, you must explicitly type the
full URL including the 'http://' prefix.")
   (:ul
    (:li (command-markup 'set-url) ": Set URL of current buffer")
    (:li (command-markup 'set-url-new-buffer) ": Open a new buffer and set its URL")
    (:li (command-markup 'make-buffer-focus) ": Make a new empty buffer"))
   (:h3 "Switching buffers")
   (:ul
    (:li (command-markup 'switch-buffer) ": Switch buffer using fuzzy completion
to quickly find whatever buffer you are looking for")
    (:li (command-markup 'switch-buffer-next) ": Go to next buffer")
    (:li (command-markup 'switch-buffer-previous) ": Go to previous buffer"))
   (:h3 "Link Navigation")
   (:p "Link-hinting allows you to visit URLs on a page without using the mouse.
Invoke one of the commands below: several hints will appear on screen and all
links one the page will be listed in the minibuffer.  You can select the hints
by matching against the hint, the URL or the title.")
   (:ul
    (:li (command-markup 'follow-hint) ": Go to link in current buffer")
    (:li (command-markup 'follow-hint-new-buffer-focus) ": Create new buffer with link, focus on new buffer")
    (:li (command-markup 'follow-hint-new-buffer) ": Create new buffer with link, keep focus on current buffer"))
   (:h3 "Using the buffer history")
   (:p "History is represented as a tree that you can traverse: when you go back
in history, then follow a new URL, it effectively creates a new branch without
deleting the old path. The tree makes sure you never lose track of where you've
been.")
   (:ul
    (:li (command-markup 'next/web-mode:history-forwards) ": History forwards")
    (:li (command-markup 'next/web-mode:history-backwards) ": History backwards")
    (:li (command-markup 'next/web-mode:history-forwards-query) ": History forwards query to any following location on the branch")
    (:li (command-markup 'next/web-mode:history-backwards-query) ": History backwards query to any previous location")
    (:li (command-markup 'next/web-mode:history-forwards-all-query) ": History forwards query to any following location on all branches")
    (:li (command-markup 'next/web-mode:history-all-query) ": History all query, jump to any history entry"))
   (:p "You can also view a full tree of the history for a given buffer by
invoking the command 'buffer-history-tree'.")
   (:h3 "Searching")
   (:p "Next can search a single buffer or multiple buffers at the same time.")
   (:p "You can view candidates for search results in the minibuffer in one
place rather than having to jump around on a buffer (or multiple buffers).")
   (:ul
    (:li (command-markup 'search-buffer) ": Search buffer")
    (:li (command-markup 'search-buffers) ": Search multiple buffers"))
   (:h3 "Miscellaneous")
   (:p (command-markup 'quit) ": Close all Next windows and quit.")

   (:h2 "The Next Help System")
   (:p "Next provides introspective and help capabilities. You can view and
modify Next's source code during runtime. A few help commands are described
below:")
   (:ul
    (:li (:code (binding-keys 'help) " help")
         ": The command 'help' opens up a small help buffer.")
    (:li (:code (binding-keys 'tutorial) " tutorial")
         ": The command 'tutorial' opens up this tutorial.")
    (:li (:code (binding-keys 'describe-key) " describe-key")
         ": The command 'describe-key' allows you to input a key binding and see
what command it is bound to.")
    (:li (:code (binding-keys 'describe-slot) " describe-slot")
         ": The command 'describe-slot' allows you to find out the value of a
particular class slot and view its documentation.")
    (:li (:code (binding-keys 'describe-command) " describe-command")
         ": The commmand 'describe-command' allows you to find out about a
particular command (including showing its source).")
    (:li (:code (binding-keys 'describe-bindings) " describe-bindings")
         ": The command 'describe-bindings' to view all of your currently set
bindings in your buffer.")
    (:li (:code (binding-keys 'describe-variable) " describe-variable")
         ": The command 'describe-variable' allows you to view the value and
documentation of a variable."))))
