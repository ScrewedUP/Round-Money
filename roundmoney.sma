#include <amxmodx>
#include <amxmisc>
#include <cstrike>

new const PLUGIN[] = "||Round Money||"
new const VERSION[] = "0.1"
new const AUTHOR[] = "ScrewedUP"

public plugin_init() {
	register_plugin(PLUGIN, VERSION, AUTHOR)
	register_cvar("SUPROUND", PLUGIN_VERSION, FCVAR_SERVER|FCVAR_SPONLY|FCVAR_UNLOGGED)
	register_logevent("GiveMoney", 2, "1=Round_Start")
}
public GiveMoney(id)
{
	new player[32], all
	get_players(player, all, "a")
	for(new i=0;i<all;i++)
	{
		if ( cs_get_user_money (player[i]) < 16000 )
		{
			cs_set_user_money ( player[i] , 16000 )
			printmr(player[i],"^4|^3|^4Round Money ^4|^3| ^4MONEY ^1==> ^3[ 16000 ]")
		}
	}
}
	
stock printmr(const id, const input[], any:...)
{
	new count = 1, players[32]
	static msg[191]
	vformat(msg, 190, input, 3)
	
	replace_all(msg, 190, "!g", "^4")
	replace_all(msg, 190, "!y", "^1")
	replace_all(msg, 190, "!t", "^3")
	replace_all(msg, 190, "!t2", "^0")
	
	if (id) players[0] = id; else get_players(players, count, "ch")

	for (new i = 0; i < count; i++)
	{
		if (is_user_connected(players[i]))
		{
			message_begin(MSG_ONE_UNRELIABLE, get_user_msgid("SayText"), _, players[i])
			write_byte(players[i])
			write_string(msg)
			message_end()
		}
	}
}
