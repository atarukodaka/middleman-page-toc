module Middleman
  module PageToc
    class Manager
    end
  end
end


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
        options.reverse_merge! default_options

        target_id = options[:target_id]
        use_collapsing = options[:use_collapsing]
  
        if use_collapsing
          if options[:expand] == true || page.data.show_toc == true
            collapse_in = 'in'
          end
        else
          collapse_in = 'in'
        end
#        collapse_in = (use_collapsing && (options[:expand] == true || page.data.show_toc == true)) ? 'in' : ''
        button_caption = options[:button_caption]

        content_tag(:div, :class=>'toc') do
          ar = []

          if use_collapsing
            ar << content_tag(:button, button_caption, :type=>'button', :class=>'btn btn-default btn-sm toc_button', 'data-toggle'=> 'collapse', 'data-target'=>"##{target_id}")
          end
          ar << content_tag(:div, :id=>target_id, :class=>"toc_content collapse #{collapse_in}") do
            markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML_TOC)

            content = File.read(page.source_file)
            yaml_regex = /\A(---\s*\n.*?\n?)^((---|\.\.\.)\s*$\n?)/m
            if content =~ yaml_regex
              content.sub!(yaml_regex, '')
            end
            markdown.render(content)
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
