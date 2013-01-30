module VersionInTitlePatch
  def self.included(klass)
    klass.send(:include, InstanceMethods)
    klass.class_eval do
      alias_method_chain :page_header_title, :version
    end
  end

  module InstanceMethods
    def page_header_title_with_version
      title = page_header_title_without_version
      if @project && !@project.new_record?
        target_pj = Project.find_by_identifier(Setting.plugin_redmine_version_in_title['target_project_identifier'])
        target_pj ||= @project
        version = target_pj.versions.find(
          :first,
          :conditions => ['status = "open" and effective_date >= ?', Time.now.to_date],
          :order => :effective_date
        )
        title << %Q| <span class="version_in_title"> [#{version.name}]</span>| if version
      end
      title
    end
  end


end
