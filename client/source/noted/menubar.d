module noted.menubar;

import noted.textarea;

import gtk.MenuItem;
import gtk.MenuBar;
import gtk.Menu;
import gtk.FileChooserDialog;
import gtk.Window;
import gtk.c.types: GtkResponseType;

import std.stdio: writeln;

class NotedMenuBar : MenuBar
{
public:
    this()
    {
        file = new FileMenuHeader();
        help = new MenuItem(helpName);
        this.append(file);
        this.append(help);
    }
private:
    MenuItem file, help;
    string helpName = "Help";
}


private
{
    class FileMenuHeader : MenuItem
    {
    public:
        this()
        {
            super(fileName);

            setSubmenu(new FileMenu());
        }
    private:
        string fileName = "File";
    }
    class FileMenu : Menu
    {
    public:
        this()
        {
            super();
            append(new SaveAsItem());
        }
    private:
    }
    class SaveAsItem : MenuItem
    {
    public:
        this()
        {
            super(label);
            addOnActivate(delegate void(MenuItem menuItem) {
                FileChooserDialog fileChooserDialog = new FileChooserDialog("Save As", null, FileChooserAction.SAVE);
                int response = fileChooserDialog.run();
                if (response == GtkResponseType.OK)
                {
                    // absolute path
                    string fileName = fileChooserDialog.getFilename();
                    saveBufferToFile(fileName);
                }
                // close the dialog
                fileChooserDialog.destroy();
            });
        }

    private:
        string label = "Save As";
    }
}