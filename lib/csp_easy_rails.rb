require 'yaml'

class CSPEasyRails
  def self.policy(file)
    config = YAML::load(File.read(file))
    config.each do |key, value|
      config[key] = "'#{value}'" if value == "self" || value == "none"
      config[key] = value.join(" ") if value.class == Array
    end
    
    policy_string = ""
    config.each do |key, value|
      policy_string = policy_string + "#{key} #{value}; "
    end
    
    policy_string.strip
  end
end

if __FILE__ == $0
  CSPEasyRails.policy("../config/csp_policy.yml")
end