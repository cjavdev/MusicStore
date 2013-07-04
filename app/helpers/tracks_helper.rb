#!/bin/env ruby
# encoding: utf-8

module TracksHelper
  def ugly_lyrics(lyrics)
    ("<pre>" + h(lyrics).gsub(/\n/, "♫") + "</pre>").html_safe
  end
end
