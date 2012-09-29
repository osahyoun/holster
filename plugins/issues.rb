module Plugins
  # For creating and updating GitHub Issues
  class Issues
    class Parser

      def initialize(text)
        @text = text
      end

      def tokens
        @tokens ||= @text.split('|').map(&:strip)
      end

      def attr(name)
        [tokens.find{ |t| t =~ /^#{name}:\s*(.+)$/ }, $1].last
      end

      def token(name)
        parse(name).first
      end

      def milestone
        # TODO
      end

      def title
        tokens.first
      end

      def body
        tokens[1]
      end

      def assignee
        attr(/assigne{2}?/)
      end

      def to_hash
        text = body ? body.dup : ""
        {
          title: title,
          body: text,
          assignee: assignee
        }
      end
    end
  end
end