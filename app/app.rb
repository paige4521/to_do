require "./config/dependencies"
require "better_errors"

class App < Sinatra::Base

  # Provide a in browser REPL like binding.pry when you hit an exception
  configure :development do
    use BetterErrors::Middleware
    BetterErrors.application_root = File.expand_path(__dir__, "..")
  end

  # Expose any file stored in the folder to the internet
  # http://localhost:4567/css/example.css
  set :public_folder, File.dirname(__FILE__) + '/assets'

  # HTTP 4x does not support PUT PATCH DELETE, only GET and POST
  # this will support setting the method of the HTTP request with a
  # form input, with a name of _method
  # <input type="hidden" name="_method" value="PATCH">
  use Rack::MethodOverride

  get "/" do
    erb :"homepage.html"
  end

#displays all lists
  get "/lists" do
    @lists = []
    List.all.each do |list|
    @lists.push(list.name)
  end

    @lists
    erb :"lists.html"
  end
#displays all tasks
  get "/tasks" do
    @tasks = []
       Task.all.each do |task|
         @tasks.push(list.name)
       end
  end

  #Displays a specific task
  get "/tasks/:id" do
    @task = Task.find(params["id"])
    #erb: "edit_task.html"

  end

#Edit a specific tasks
  patch "/task/:id" do
    @task = Task.find(params["id"])
    @task.update(params["id"])


  end

  get "/lists/:name" do
     @list_name = params[:name]
     list_id = List.find_by(name: @list_name).id
     @task_objects = Task.where("list_id = ? AND complete = ?", list_id, false)

    erb :"single_list.html"
   end


  get "/next" do
    @next_task = Task.where("complete = ?", false).sample.name

  end

  #get "/search?q=" do
  #end

  post "/lists" do

  #new_list_name = params[:list_name]
  List.create!(name: params[:list_name])
  redirect "/lists"

  end

  post "/lists/:name/items" do
   @list_name = params[:name]
   @list_id = List.find_by(name: params[:name]).id
   Task.create(list_id: @list_id, name: params[:name_task], complete: false)
   redirect "/lists/#{@list_name}"

  end


  delete "/items/:id" do

    #@update_task = params[:id]
    @update_task = Task.find(params[:id])
    @update_task.update_attribute(:complete, true)
    @list_id = @update_task.list_id
    @list_name  = List.find(@list_id).name
    redirect "/lists/#{@list_name}"

  end


  run! if app_file == $PROGRAM_NAME
end
