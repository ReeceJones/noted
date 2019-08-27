module noted.textarea;

import std.stdio: writeln;

import gtk.TextView;
import gtk.TextBuffer;
import gtk.TextIter;

// Global variable :(
public TextArea globalTextArea;

class TextArea : TextView
{
public:
    this()
    {
        auto textBuffer = new TextBuffer(new GtkTextBuffer());
        super(textBuffer);
        this.getBuffer().addOnChanged(delegate void(TextBuffer textBuffer) {
            // format text, after timeout of like 250ms or something
        });

        // constrain size
        this.setSizeRequest(1280, 720);
        this.setAcceptsTab(true); // enable tabs
    }
private:
}

void saveBufferToFile(string file)
{
    static import std.file;
    // if the file is not null, take the contents of the global buffer, and save them to the specified file
    if (file !is null)
    {
        std.file.write(file, cast(void[])globalTextArea.getBuffer().getText());
    }
}

void openBufferFromFile(string file)
{
    static import std.file;

    if (file !is null)
    {
        globalTextArea.getBuffer().setText(cast(string)std.file.read(file));
    }
}
