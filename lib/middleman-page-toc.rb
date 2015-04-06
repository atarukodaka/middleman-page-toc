require "middleman-page-toc/version"

::Middleman::Extensions.register(:page_toc) do
  require 'middleman-page-toc/extension'
  ::Middleman::PageToc::Extension
end

