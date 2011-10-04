class CspEasyGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates', __FILE__)
  argument :task, :type => :string, :default => "install"
  
  def generate_policy_file
    copy_file "csp_policy.yml", "config/csp_policy.yml"
    say "---------------------------------------"
    say "        To enable CSP easy in your Rails application add the following to your application.rb:"
    say '        config.middleware.use "CSPEasy", CSPEasyRails.policy("#{config.root}/config/csp_policy.yml")'
    say "---------------------------------------"
  end
end
