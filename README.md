$ rails new techincal_diary -c=bootstrap -d=postgresql
$ cd technical_diary/
$ touch .yarnrc.yml
add nodeLinker: node-modules to .yarnrc.yml
Delete the pnp files
$yarn install (node_modules appears)
$ bin/rails action_text:install
$ bundle
$ bin/rails db:migrate
$ rails g scaffold item date:date:index topic:index subtopic:index
$ rails db:migrate
$ bin/dev [change port to 4000 if need be in bin/dev]
Check for bootstrap/postgresql:
/items
index.html <h1 class='text-primary'>Items</h1>
database.yml should reference postgresql not sqlite
