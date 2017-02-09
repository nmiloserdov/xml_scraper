#!/usr/bin/env ruby

require "rubygems"
require "bundler/setup"
require 'application'
require 'pg'
require 'byebug'

Application.db_connect
Application.start



