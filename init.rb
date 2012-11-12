require 'redmine'

require_dependency 'target_version_graph_hook'
require_dependency 'issues_sidebar_graph_hook'

Redmine::Plugin.register :redmine_graphs do
  name 'Redmine Graphs plugin'
  author 'Brad Beattie'
  description 'This plugin provides instances of Redmine with additional graphs.'
  version '0.1.0'

  project_module :graphs do
    permission :view_graphs, :graphs => [:issue_growth, :old_issues]
  end
end
