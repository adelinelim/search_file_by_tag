class Configuration2
  CONFIG_FILE_NAME = "config.json"
  CONFIG_TYPE = {
    color: "color"
  }

  # read color codes from config file
  def self.get_config_color
    config_file_path = set_full_file_path(CONFIG_FILE_NAME)
    content = read(config_file_path)
    config_color_data = content[CONFIG_TYPE[:color]] || {}
    config_color_data.symbolize_keys
  end

  def self.set_full_file_path(filename)
    current_directory = `pwd`
    current_directory = current_directory.to_s.gsub(/\n/, "")
    "#{current_directory}/#{filename}"
  end

  def self.read(file_path)
    if File.exist?(file_path)
      JSON.parse(File.read(file_path))
    else
      {}
    end
  end

  def self.get_file_extension(filename)
    splited_filename = filename.split(".")
    splited_filename[-1].to_sym
  end
end
