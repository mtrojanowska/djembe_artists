# frozen_string_literal: true

require_relative 'list'
require_relative 'main_menu'
require_relative 'song_menu'

list = List.new

song_menu = SongMenu.new(list: list)

main_menu = MainMenu.new(list: list, song_menu: song_menu)

main_menu.show
