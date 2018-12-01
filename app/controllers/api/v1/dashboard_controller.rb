class Api::V1::DashboardController < Api::V1::ApplicationController
    def index
        @features = Feature.all
    end
end
