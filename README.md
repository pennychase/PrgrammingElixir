## Programming Elixir

Some of the exercises and example code from Dave Thomas's _Programming Elixir >= 1.6_

Server exercises (Chapter 17)
- sequence-old and seqnumbers implement the simple number counter. sequence implments the counter with supervisors. sequence-otp implements the OTP application and the deployment sequence.
- sequence-old contains the API code and server implmentation in a single file (server.ex). Since it contains the orginal implementation (not using private functions) it can be called directly with pid (`GenServer.call(pid, :next)` or `GenServer.cast(pid, {:increment_number, 200})`) or using the external API (`Sequence.Server.next_number` or `Sequence.Server.increment_number(200)`).
- seqnumbers contains the three-layer implemention: API in seqnumbers.ex, business logic in seqnumbers/impl.ex, and server interface to the logic in seqnumbers/server.ex. It uses the API (`Seqnumbers.next_number` or `Seqnumbers.increment_number 200`), but the implementation can be called directly during development/testing, as well as through the server. 
- stack-old implements the client API and server callbacks in the lib/stack/erver.ex file. stack uses supervisors.
- sequence-otp implements the initial OTP application and the different versions of the deployment sequence. Each deployment version is on a git branch:
    - main: the original OTP server
    - v0: the first release
    - v1: the second release (change output message - no change in server state)
    - v2: the third release (sequence increment - change in server state)