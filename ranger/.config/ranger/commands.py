from __future__ import (absolute_import, division, print_function)
import os
from ranger.api.commands import Command

class empty_trash(Command):
    """:empty_trash

    Empty the trash directory (~/.local/share/trash)
    """

    def execute(self):
        self.fm.run("rm -rf ~/.local/share/trash/*");

class wallpaper(Command):
    """:wallpaper [mode]

    Set selected file as wallpaper with mode or "fill"
    """

    def execute(self):
        if self.arg(1):
            mode = self.arg(1)
        else:
            mode = "fill"

        self.fm.run("feh --bg-" + mode + " \"" + self.fm.thisfile.path + "\"")

    # TODO: do this properly
    #def tab(self, tabnum):
    #    if tabnum == 1:
    #        return ["center", "fill", "max", "scale", "tile"]


class my_edit(Command):
    """:my_edit <filename>

    A sample command for demonstration purposes that opens a file in an editor.
    """

    def execute(self):
        # self.arg(1) is the first (space-separated) argument to the function.
        # This way you can write ":my_edit somefilename<ENTER>".
        if self.arg(1):
            # self.rest(1) contains self.arg(1) and everything that follows
            target_filename = self.rest(1)
        else:
            # self.fm is a ranger.core.filemanager.FileManager object and gives
            # you access to internals of ranger.
            # self.fm.thisfile is a ranger.container.file.File object and is a
            # reference to the currently selected file.
            target_filename = self.fm.thisfile.path

        # This is a generic function to print text in ranger.
        self.fm.notify("Let's edit the file " + target_filename + "!")

        # Using bad=True in fm.notify allows you to print error messages:
        if not os.path.exists(target_filename):
            self.fm.notify("The given file does not exist!", bad=True)
            return

        # This executes a function from ranger.core.acitons, a module with a
        # variety of subroutines that can help you construct commands.
        # Check out the source, or run "pydoc ranger.core.actions" for a list.
        self.fm.edit_file(target_filename)

    # The tab method is called when you press tab, and should return a list of
    # suggestions that the user will tab through.
    # tabnum is 1 for <TAB> and -1 for <S-TAB> by default
    def tab(self, tabnum):
        # This is a generic tab-completion function that iterates through the
        # content of the current directory.
        return self._tab_directory_content()
