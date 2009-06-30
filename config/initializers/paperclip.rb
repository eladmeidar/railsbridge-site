Paperclip.options[:command_path] = "/usr/local/bin" unless Rails.env.development?
Paperclip.options[:swallow_stderr] = false if Rails.env.development?
