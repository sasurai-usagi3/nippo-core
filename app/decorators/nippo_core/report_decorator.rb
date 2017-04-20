module NippoCore
  module ReportDecorator
    def title
      "#{reported_at} #{user.nickname}"
    end

    def markdowned_body
      options = {
        autolink: true,
        space_after_headers: true,
        fenced_code_blocks: true,
        tables: true,
        hard_wrap: true,
        strikethrough: true,
        filter_html: true
      }
      markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, options)
      markdown.render(body)
    end
  end
end
