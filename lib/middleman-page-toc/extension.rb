module Middleman
  module PageToc
    module Helpers
      def render_toc(page=nil, options = {})
        unless config.markdown_engine == :redcarpet && config.markdown[:with_toc_data]
          return "render_toc: use redcarpet as markdown_engin with markdown_option of :with_toc_data"
        end
        
        page ||= current_page
        default_options = {
          use_collapsing: true,
          expand: false,
          button_caption: 'ToC',
          target_id: 'toc_content'
        }
        options.reverse_merge! default_optinos

        target_id = options[:target_id]
        use_collapsing = optinos[:use_collapsing]
        collapse_in = (use_collapsing && options[:expand] == false || page.data.show_toc == false) ? 'in' : ''
        button_caption = options[:button_caption]

        content_tag(:div, :class=>'toc') do
          ar = []

          if use_collapsing
            ar << content_tag(:button, button_caption, :type=>'button', :class=>'btn btn-default btn-sm toc_button', 'data-toggle'=> 'collapse', 'data-target'=>"##{target_id}")
          end
          ar << content_tag(:div, :id=>target_id, :class=>"toc_content collapse #{collapse_in}") do
            markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML_TOC)
            markdown.render(File.read(page.source_file))
          end
          ar.join.html_safe
          end
      end
    end ## module Helpers

    class Extension < Middleman::Extension    
      self.defined_helpers = [::Middleman::PageToc::Helpers]
    end ## class Extension
  end ## module PageToc
end ## module Middleman
