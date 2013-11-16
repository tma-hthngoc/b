PDFKit.configure do |config|       
  if Rails.env.production?  
    config.wkhtmltopdf = Rails.root.join('bin', 'wkhtmltopdf-amd64').to_s 
  else
    config.wkhtmltopdf = Rails.root.join('bin', 'wkhtmltopdf-i386').to_s 
  end
  config.default_options = {
    :page_size => 'A4',
    :print_media_type => true,
    :orientation => 'landscape',
    :footer_right => "Page [page] of [toPage]",
    :margin_top => 5, :margin_bottom => 5, :margin_left => 5, :margin_right => 5
  }
  # config.root_url = "http://localhost" # Use only if your external hostname is unavailable on the server.
end  
