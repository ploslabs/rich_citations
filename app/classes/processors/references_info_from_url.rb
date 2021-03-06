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

require 'uri'

module Processors
  class ReferencesInfoFromUrl < Base
    include Helpers

    def process
      references = references_without_bib_info(:url)
      fill_info_for_references( references ) if references.present?
    end

    def self.dependencies
      ReferencesInfoCacheLoader
    end

    #@todo set appropriate user agent header #@mro

    protected

    def fill_info_for_references(references)
      references.each do |ref|
        accessed = ref[:accessed_at]
        ref[:bibliographic].merge!(
            URL:          ref[:uri],
            accessed:     accessed && {'date-parts' => [[accessed.year, accessed.month, accessed.day]] }
        )
        ref[:bibliographic][:bib_source] = 'url'
      end
    end

  end

end
