defmodule Todo.ListTest do
  use ExUnit.Case

  alias Todo.List
  alias Todo.Item

  setup do
    {:ok, list} = List.start_link("Home")

    on_exit fn ->
      Todo.Cache.clear
    end

    {:ok, list: list}
  end

  test ".items returns the todos items on the list", %{list: list} do
    assert List.items(list) == []
  end

  test ".add adds a item to the list", %{list: list} do
    item = Item.new("Create a OTP app")

    List.add(list, item)

    assert List.items(list) == [item]
  end

  test ".update can mark an item as complete", %{list: list} do
    item = Item.new("Complete a task")
    List.add(list, item)

    item = %{item | description: "new", completed: true}

    List.update(list, item)

    assert List.items(list) == [item]
  end
end
