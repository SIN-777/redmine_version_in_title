require 'redmine'

Redmine::Plugin.register :redmine_version_in_title do
  name 'Redmine Version In Title plugin'
  author 'Shingo Sekiguchi'
  description 'Redmine plugin to show current version name to header title.'
  version '0.0.1'
  url 'https://github.com/SIN-777/redmine_version_in_title'
  author_url 'https://github.com/SIN-777/redmine_version_in_title'
  settings :default => {:target_project_identifier => ''}, :partial => 'settings/form'
end

require File.dirname(__FILE__) + '/lib/version_in_title_patch.rb'
ApplicationHelper.send(:include, VersionInTitlePatch)
