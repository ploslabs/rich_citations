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

require 'spec_helper'

describe ApiV0Controller, type: :controller do
  describe 'get PLOS doi' do
    it 'returns 202' do
      get :show, id: 'http://dx.doi.org/10.1371/journal.pone.0000000'
      expect(response.status).to eq(202)
    end
  end

  describe 'doi parameter works' do
    it 'returns 202' do
      get :show, doi: '10.1371/journal.pone.0000000'
      expect(response.status).to eq(202)
    end
  end

  describe 'GET non-DOI' do
    it 'returns 404' do
      get :show, id: 'http://example.org/abc'
      expect(response.status).to eq(404)
    end
  end

  describe 'GET non-plos DOI' do
    it 'returns 404' do
      get :show, id: 'http://dx.doi.org/10.1234'
      expect(response.status).to eq(404)
    end
  end
end
