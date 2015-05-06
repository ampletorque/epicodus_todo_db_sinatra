require("sinatra")
require("sinatra/reloader")
also_reload("lib/**/*.rb")
require("./lib/todo")
require("./lib/list")
require("pg")

DB = PG.connect({:dbname => 'to_do_database'})

get("/") do
  erb(:index)
end

get('/lists') do
  @lists = List.all()

  erb(:lists)
end

get("/lists/new") do
  erb(:list_form)
end

get("/tasks/new/:id") do
  @list = List.find(params.fetch("id").to_i())
  erb(:task_form)
end

get("/tasks/delete/:id") do
  @task = Task.find(params.fetch("id").to_i())
  @task.delete()
  erb(:deleted_task_success)
end

post("/deleted_task_success/:list_id") do
  @list = List.find(params.fetch("list_id").to_i())
  erb(:success)
end

post("/lists") do
  name = params.fetch("description")
  list = List.new({:name => name, :id => nil})
  list.save()
  erb(:list_success)
end

get("/lists/:id") do
  @list = List.find(params.fetch("id").to_i())
#  binding.pry
  erb(:list)
end

post("/tasks") do
  description = params.fetch("description")
  list_id = params.fetch('list_id').to_i()
  @list = List.find(list_id)
  @task = Todo.new(:description => description, :list_id => list_id, :id => nil)
  @task.save()
  erb(:success)
end

post("/clear") do
  Todo.clear()
  erb(:success)
end
