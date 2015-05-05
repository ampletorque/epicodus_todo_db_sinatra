require "spec_helper"

describe(List) do
  before() do
    List.clear()
  end



  describe(".all") do
    it("starts off with no lists") do
      expect(List.all()).to(eq([]))
    end
  end

  describe('#name') do
    it('tells you its name') do
      list = List.new({:name => "Epicodus stuff", :id => nil})
      expect(list.name()).to(eq("Epicodus stuff"))
    end
  end

  describe('#id') do
    it("sets its ID when you save it") do
      list = List.new({:name => "Epicodus stuff", :id => nil})
      list.save()
      expect(list.id()).to(be_an_instance_of(Fixnum))
    end
  end

  describe("#==") do
    it("is the same list if it has the same name") do
      list1 = List.new({:name => "Epicodus stuff", :id => nil})
      list2 = List.new({:name => "Epicodus stuff", :id => nil})
      expect(list1).to(eq(list2))
    end
  end

  describe(".find") do
    it("returns a list by its ID") do
      test_list = List.new({:name => "Epicodus stuff", :id => nil})
      test_list.save()
      test_list2 = List.new({:name => "Home stuff", :id => nil})
      test_list2.save()
      expect(List.find(test_list2.id())).to(eq(test_list2))
    end
  end

  describe('#tasks') do
    it('returns an array of tasks for that list') do
      test_list = List.new({:name => "Epicodus stuff", :id => nil})
      test_list.save()
      test_task = Todo.new({:description => "Learn SQL", :list_id => test_list.id()})
      test_task.save()
      test_task2 = Todo.new({:description => "Review Ruby", :list_id => test_list.id()})
      test_task2.save()
      expect(test_list.tasks()).to(eq([test_task, test_task2]))
    end
  end

  # describe("#sort_by_due_date") do
  #   it("sorts by due date") do
  #     test_task = Todo.new({:description => 'scrub the zebra', :list_id => 1, :due_date => '2015-04-01'})
  #     test_task2 = Todo.new({:description => 'poke the parrot', :list_id => 1, :due_date => '2015-04-02'})
  #     test_task3 = Todo.new({:description => 'dump the donkey', :list_id => 1, :due_date => '2015-04-03'})
  #     test_task.save()
  #     test_task2.save()
  #     test_task3.save()
  #     expect(list.sort_by_due_date().to(eq(1, 2, 3)))
  #   end
  # end


end
