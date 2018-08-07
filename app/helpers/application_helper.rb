module ApplicationHelper
  def autoload_javascript_path
    p = "#{controller_path}/#{action_name}.js"
    pack_file_exist?(p) ? p : 'default.js'
  end

  def pack_file_exist?(path)
    open('public/packs/manifest.json') do |f|
      JSON.load(f)
    end.key?(path)
  end
end
