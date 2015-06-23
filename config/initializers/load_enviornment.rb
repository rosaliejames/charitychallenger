unless Rails.env.production?
  Rails.application.config.before_initialize do
    credentials = YAML.load_file("#{Rails.root}/config/credentials.yml")
    credentials.each do |key, value|
      ENV[key] = value
    end
  end
end