# U2.W6: Create a Playlist from Driver Code


# I worked on this challenge [with: Adam Dziuk].


# Pseudocode
#No actual pseudo coding was involved in this challenge. Just looking at the error-msg and 
#adding appropriate methods and its components to pass tests


# Initial Solution

# class Song
#   attr_reader :song, :artist 

#   def initialize(song,artist) 
#     @song = song
#     @artist = artist
#   end
  
#   def play
#     puts "Now playing #{song} by #{artist}"
#   end
# end

# class Playlist
  
  
#   def initialize(*songs)
#     @playlist = []
#     songs.each do |song|
#       @playlist << song
#     end 
#   end
  
#   def add(*songs)
#     songs.each do |song|
#       @playlist << song
#     end
#   end
  
#   def remove(*songs)
#     songs.each do |song|
#       @playlist.delete(song)
#     end
#   end
  
#   def num_of_tracks
#     @playlist.size
#   end
  
#   def includes?(song)
#     @playlist.include?(song)
#   end
  
#   def play_all
#     @playlist.each do |song|
#       song.play
#     end
#   end
# end

# Refactored Solution


class Song
  attr_reader :song, :artist 

  def initialize(song,artist) 
    @song = song
    @artist = artist
  end
  
  def play
    puts "Now playing #{song} by #{artist}"
  end
end

class Playlist
  
  
  def initialize(*songs)
    @playlist = []
    songs.each {|song| @playlist << song}
  end
  
  def add(*songs)
    songs.each {|song| @playlist << song}
  end
  
  def remove(*songs)
    songs.each {|song| @playlist.delete(song)}
  end
  
  def num_of_tracks
    @playlist.size
  end
  
  def includes?(song)
    @playlist.include?(song)
  end
  
  def play_all
    @playlist.each {|song| song.play}
  end
end



# DRIVER TESTS GO BELOW THIS LINE
one_by_one = Song.new("One by One", "Sirenia")
world_so_cold = Song.new("World So Cold", "Three Days Grace") 
going_under = Song.new("Going Under", "Evanescence")
 
my_playlist = Playlist.new(one_by_one, world_so_cold, going_under)
 
lying_from_you = Song.new("Lying From You", "Linkin Park")
angels = Song.new("Angels", "Within Temptation")
 
my_playlist.add(lying_from_you, angels)
p my_playlist.num_of_tracks == 5
going_under.play
my_playlist.remove(angels)
p my_playlist.includes?(lying_from_you) == true
my_playlist.play_all
my_playlist.display


# Reflection 

# We worked through the exercise based on the error messages shown in terminal 
# when we ran the file. The messages were formatted such way that it was easily 
# readable. It was good practice using splat operator which I learned few exercises 
# ago. Also became more familiar with reading error messages.
