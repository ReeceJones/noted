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
        /// Returns the "viewable" text that is inside a node. This excludes tokens.
        final string getLabel()
        {
            return this.markdownLabel;
        }
        /// Returns the raw text that is inside a node. This includes tokens.
        final string getRaw() const
        {
            return this.raw;
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
        /// Returns the parent of this node.
        final MarkdownNode getParent()
        {
            return this.parent;
        }
    private:
        string markdownLabel;
        string dataReference;
        string raw;
        MarkdownNodeType type;
        MarkdownNode[] children;
        MarkdownNode parent;
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
        int getListLevel()
        {
            return this.listLevel;
        }
    private:
        int listLevel;
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

    final class MarkdownBlockQuote : MarkdownNode
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

    MarkdownDocument parseDocument(string document, MarkdownNode previousNode = null)
    {
        
    }
private:
    MarkdownHeaderLevel lineIsHeader(string ln);
    MarkdownDocument[] rootNodes;
}
