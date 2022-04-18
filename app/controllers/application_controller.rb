class ApplicationController < ActionController::Base
    before_action :fetch_user

    private
    def fetch_user
        @current_user = User.find_by :id => session[:user_id] if session[:user_id].present?
        session[:user_id] = nil unless @current_user.present? # Log out non-existent users.
    end

        def check_for_login
        redirect_to login_path unless @current_user.present?
    end
    
    def hand_written
        ['freehand', 'gochihand', 'handlee', 'anotherhand', 'partrickhand']
    end

    def find_excerpts(word_count)
        
        word_count = word_count.to_i
    
        # sort excerpts positions into hash
        excerpts = {
          :bnovbpar => (0...Excerpt.where({novel_region: 'beginning', paragraph_region: 'beginning'}).size).to_a,
          :bnovmpar => (0...Excerpt.where({novel_region: 'beginning', paragraph_region: 'middle'}).size).to_a,
          :bnovepar => (0...Excerpt.where({novel_region: 'beginning', paragraph_region: 'end'}).size).to_a,
    
          :mnovbpar => (0...Excerpt.where({novel_region: 'middle', paragraph_region: 'beginning'}).size).to_a.shuffle,
          :mnovmpar => (0...Excerpt.where({novel_region: 'middle', paragraph_region: 'middle'}).size).to_a.shuffle,
          :mnovepar => (0...Excerpt.where({novel_region: 'middle', paragraph_region: 'end'}).size).to_a.shuffle,
    
          :enovbpar => (0...Excerpt.where({novel_region: 'end', paragraph_region: 'beginning'}).size).to_a,
          :enovmpar => (0...Excerpt.where({novel_region: 'end', paragraph_region: 'middle'}).size).to_a,
          :enovepar => (0...Excerpt.where({novel_region: 'end', paragraph_region: 'end'}).size).to_a
        }
        
        # assemble first paragraph
        first_para = [] << Excerpt.where({novel_region: 'beginning', paragraph_region: 'beginning'}).offset(excerpts[:bnovbpar].sample).first << Excerpt.where({novel_region: 'beginning', paragraph_region: 'middle'}).offset(excerpts[:bnovmpar].sample).first << Excerpt.where({novel_region: 'beginning', paragraph_region: 'end'}).offset(excerpts[:bnovepar].sample).first
    
        # assemble last paragraph
        last_para = [] << Excerpt.where({novel_region: 'end', paragraph_region: 'beginning'}).offset(excerpts[:enovbpar].sample).first << Excerpt.where({novel_region: 'end', paragraph_region: 'middle'}).offset(excerpts[:enovmpar].sample).first << Excerpt.where({novel_region: 'end', paragraph_region: 'end'}).offset(excerpts[:enovepar].sample).first
        
        # assemble middle paragraphs
        middle = [{:content => "\n \n", :length => 0}]
        
        def word_counter(first_para, middle, last_para)
          (first_para + middle + last_para).reduce(0) { |count, excerpt| count + excerpt[:length] }
        end
    
        excerpts_unused = true
        while word_counter(first_para, middle, last_para) < word_count && excerpts_unused
          # construct paragraph beginning
          middle << Excerpt.where({novel_region: 'middle', paragraph_region: 'beginning'}).offset(excerpts[:mnovbpar].pop).first
          excerpts_unused = false if excerpts[:mnovbpar].empty?
    
          while (0..1).to_a.sample.even? && word_counter(first_para, middle, last_para) < word_count && excerpts_unused
            middle << Excerpt.where({novel_region: 'middle', paragraph_region: 'middle'}).offset(excerpts[:mnovmpar].pop).first
            excerpts_unused = false if excerpts[:mnovmpar].empty?
          end
    
          # construct paragraph end
          middle << Excerpt.where({novel_region: 'middle', paragraph_region: 'end'}).offset(excerpts[:mnovepar].pop).first
          excerpts_unused = false if excerpts[:mnovepar].empty?
        end
        first_para + middle + last_para # returns array of excerpt objects
    end
end
