class Settings
  attr_accessor :name, :url, :path, :filename, :plist_file, :provision_file_name, :remote_user, :host, :type, :template_file, :ipa_file
  
  def initialize(options)
    @name = options[:name]
    @filename = options[:filename]
    @url = options[:url]
    @url+= "/" unless @url.match(/\/$/)
    @host = options[:host]
    @path = options[:path]
    @type = options[:type]
    @remote_user = options[:remote_user]

    if @filename.nil? || @filename.empty?
      @filename = @name.gsub(" ", "_") 
    end
    
    @provision_file_name = "#{@filename}.mobileprovision"
    @plist_file = "#{@filename}.plist"
    @ipa_file = "#{@filename}.ipa"
    @plist_file_url = "#{@url}#{@plist_file}"
    @template_file = options[:template] || "#{COMBAT_ROOT}/templates/template.erb"
    
    if (type == 'android')
      @qrcode = "http://qrcode.kaywa.com/img.php?s=8&d=#{ERB::Util.url_encode(@url)}#{@filename}.apk"
    else
      @qrcode = "http://qrcode.kaywa.com/img.php?s=8&d=#{ERB::Util.url_encode(@url)}"
    end
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