defmodule TimeKeeper.PageControllerTest do
  use TimeKeeper.ConnCase

  test "GET /" do
    conn = get conn(), "/"
    assert html_response(conn, 200) =~ "Home"
  end
end
