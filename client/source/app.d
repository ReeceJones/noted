import std.stdio;

import noted.textarea;
import noted.config;
import noted.menubox;

import gtk.MainWindow;
import gtk.Main;
import gtk.Widget;
import gtk.ScrolledWindow;

void main(string[] args)
{
	Main.init(args);

	auto notedWindow = new MainWindow(windowName);
	notedWindow.addOnDestroy(delegate void(Widget w) {Main.quit();});
	// auto textArea = new TextArea;
	// we need to place the text area in a scrolled window, or else the entire window will resize to accomodate the textarea
	auto notedMenuBox = new NotedMenuBox();
	// auto scrolledWindow = new ScrolledWindow(textArea);
	// notedMenuBox.add(scrolledWindow);
	notedWindow.add(notedMenuBox);
	// set the default size to 1280x720
	notedWindow.setSizeRequest(1280, 720);
	// show the window
	notedWindow.showAll();

	Main.run();
}
