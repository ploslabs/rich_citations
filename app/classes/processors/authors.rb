module Processors
  class Authors < Base

    def process
      result[:paper] ||= {}
      # result[:paper][:affilitations] = affiliations
      result[:paper][:authors] = authors
    end

    protected

    def authors
      author_nodes.map do |node|
        {
            fullname:    author_fullname(node),
            email:       author_email(node),
            affiliation: author_affiliation(node),
        }.compact
      end
    end

    def author_fullname(node)
      (node.css('given-names').text.strip + ' ' + node.css('surname').text.strip).strip
    end

    def author_email(node)
      xref = node.css('xref[ref-type=corresp]')

      if xref.present?
        rid = xref.first['rid']
        corresp = xml.css("article-meta corresp##{rid}")
        email = corresp.css('email')

        if email.present?
          email.text
        elsif corresp.present?
          corresp.text
        end
      end
    end

    def author_affiliation(node)
      xref = node.css('xref[ref-type=aff]')

      if xref.present?
        rid = xref.first['rid']
        affiliations[rid]
      end
    end

    def affiliations
      @affilitations ||= affiliate_nodes.map do |node|
        text_node = node.css('addr-line')
        text_node = node if text_node.empty?
        [node['id'], text_node.text]
      end.to_h
    end

    def affiliate_nodes
      xml.css('article-meta aff')
    end

    def author_nodes
      nodes = xml.css('article-meta contrib[contrib-type=author]')
    end

  end
end