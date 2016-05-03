class Player < ActiveRecord::Base

  def self.search(search)
      if search
        @players = Player.where(:team => search)
      else
        @players = Player.all
      end
    end

end
