module PageWithGithubRepoDetails

  include Gizmo::PageMixin

  def valid?
    has_selector?("div.repohead")
  end

  def repo_details
    element_struct do |repo_details|
      repo_details.name = document.css('a.js-current-repository').inner_text
      repo_details.author = document.css("span.author a.url span").inner_text
    end
  end

end
