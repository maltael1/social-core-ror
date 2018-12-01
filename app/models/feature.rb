class Feature < ApplicationRecord
    def self.not feature_code
        !find_by_code(feature_code).is_active
    end
end
