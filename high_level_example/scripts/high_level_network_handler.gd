extends Node

signal host_started()

const PORT: int = 10000 # Below 65535 (16-bit unsigned max value)
#42069
var peer: WebSocketMultiplayerPeer

func start_server() -> void:
	peer = WebSocketMultiplayerPeer.new()
	peer.create_server(PORT)
	multiplayer.multiplayer_peer = peer


func start_client() -> void:
	peer = WebSocketMultiplayerPeer.new()
	#peer.create_client("localhost", PORT)
	peer.create_client("wss://localhost:10000") 
	multiplayer.multiplayer_peer = peer


# To create a server+player, or host player, we create a new function "start_host()".
# This function then starts the server like normal, but also calls a signal "host_started".
# Since this is an autoloaded class, other functions can connect to this signal, like I did
# in the "high_level_player_spawner". More comments there.
func start_host() -> void:
	start_server()
	host_started.emit()
