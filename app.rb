# frozen_string_literal: true

require_relative 'list'
require_relative 'main_menu'
require_relative 'song_menu'

list = List.new

main_menu = MainMenu.new(list: list)

main_menu.show
