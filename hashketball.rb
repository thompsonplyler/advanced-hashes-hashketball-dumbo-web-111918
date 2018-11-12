def game_hash
team_hash = {
  :home => {
    :team_name => "Brooklyn Nets",
    :colors => ["Black", "White"],
    :players => {
      "Alan Anderson" => {
          :number => 0,
          :shoe => 16,
          :points => 22,
          :rebounds =>12 ,
          :assists =>12 ,
          :steals =>3 ,
          :blocks =>1 ,
          :slam_dunks =>1
      },
      "Reggie Evans" => {
          :number =>30 ,
          :shoe => 14,
          :points =>12 ,
          :rebounds =>12 ,
          :assists => 12,
          :steals => 12,
          :blocks => 12,
          :slam_dunks =>7
      },
      "Brook Lopez" => {
          :number =>11 ,
          :shoe => 17,
          :points => 17,
          :rebounds =>19 ,
          :assists => 10,
          :steals =>3 ,
          :blocks =>1 ,
          :slam_dunks =>15
      },
      "Mason Plumlee" => {
          :number =>1 ,
          :shoe =>19 ,
          :points =>26 ,
          :rebounds =>12 ,
          :assists =>6 ,
          :steals => 3,
          :blocks =>8 ,
          :slam_dunks => 5
      },
      "Jason Terry" => {
          :number => 31,
          :shoe => 15,
          :points =>19 ,
          :rebounds =>2 ,
          :assists =>2 ,
          :steals => 4,
          :blocks => 11,
          :slam_dunks => 1
      }
    }
  },
  :away => {
    :team_name => "Charlotte Hornets",
    :colors => ["Turquoise", "Purple"],
    :players => {
      "Jeff Adrien" => {
          :number => 4,
          :shoe => 18,
          :points => 10,
          :rebounds => 1,
          :assists => 1,
          :steals => 2,
          :blocks =>7 ,
          :slam_dunks =>2
      },
      "Bismak Biyombo" => {
          :number => 0,
          :shoe => 16,
          :points => 12,
          :rebounds =>4 ,
          :assists =>7 ,
          :steals => 7,
          :blocks =>15 ,
          :slam_dunks => 10
      },
      "DeSagna Diop" => {
          :number =>2 ,
          :shoe =>14 ,
          :points =>24 ,
          :rebounds =>12 ,
          :assists => 12,
          :steals => 4,
          :blocks =>5 ,
          :slam_dunks =>5
      },
      "Ben Gordon" => {
          :number => 8,
          :shoe => 15,
          :points =>33 ,
          :rebounds =>3 ,
          :assists =>2 ,
          :steals => 1,
          :blocks => 1,
          :slam_dunks =>0
      },
      "Brendan Haywood" => {
          :number =>33 ,
          :shoe =>15 ,
          :points =>6 ,
          :rebounds =>12 ,
          :assists =>12 ,
          :steals =>22 ,
          :blocks =>5 ,
          :slam_dunks =>12
      }
    }
  }
}
end

def num_points_scored(player_name)
  game_hash

  game_hash[:home][:players].merge(game_hash[:away][:players]).collect do |player,stats|
    if player == player_name
      stats.collect do |stat, value|
        if stat == :points
           return value
        end
      end
    end
  end

##########################
# Nasty code for posterity
# Also to review my thought process on 12 November 2018
##########################
  # do |home_or_away, characteristics|
  #   characteristics.collect do |key1,value1|
  #     if key1 == :players
  #       value1.collect do |player|
  #         if player[:player_name] == player_name
  #         if player == player_name
  #           return player[:points]
  #           player_hash = stats
  #           stats.collect do |stat,value|
  #             if stat = :points
  #               value
  #             end
  #           end
  #         end
  #       end
  #     end
  #   end
  # end


    # value1.collect do |key2, value2|
    #     if value2.class == Hash
    #       value2.collect do |key3, value3|
    #         if key3 = player_name.to_s
    #           value3.collect do |stat, value|
    #             if stat = :points
    #               value
    #             end
    #           end
    #         end
    #       end
    #     end
    # end

    #   home_or_away.collect do |key2, value2|
    #     if value2.class == Hash
    #       value2.collect do |key3,value3|
    #         if value3.class == Hash
    #           if key3.include?(player_name)
    #             if value3.keys.include?("points")
    #               points_scored = value3
    #             end
    #           end
    #         end
    #       end
    #     end
    #   end
    # end

end

def shoe_size(player_name)
    game_hash[:home][:players].merge(game_hash[:away][:players]).collect do |player,stats|
    if player == player_name
      stats.collect do |stat, value|
        if stat == :shoe
          return value
        end
      end
    end
  end
end

def team_colors(team_)
  game_hash

  game_hash.collect do |away_or_home,info|
    if info[:team_name] == team_
      return info[:colors]
    end
  end


    # if team == "Brooklyn Nets"
    #   info.collect do |stat, value|
    #     if stat == :colors
    #       return value
    #       binding.pry

end

def team_names


#################
# This one works, but it doesn't iterate to find out whether or not it's found team_name.
#################
  game_hash.collect do |away_or_home,info|
    info[:team_name]
  end

  # game_hash.collect do |away_or_home,info|
  #   if info.keys.include?(:team_name)
  #     return info[:team_name]
  #   end
  # end


  # game_hash.collect do |x,y|
  #   if y == :team_name
  #     y
  # end

end

def player_numbers(team)

    jersey_array = []

    if game_hash[:home][:team_name] == team
      game_hash[:home][:players].collect do |name, stats|
        stats.collect do |stat, value|
          if stat == :number
            jersey_array << value
          end
        end
      end
    else
      game_hash[:away][:players].collect do |name, stats|
        stats.collect do |stat, value|
          if stat == :number
            jersey_array << value
          end
        end
      end
    end

  jersey_array
end

def player_stats(player_name)
  game_hash[:home][:players].merge(game_hash[:away][:players]).collect do |player,stats|
  if player == player_name
    return stats
    # .collect do |stat, value|
    #   if stat == :shoe
    #     return value
    #   end
    # end
  end
end
end

def big_shoe_rebounds
  shoe_array = []
  players_with_shoes = []
  big_foot_player = nil
  big_foot_player_rebounds = nil

  game_hash[:home][:players].collect do |player_name,y|
    shoe_array << shoe_size(player_name)
    players_with_shoes << player_name
  end

  game_hash[:away][:players].collect do |player_name,y|
    shoe_array << shoe_size(player_name)
    players_with_shoes << player_name
  end

  big_foot_player = players_with_shoes[shoe_array.index(shoe_array.max)]

  game_hash[:home][:players].merge(game_hash[:away][:players]).collect do |player,stats|
    if player == big_foot_player
      return stats[:rebounds]
    end
  end

end

##################################
# Everything below here is bonus
##################################

def most_points_scored
end

def winning_team
end

def player_with_longest_name
end

def long_name_steals_a_ton?
end
