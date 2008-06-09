#
# bitclust/htmlutils.rb
#
# Copyright (C) 2006-2007 Minero Aoki
#
# This program is free software.
# You can distribute/modify this program under the Ruby License.
#

require 'bitclust/nameutils'

module BitClust

  module HTMLUtils

    include NameUtils

    private

    # make method anchor from MethodEntry
    def link_to_method(m, specp = false)
      label = specp ? m.label : m.short_label
      a_href(@urlmapper.method_url(methodid2specstring(m.id)), label)
    end

    def library_link(name, label = nil, frag = nil)
      f = frag ? "##{frag}" : ""
      a_href(@urlmapper.library_url(name) + f, label || name)
    end

    def class_link(name, label = nil, frag = nil)
      f = frag ? "##{frag}" : ""
      a_href(@urlmapper.class_url(name) + f , label || name)
    end

    def method_link(spec, label = nil, frag = nil)
      f = frag ? "##{frag}" : ""
      a_href(@urlmapper.method_url(spec) + f, label || spec)
    end

    def function_link(name, label = nil, frag = nil)
      f = frag ? "##{frag}" : ""
      a_href(@urlmapper.function_url(name) + f, label || name)
    end

    def document_link(name, label = nil, frag = nil)
      f = frag ? "##{frag}" : ""
      a_href(@urlmapper.document_url(name) + f, label || @option[:database].get_doc(name).title)
    end

    def a_href(url, label)
      %Q(<a href="#{escape_html(url)}">#{escape_html(label)}</a>)
    end

    ESC = {
      '&' => '&amp;',
      '"' => '&quot;',
      '<' => '&lt;',
      '>' => '&gt;'
    }

    def escape_html(str)
      table = ESC   # optimize
      str.gsub(/[&"<>]/) {|s| table[s] }
    end

    ESCrev = ESC.invert

    def unescape_html(str)
      table = ESCrev   # optimize
      str.gsub(/&\w+;/) {|s| table[s] }
    end

  end

end
