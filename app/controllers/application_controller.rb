# frozen_string_literal: true

class ApplicationController < ActionController::Base
    def all_projects
        Project.all
    end

    def projects_paid_dates
        all_projects.each_with_object(Hash.new { |k, v| k[v] = [] }) do |project, output|
        output[project.payment_date] << project.title 
        end
    end

    helper_method :projects_paid_dates

    def dates_sorted
        projects_paid_dates.sort_by { |date, _project| date }
        .select { |date, _project| date >= Date.current }
        .to_h
        .keys
    end

    helper_method :dates_sorted
    
    def all_applicants
        Applicant.all
    end

    # USELESS AND WRONG WAY - SHAME!!!
    # def approved_applicants
    #     project = Project.find_by(title: project)
        
    #     all_applicants.select do |applicant|
    #       if applicant.project.title == project.title && applicant.status == 'approved'
    #         true
    #       else
    #         false
    #       end
    #     end
    # end
    
    def approved_applicants
      all_applicants.select do |applicant|
        applicant.status == "approved"  
      end
    end
    helper_method :approved_applicants
    
end
