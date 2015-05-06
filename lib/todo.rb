require ('pry')
class Todo

  attr_reader(:description, :list_id, :due_date, :id)

    define_method(:initialize) do |attributes|
      @description = attributes.fetch(:description)
      @list_id = attributes.fetch(:list_id)
      # @due_date = attributes.fetch(:due_date)
      @id = attributes.fetch(:id)
    end

    define_singleton_method(:all) do
      returned_tasks = DB.exec("SELECT * FROM tasks;")
      tasks = []
      returned_tasks.each() do |task|
        description = task.fetch("description")
        list_id = task.fetch("list_id").to_i()
    #    due_date = task.fetch("due_date")
        tasks.push(Todo.new({:description => description, :list_id => list_id, :id => nil}))
    #tasks.push(Todo.new({:description => description, :list_id => list_id, :due_date => due_date}))
    end
      tasks
    end

    define_singleton_method(:find) do |id|
      found_task = nil
      Todo.all().each() do |task|
        if task.id().==(id)
          found_task = task
        end
      end
      found_task
    end

   define_method(:delete) do
      DB.exec("UPDATE tasks SET list_id = 0 WHERE id = #{self.id()}")
      #update instance to reflect zeroing 
   end


    define_method(:save) do
#      DB.exec("INSERT INTO tasks (description, list_id, due_date) VALUES ('#{@description}', #{@list_id}, '#{@due_date}');")
       DB.exec("INSERT INTO tasks (description, list_id) VALUES ('#{@description}', #{@list_id});")
    end

    define_singleton_method(:clear) do
      DB.exec("DELETE FROM tasks *;")
    end

    define_method(:==) do |another_task|
     self.description().==(another_task.description()).&(self.list_id().==(another_task.list_id()))
    end

end
