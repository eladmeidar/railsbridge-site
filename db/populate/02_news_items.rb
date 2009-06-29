lede = <<-END
"Rails Builders":http://builders.railsbridge.org has several pro bono projects underway for non-profit organizations. 
We're always in need of more volunteers, so if you'd like to do some good while enhancing your portfolio, head over to the Builders
web site and let us know how you'd like to be involved.  
END
body = ""
NewsItem.create_or_update(:id =>1, :headline => "Rails Builders Needs You", :lede => lede, :body => body, :created_at => '2009-06-28')

lede = <<-END 
As you can see, we've relaunched the RailsBridge site with a bright new look. We have more features in mind for the
future, but it was time to post what we've got. The site team could still use your suggestions and help; if you're interested, 
contact the RailsBridge site "project team":http://railsbridge.org/projects/8 for more details.  
END
body = <<-END
Thanks to Elad Meidar, Robert Evans, Mike Ruby, and Mike Gunderloy for making the redesign happen, as well as to all of the RailsBridge 
members who contributed ideas.
END
NewsItem.create_or_update(:id =>2, :headline => "RailsBridge Site Refresh", :lede => lede, :body => body, :created_at => '2009-06-29')