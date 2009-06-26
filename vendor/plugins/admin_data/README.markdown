# admin_data

## Introduction

This is a plugin to manage your database records using browser. 

## Features

* Browse table records.

* For each individual record a snapshot of all association records is shown. Currently the associations that are supported are has_many, belongs_to and has_one. If an associated record is not present then there will be no link.

* Next to association a count of number of associated records is show. 

* Al the associated records are link so one can navigate from record to record. 

* Quick search across all records in the table.

* Advance search for each field of the each of the table.

* Browse migration records from the table even though there is no corresponding model for it.

* Add a new record (persmission check enforced)

* Edit an existing record (persmission check enforced)

* Delete an existing record (persmission check enforced and no callbacks)

* Destroy an existing record (persmission check enforced and callbacks will be invoked)

* All the features are povided without using named_scope. So no new method is added to the model. It is totally non-intrusive from that point of view.

## Live Demo

[http://www.neeraj.name/admin_data](http://www.neeraj.name/admin_data)

Note that in the demo you will be accessing only features available for read only. You will not be
able to update/delete/create any record. 

## Requirement

Your Rails project must be using Rails 2.2 or higher.

## Installation instruction if you are using Rails 2.3

	ruby script/plugin install git://github.com/neerajdotname/admin_data.git
	
that's it. Now visit http://localhost:3000/admin_data	
	
## Installation instruction if you are using Rails 2.2

If you are using Rails 2.2 then you need to checkout older version of this plugin like this

<pre>
	<code>
	git clone git://github.com/neerajdotname/admin_data.git
   	cd admin_data
   	git co -b for_rails_2.2 origin/for_rails_2.2
   	cd ..
   	cp -rv admin_data my_app/vendor/plugins 
   </code>
</pre>


After the plugin has been copied to your vendor/plugins directory then you need to make certain
changes to the config/routes.rb .

After installing the plugin you need to put following lines of code in config/routes.rb  at the very top

	AdminData::Routing.connect_with map. 

After the lines have been added it might look like this

	ActionController::Routing::Routes.draw do |map|
	  AdminData::Routing.connect_with map
	  # ... more routing information
	end

## How to use it

	http://localhost:3000/admin_data

## Securing the access

This plugin will allow access to browse the models without any authorization check in development and test environment. 

However in other environments a security check is enforced. Given below is one way to ensure authentication. Put the following lines of code in an initializer at ~/config/initializers/admin_data.rb

### authorization check to see if the data should be shown to the user
	ADMIN_DATA_VIEW_AUTHORIZATION = Proc.new { |controller| controller.send("admin_logged_in?") }


### authorization check to see if the user should be allowed to update the data
	ADMIN_DATA_UPDATE_AUTHORIZATION    = Proc.new { |controller| return false }


## Tested with

I have tested this plugin with MySQL and PostgreSQL. 

## Feedback

Email me: neerajdotname [at] gmail (dot) com

## License

Copyright (c) 2009 neerajdotname

Permission is hereby granted, free of charge, to any person
obtaining a copy of this software and associated documentation
files (the "Software"), to deal in the Software without
restriction, including without limitation the rights to use,
copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the
Software is furnished to do so, subject to the following
conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
OTHER DEALINGS IN THE SOFTWARE.
