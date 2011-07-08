class Settings
  attr_accessor :name, :url, :path, :filename, :plist_file, :provision_file_name, :remote_user, :host, :type, :template_file
  
  def initialize(options)
    @name = options[:name]
    @url = options[:url]
    @host = options[:host]
    @path = options[:path]
    @type = options[:type]
    @remote_user = options[:remote_user]

    @filename = @name.downcase.gsub(" ", "_")
    @provision_file_name = "#{@filename}_AdHoc.mobileprovision"
    @plist_file = "#{@filename}.plist"
    @plist_file_url = "#{@url}#{@plist_file}"
    @template_file = "#{COMBAT_ROOT}/templates/template_#{@type}.erb"
  end
  
  def user_and_host
    "#{remote_user}@#{host}"
  end
  
  def get_binding
    binding
  end
  
  def valid?
    @name != nil && @url != nil
  end
end