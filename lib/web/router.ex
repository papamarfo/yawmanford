defmodule Web.Router do
  use Plug.Router

  plug(:match)
  plug(:dispatch)

  get "/" do
    conn
    |> put_resp_header("content-type", "text/html; charset=utf-8")
    |> send_file(200, "lib/web/templates/index.html")
  end

  match _ do
    send_resp(conn, 404, "Oops... Nothing here :(")
  end
end
