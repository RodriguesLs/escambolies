module Backoffice::AdminsHelper
    
    OptionsForRoles = Struct.new(:id, :desc)
    
    def options_for_roles
        
        options = []
        
        Admin.roles_i18n.each do |key, value|
            options.push(OptionsForRoles.new(key, value))
        end
        
        options
    end
    
end
