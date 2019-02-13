# frozen_string_literal: true

require_relative 'list'
require_relative 'main_menu'

list = List.new('list')
main_menu = MainMenu.new(list: list)

main_menu.show
