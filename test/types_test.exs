defmodule Episode do
   defstruct name: "John", author: "XOXO"
end

defmodule ElixirTests do
  use ExUnit.Case, async: true

	def plus(a,b) do
		a + b
	end

  test "func is a func" do
		me = plus 5,5
    assert me == 10
  end

  test "is stuff" do

    assert is_atom(:me)
    assert is_list([1,2,3])
    assert is_map(%{:key => 0, :me => 5})
    assert is_nil(nil)
    assert is_tuple({:x,:y})
    assert is_binary("hellö")
  end


  test "add" do
    myep = %Episode{
      name: "John",
      author: "Daniel Berkompas"
    }
    assert myep.name == "John"
  end

  test "match" do
    {sound, _type} = {"meow", "cat"}
    assert sound == "meow"
  end

  test "list: check if in" do
    lst = ["meow"]
    assert "meow" in lst
  end
  test "list: remove" do
    lst = ["dog", "cat"] -- ["dog"]
    assert !"dog" in lst
    assert "cat" in lst
  end

  test "list: pattern pick" do
    [a, b | x] = ["dog", "cat", "cow", "deer"]
    assert a == "dog"
    assert b == "cat"
    assert x == ["cow", "de"<>"er"]
  end

  test "strings" do
    assert "meow" == "me"<>"ow"
    {a,b} = {5,5}
    assert "5+5 eq:#{a+b}" == "5+5 eq:10"
  end

  test "regex" do
    assert "meow me ow" =~ ~r/me/
    assert "meow" =~ "me"
    assert "meow" =~ "ow"
  end

end
