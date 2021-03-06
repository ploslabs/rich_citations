# Copyright (c) 2014 Public Library of Science

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

# Some general helpers
module Processors::Helpers

  protected

  def body
    @body ||= xml.search('body').first || xml
  end

  def state
    result[:state] ||= ActiveSupport::OrderedOptions.new
  end

  def references
    @references ||= result[:references]
  end

  def reference_by_id(id)
    references.find { |ref| ref[:id] == id }
  end

  def reference_by_number(number)
    references.find { |ref| ref[:number] == number }
  end

  def reference_by_uri(type, uri)
    type = type.to_sym
    return result if result[:uri_type]==type && result[:uri]==uri
    references.find do |ref| ref[:uri_type]==type && ref[:uri]==uri end
  end

  def references_for_type(type)
    type = type.to_sym
    refs = references.select { |ref| ref[:uri_type] == type }
    refs << result if result[:uri_type]==type
    refs
  end

  def references_without_bib_info(type)
    references_for_type(type).reject do |ref| ref[:bibliographic] && ref[:bibliographic][:bib_source] end
  end

  def citation_groups
    @citation_groups ||= result[:citation_groups]
  end

end
