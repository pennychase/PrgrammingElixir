## Programming Elixir

Some of the exercises and example code from Dave Thomas's _Programming Elixir >= 1.6_

Server exercises
- sequence and seqnumbers implement the simple number counter.
- sequence contains the API code and server implmentation in a single file (server.ex). Since it contains the orginal implementation (not using private functions) it can be called directly with pid (`GenServer.call(pid, :next)` or `GenServer.cast(pid, {:increment_number, 200})`) or using the external API (`Sequence.Server.next_number` or `Sequence.Server.increment_number(200)`).
- seqnumbers contains the three-layer implemention: API in seqnumbers.ex, business logic seqnumbers/impl.ex, and server interface to the logic in seqnumbers/server.ex. It uses the API (`Seqnumbers.next_number` or `Seqnumbers.increment_number 200`), but the implementation can be called directly during development/testing, as well as through the server. 