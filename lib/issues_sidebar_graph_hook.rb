# Provides a link to the issue age graph on the issue index page
class IssuesSidebarGraphHook < Redmine::Hook::ViewListener
  def view_issues_sidebar_issues_bottom(context = { })
    if User.current.allowed_to?(:view_graphs, nil, :global => true)
      if context[:project].nil?
        	output = "<h3>#{l(:label_graphs)}</h3>"
        	output << link_to(l(:label_graphs_old_issues), {:controller => 'graphs', :action => 'old_issues', :only_path => true})
        	output << "<br/>"
          output << link_to(l(:label_graphs_issue_growth), {:controller => 'graphs', :action => 'issue_growth', :only_path => true})
          output << "<br/>"
          return output
  	  elsif !context[:project].nil?
          output = "<h3>#{l(:label_graphs)}</h3>"
          output << link_to(l(:label_graphs_old_issues), {:controller => 'graphs', :action => 'old_issues', :project_id => context[:project], :only_path => true})
          output << "<br/>"
          output << link_to(l(:label_graphs_issue_growth), {:controller => 'graphs', :action => 'issue_growth', :project_id => context[:project], :only_path => true})
          output << "<br/>"
          return output
      end
    end
  end
end
