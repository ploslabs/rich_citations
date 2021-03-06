# Copyright (c) 2014 Nathan Day

# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.

require 'id/wikipedia'

module IdentifierResolvers
  class WikipediaFromReference < Base

    def resolve
      unresolved_references.each{ |id, node|
        info = extract_info(node)
        set_result(id, info)
      }
    end

    private

    #@todo: In theory you could fetch the references page and then look at the <title>
    #       as well as the keywords and  description <meta> tags

    def extract_info(node)
      id = Id::Wikipedia.extract_from_xml(node.node)
      return nil unless id.present?
      {
          uri_source:  :ref,
          uri:         id[:url],
          accessed_at: id[:accessed_at],
          uri_type:    :url,
          page:        id[:page],
          language:    id[:language]
      }.compact
    end

  end
end
