# Ref. https://api.rubyonrails.org/v6.0.3.2/classes/ActiveSupport/Concern.html#method-i-class_methods
# Not easy to maintain
# Might face problem:
#   The same method name between different modules

# Files here in app/controllers/concerns/*.rb are actually... the same as files in app/models/concerns/*.rb
# This might increase the difficulty of maintenance (naming conflicts)...

# Usage reference:
#   https://www.youtube.com/watch?v=xGRMPekEbMM


# This works, but comment out, and use method in controller instead
#module SetConfigArrays
#  extend ActiveSupport::Concern
#
#  included do
#    before_action :set_config_arrays
#
#  end
#
#  #class_methods do  #<--- No Use For this use case..., don't know why
#  private
#    def set_config_arrays
#      @config_names = Array.new
#      @config_names.push %W(#{Config.human_attribute_name('name.language')} language)
#
#      @config_values = Array.new
#      Config.config_values.keys.each do |v|
#        @config_values.push %W{#{Config.human_attribute_name("config.config_value.#{v}")} #{v}}
#      end
#    end
#
#  #end
#end
