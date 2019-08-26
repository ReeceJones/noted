module noted.menubox;

import gtk.Box;
import gtk.ScrolledWindow;

import noted.menubar;
import noted.textarea;

class NotedMenuBox : Box
{
public:
    this()
    {
        super(Orientation.VERTICAL, 0);
		
		menuBar = new NotedMenuBar();
        globalTextArea = new TextArea();
        scrolledWindow = new ScrolledWindow(globalTextArea);

        // add menu bar and constrain amount of space that it can take.
		packStart(menuBar, false, false, 0);
        // add scrolled window and give it as much room as it needs
        packStart(scrolledWindow, true, true, 0);
    }
private:
    NotedMenuBar menuBar;
    ScrolledWindow scrolledWindow;
}

