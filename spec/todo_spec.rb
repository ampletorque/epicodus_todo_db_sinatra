require "spec_helper"

describe(Todo) do
  before() do
    Todo.clear()
  end
end

describe(Todo) do
  describe('#==') do
    it('is the same task if it has the same description') do
      todo1 = Todo.new({:description => 'scrub the zebra', :list_id => 1})
      todo2 = Todo.new({:description => 'scrub the zebra', :list_id => 1})
      expect(todo1).to(eq(todo2))
    end
  end

  describe("#description") do
    it("lets you give it a description") do
      test_task = Todo.new({:description => 'scrub the zebra', :list_id => 1})
      test_task.save()
      expect(test_task.description()).to(eq("scrub the zebra"))
      expect(test_task.list_id()).to(eq(1))
    end
  end

describe("#list_id") do
  it("lets you read the list ID") do
    test_task = Todo.new({:description => 'scrub the zebra', :list_id => 1})
    test_task.save()
    expect(test_task.list_id()).to(eq(1))
  end
end

# describe("#due_date") do
#   it("Adds a due date") do
#     test_task = Todo.new({:description => 'scrub the zebra', :list_id => 1})
#     test_task.save()
#     expect(test_task.due_date()).to(eq('2015-04-01'))
#   end
# end

describe("#==") do
  it("is the same task if has same desc and list ID") do
    test_task = Todo.new({:description => 'scrub the zebra', :list_id => 1})
    test_task_2 = Todo.new({:description => 'scrub the zebra', :list_id => 1})
    expect(test_task).to(eq(test_task_2))
  end
end

  describe(".all") do
    it("is empty at first") do
      expect(Todo.all()).to(eq([]))
    end
  end

  describe("#save") do
    it("adds a task to array of saved tasks") do
      test_task = Todo.new({:description => 'scrub the zebra', :list_id => 1})
      test_task.save()
      expect(Todo.all()).to(eq([test_task]))
    end
  end

  describe(".clear") do
    it("empties out all tasks") do
      Todo.new({:description => 'scrub the zebra', :list_id => 1}).save()
      Todo.clear()
      expect(Todo.all()).to(eq([]))
    end
  end

end
