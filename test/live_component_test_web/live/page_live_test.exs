defmodule LiveComponentTestWeb.PageLiveTest do
  use LiveComponentTestWeb.ConnCase

  import Phoenix.LiveViewTest

  test "form submit", %{conn: conn} do
    {:ok, page_live, html} = live(conn, "/")

    html =
      page_live
      |> element("form")
      |> render_submit()

    assert html =~ "Form has been submitted"
  end
end
