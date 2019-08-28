module noted.markdown.parser;

class MarkdownDocument
{
public:
    /// A single element that represents a formatted markdown block
    abstract class MarkdownNode
    {
    public:
        /// Returns the type of markdown node.
        abstract MarkdownNodeType getType();
        /// Returns the raw text that is inside a node. This includes tokens.
        final string getLabel() const
        {
            return this.markdownLabel;
        }
        /// Returns the reference that the node links to (if any).
        final string getReference() const
        {
            return this.dataReference;
        }
        /// Returns a reference to itself as subclass T, use only when you know real type.
        T as(T)()
        {
            return cast(T)this;
        }
        /// Returns children of this node.
        final MarkdownNode[] getChildren()
        {
            return this.children;
        }
    private:
        string markdownLabel;
        string dataReference;
        MarkdownNodeType type;
        MarkdownNode[] children;
    }

    final class MarkdownHeader : MarkdownNode
    {
    public:
        override MarkdownNodeType getType()
        {
            return MarkdownNodeType.HEADER;
        }
        int getHeaderLevel()
        {
            return this.headerLevel;
        }
    private:
        int headerLevel;
    }

    final class MarkdownBold : MarkdownNode
    {
    public:
        override MarkdownNodeType getType()
        {
            return MarkdownNodeType.BOLD;
        }
    }

    final class MarkdownItalic : MarkdownNode
    {
    public:
        override MarkdownNodeType getType()
        {
            return MarkdownNodeType.ITALIC;
        }
    }

    final class MarkdownList : MarkdownNode
    {
    public:
        override MarkdownNodeType getType()
        {
            return MarkdownNodeType.LIST;
        }
        bool getNumbered()
        {
            return this.isNumbered;
        }
    private:
        bool isNumbered;
    }

    final class MarkdownLink : MarkdownNode
    {
    public:
        override MarkdownNodeType getType()
        {
            return MarkdownNodeType.LINK;
        }
    }

    final class MarkdownStrikethrough : MarkdownNode
    {
    public:
        override MarkdownNodeType getType()
        {
            return MarkdownNodeType.STRIKETHROUGH;
        }
    }

    final class MarkdownCode : MarkdownNode
    {
    public:
        override MarkdownNodeType getType()
        {
            return MarkdownNodeType.CODE;
        }
    }

    final class MarkdownImage : MarkdownNode
    {
    public:
        override MarkdownNodeType getType()
        {
            return MarkdownNodeType.IMAGE;
        }
    }

    final class MarkdownBloackQuote : MarkdownNode
    {
    public:
        override MarkdownNodeType getType()
        {
            return MarkdownNodeType.BLOCKQUOTE;
        }
    }

    enum MarkdownNodeType : uint
    {
        NONE = 0,
        HEADER,
        BOLD,
        ITALIC,
        LIST,
        LINK,
        STRIKETHROUGH,
        CODE,
        IMAGE,
        BLOCKQUOTE
    }

    /// Used to represent the header "level" (size).
    enum MarkdownHeaderLevel : uint
    {
        NONE = 0,
        H1, H2, H3, H4, H5, H6
    }

    MarkdownNode parseDocument();
private:
    MarkdownHeaderLevel lineIsHeader(string ln);
    MarkdownDocument[] rootNodes;
}
