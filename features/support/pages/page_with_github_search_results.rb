module PageWithGithubSearchResults

  include Gizmo::PageMixin

  def valid?
    has_selector?('ul.repo-list')
  end

  def search_results
    element_struct do |results|
      results.repositories = document.css('h3.repo-list-name a').map{ |elem| elem.inner_text }
    end
  end

end