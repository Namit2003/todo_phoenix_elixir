defmodule Todos.TodolistTest do
  alias Todos.Todolist.Todo
  use Todos.DataCase
  alias Todos.Todolist

  describe "todos" do
    import Todos.TodolistFixtures

    test "list_todos/0 returns all todos" do
      todo = todo_fixture()
      assert Todolist.list_todos() == [todo]
    end

    test "create_todo/1 with invalid data returns error changeset" do
      invalid_attrs = %{done: nil, title: nil}
      assert {:error, %Ecto.Changeset{}} = Todolist.create_todo(invalid_attrs)
    end

    test "update_todo/2 returns updated todo" do
      todo = todo_fixture()
      attrs = %{title: "New Title"}
      updated_todo = Todolist.update_todo(todo, attrs)

      assert {:ok, %Todo{title: "New Title"}} = updated_todo
    end

    test "delete_todo/1 deletes todo" do
      todo = todo_fixture()
      Todolist.delete_todo(todo)
      assert Todolist.get_todo!(todo.id) == nil
    end
  end
end
