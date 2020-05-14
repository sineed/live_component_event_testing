defmodule LiveComponentTestWeb.ComponentPageLiveTest do
  use LiveComponentTestWeb.ConnCase

  import Phoenix.LiveViewTest

  test "form submit", %{conn: conn} do
    {:ok, page_live, html} = live(conn, "/comp")

    # Doesn't work
    # html = page_live
    # |> element("form")
    # |> render_submit()

    # assert html =~ "Form has been submitted"

    page_live
    |> element("form")
    |> render_submit()

    html = render(page_live)

    assert html =~ "Form has been submitted"
  end
end
