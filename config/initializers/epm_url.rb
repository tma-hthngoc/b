# Here ypu can put the code to build a URL for your project management
# server. Later you can use:
# myproj.epm_url
# and
# Project.epm_site

EXTERNAL_EPM = {
  site: 'http://epm.wallem.com/epmprod/projects.aspx',
  project: Proc.new { |id| "http://epm.wallem.com/epmprod/#{id}/default.aspx"}
}

