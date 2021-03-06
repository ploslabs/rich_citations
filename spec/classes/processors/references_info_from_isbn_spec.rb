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

describe Processors::ReferencesInfoFromIsbn do
  include Spec::ProcessorHelper

  it "should call the API" do
    refs 'First', 'Second', 'Third'
    allow(IdentifierResolver).to receive(:resolve).and_return('ref-1' => { uri_type: :isbn, uri:'1111111111' },
                                                              'ref-2' => { },
                                                              'ref-3' => { uri_type: :isbn, uri:'2222222222' })

    expect(HttpUtilities).to receive(:get).with('http://openlibrary.org/api/volumes/brief/json/ISBN:1111111111%7CISBN:2222222222', anything).and_return('{}')

    process
  end

  complete_response = <<-JSON
    {
       "ISBN:0451526538":
       {
           "records":
           {
               "/books/OL1017798M":
               {
                   "recordURL": "http://openlibrary.org/books/OL1017798M/The_adventures_of_Tom_Sawyer",
                   "oclcs":
                   [
                       "36792831"
                   ],
                   "publishDates":
                   [
                       "1997"
                   ],
                   "lccns":
                   [
                       "96072233"
                   ],
                   "isbns":
                   [
                       "0451526538"
                   ],
                   "olids":
                   [
                       "OL1017798M"
                   ],
                   "issns":
                   [
                   ],
                   "details":
                   {
                       "info_url": "http://openlibrary.org/books/OL1017798M/The_adventures_of_Tom_Sawyer",
                       "bib_key": "ISBN:0451526538",
                       "preview_url": "http://openlibrary.org/books/OL1017798M/The_adventures_of_Tom_Sawyer",
                       "thumbnail_url": "https://covers.openlibrary.org/b/id/295577-S.jpg",
                       "details":
                       {
                           "number_of_pages": 216,
                           "subject_place":
                           [
                               "Mississippi River Valley",
                               "Missouri"
                           ],
                           "covers":
                           [
                               295577
                           ],
                           "lc_classifications":
                           [
                               "PS1306 .A1 1997"
                           ],
                           "latest_revision": 8,
                           "genres":
                           [
                               "Fiction."
                           ],
                           "source_records":
                           [
                               "marc:marc_records_scriblio_net/part25.dat:213801824:997",
                               "marc:marc_loc_updates/v40.i23.records.utf8:2463307:1113"
                           ],
                           "title": "The adventures of Tom Sawyer",
                           "languages":
                           [
                               {
                                   "key": "/languages/eng"
                               }
                           ],
                           "subjects":
                           [
                               "Sawyer, Tom (Fictitious character) -- Fiction",
                               "Runaway children -- Fiction",
                               "Child witnesses -- Fiction",
                               "Boys -- Fiction",
                               "Mississippi River Valley -- Fiction",
                               "Missouri -- Fiction"
                           ],
                           "publish_country": "nyu",
                           "by_statement": "Mark Twain ; with an introduction by Robert S. Tilton.",
                           "oclc_numbers":
                           [
                               "36792831"
                           ],
                           "type":
                           {
                               "key": "/type/edition"
                           },
                           "revision": 8,
                           "publishers":
                           [
                               "Signet Classic"
                           ],
                           "last_modified":
                           {
                               "type": "/type/datetime",
                               "value": "2012-06-13T23:35:32.882463"
                           },
                           "key": "/books/OL1017798M",
                           "authors":
                           [
                               {
                                   "name": "Mark Twain",
                                   "key": "/authors/OL18319A"
                               }
                           ],
                           "publish_places":
                           [
                               "New York"
                           ],
                           "pagination": "xxi, 216 p. ;",
                           "classifications":
                           {
                           },
                           "created":
                           {
                               "type": "/type/datetime",
                               "value": "2008-04-01T03:28:50.625462"
                           },
                           "lccn":
                           [
                               "96072233"
                           ],
                           "notes": "Includes bibliographical references (p. 213-216).",
                           "identifiers":
                           {
                               "librarything":
                               [
                                   "2236"
                               ],
                               "project_gutenberg":
                               [
                                   "74"
                               ],
                               "goodreads":
                               [
                                   "1929684"
                               ]
                           },
                           "dewey_decimal_class":
                           [
                               "813/.4"
                           ],
                           "isbn_10":
                           [
                               "0451526538"
                           ],
                           "publish_date": "1997",
                           "works":
                           [
                               {
                                   "key": "/works/OL53919W"
                               }
                           ]
                       },
                       "preview": "noview"
                   },
                   "data":
                   {
                       "publishers":
                       [
                           {
                               "name": "Signet Classic"
                           }
                       ],
                       "pagination": "xxi, 216 p. ;",
                       "number_of_pages": 216,
                       "classifications":
                       {
                           "dewey_decimal_class":
                           [
                               "813/.4"
                           ],
                           "lc_classifications":
                           [
                               "PS1306 .A1 1997"
                           ]
                       },
                       "title": "The adventures of Tom Sawyer",
                       "subtitle": "how financial models shape markets",
                       "url": "http://openlibrary.org/books/OL1017798M/The_adventures_of_Tom_Sawyer",
                       "notes": "Includes bibliographical references (p. 213-216).",
                       "identifiers":
                       {
                           "lccn":
                           [
                               "96072233"
                           ],
                           "openlibrary":
                           [
                               "OL1017798M"
                           ],
                           "isbn_10":
                           [
                               "0451526538"
                           ],
                           "oclc":
                           [
                               "36792831"
                           ],
                           "goodreads":
                           [
                               "1929684"
                           ],
                           "project_gutenberg":
                           [
                               "74"
                           ],
                           "librarything":
                           [
                               "2236"
                           ]
                       },
                       "cover":
                       {
                           "small": "https://covers.openlibrary.org/b/id/295577-S.jpg",
                           "large": "https://covers.openlibrary.org/b/id/295577-L.jpg",
                           "medium": "https://covers.openlibrary.org/b/id/295577-M.jpg"
                       },
                       "subject_times":
                       [
                           {
                               "url": "https://openlibrary.org/subjects/time:19th_century",
                               "name": "19th century"
                           }
                       ],
                       "subject_places":
                       [
                           {
                               "url": "https://openlibrary.org/subjects/place:missouri",
                               "name": "Missouri"
                           },
                           {
                               "url": "https://openlibrary.org/subjects/place:mississippi_river",
                               "name": "Mississippi River"
                           }
                       ],
                       "subjects":
                       [
                           {
                               "url": "https://openlibrary.org/subjects/fiction",
                               "name": "Fiction"
                           },
                           {
                               "url": "https://openlibrary.org/subjects/tom_sawyer_(fictitious_character)",
                               "name": "Tom Sawyer (Fictitious character)"
                           }
                       ],
                       "subject_people":
                       [
                           {
                               "url": "https://openlibrary.org/subjects/person:mark_twain_(1835-1910)",
                               "name": "Mark Twain (1835-1910)"
                           }
                       ],
                       "key": "/books/OL1017798M",
                       "authors":
                       [
                           {
                               "url": "http://openlibrary.org/authors/OL18319A/Mark_Twain",
                               "name": "Mark Twain"
                           }
                       ],
                       "publish_date": "1997",
                       "publish_places":
                       [
                           {
                               "name": "New York"
                           }
                       ],
                       "by_statement": "Mark Twain ; with an introduction by Robert S. Tilton."
                   }
               }
           },
           "items":
           [
           ]
       }
    }
  JSON

  response_with_no_authors_in_data = <<-JSON
    {
       "ISBN:0451526538":
       {
           "records":
           {
               "/books/OL1017798M":
               {
                   "details":
                   {
                       "details":
                       {
                           "authors":
                           [
                               {
                                   "name": "Mark Twain",
                                   "key": "/authors/OL18319A"
                               }
                           ]
                       }
                   },
                   "data":
                   {
                   }
               }
           },
           "items":
           [
           ]
       }
    }
  JSON

  it "should not call the API if there are cached results" do
    refs 'First'
    expect(HttpUtilities).to_not receive(:get)

    cached = { references: [
        {id:'ref-1', uri_type: :isbn, uri:'1234567890', bibliographic:{bib_source:'cached', title:'cached title'} },
    ] }
    process(cached)

    expect(result[:references].first[:bibliographic][:bib_source]).to eq('cached')
    expect(result[:references].first[:bibliographic][:title] ).to eq('cached title')
  end

  it "should merge in the API results" do
    refs 'First'
    allow(IdentifierResolver).to receive(:resolve).and_return('ref-1' => { uri_type: :isbn, uri:'0451526538', score:1.23, uri_source:'test', type: 'book' } )

    expect(HttpUtilities).to receive(:get).and_return(complete_response)

    expect(result[:references].first[:bibliographic]).to eq({
                                                          bib_source:        'OpenLibrary',
                                                          key:               "/books/OL1017798M",
                                                          ISBN:              ["0451526538"],
                                                          OCLC:              ["36792831"],
                                                          OLID:              ["OL1017798M"],
                                                          URL:               "http://openlibrary.org/books/OL1017798M/The_adventures_of_Tom_Sawyer",
                                                          author:            [ {literal:"Mark Twain"} ],
                                                          cover:             "https://covers.openlibrary.org/b/id/295577-S.jpg",
                                                          issued:            {literal:"1997"},
                                                          :'number-of-pages' => 216,
                                                          publisher:         "Signet Classic",
                                                          title:             "The adventures of Tom Sawyer",
                                                          type:              'book',
                                                          subtitle:          ["how financial models shape markets"],
                                                          subject:           ["Fiction", "Tom Sawyer (Fictitious character)", "Missouri", "Mississippi River", "Mark Twain (1835-1910)", "19th century"],
                                                      })
  end

  it "shouldn't fail for any missing data" do
    response = '{ "ISBN:1111111111": {} }'

    refs 'First'
    allow(IdentifierResolver).to receive(:resolve).and_return('ref-1' => { uri_type: :isbn, uri:'1111111111', type: 'book'} )

    expect(HttpUtilities).to receive(:get).and_return(response)

    expect(result[:references].first[:bibliographic]).to eq( bib_source:'OpenLibrary', type: 'book')
  end

  it "should handle missing results" do
    refs 'First'
    allow(IdentifierResolver).to receive(:resolve).and_return('ref-1' => { uri_type: :isbn, uri:'0451526538', attribute:1.23, uri_source:'test' } )

    expect(HttpUtilities).to receive(:get).and_return('{}')

    expect(result[:references].first[:bibliographic]).to eq({
                                                          attribute:      1.23
                                                      })
  end

  it "should match multiple results even if they are out of order" do
    multiple_response = <<-JSON
    {
       "ISBN:2222222222": { "records":{ "/books/2": { "data": { "key": "/books/OL02" } } } },
       "ISBN:1111111111": { "records":{ "/books/1": { "data": { "key": "/books/OL01" } } } }
    }
    JSON

    refs 'First', 'Second'
    allow(IdentifierResolver).to receive(:resolve).and_return('ref-1' => { uri_type: :isbn, uri:'1111111111'},
                                                              'ref-2' => { uri_type: :isbn, uri:'2222222222'}  )

    expect(HttpUtilities).to receive(:get).and_return(multiple_response)

    expect(result[:references].first[:bibliographic]).to eq({
                                                          bib_source:  'OpenLibrary',
                                                          key:         '/books/OL01',
                                                          type:        'book'
                                                      })
    expect(result[:references].second[:bibliographic]).to eq({
                                                          bib_source:  'OpenLibrary',
                                                          key:         '/books/OL02',
                                                          type:        'book'
                                                      })
  end

  it "should pick up authors from the details if they are not in the data" do
    # ISBN:9780262681087 appears to have this problem
    refs 'First'
    allow(IdentifierResolver).to receive(:resolve).and_return('ref-1' => { uri_type: :isbn, uri:'0451526538' } )

    expect(HttpUtilities).to receive(:get).and_return(response_with_no_authors_in_data)

    expect(result[:references].first[:bibliographic]).to eq({
                                                          bib_source:        'OpenLibrary',
                                                          author:            [ {literal:"Mark Twain"} ],
                                                          type:              'book'
                                                      })
  end

  it "should set and not overwrite the bib_source" do
    refs 'First'
    allow(IdentifierResolver).to receive(:resolve).and_return('ref-1' => { uri_type: :isbn, uri:'0451526538', score:1.23, uri_source:'test' } )

    expect(HttpUtilities).to receive(:get).and_return(complete_response)

    expect(result[:references].first[:bibliographic][:bib_source]).to eq('OpenLibrary')
  end

end
