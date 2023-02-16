#pragma newdecls required
#pragma semicolon 1

#include <sourcemod>
#include <tf2_stocks>

ConVar convar_Gamemode;

public Plugin myinfo = {
	name = "[TF2] tf-gamemode",
	author = "Drixevel",
	description = "Adds a ConVar to view and check the current gamemode for the server.",
	version = "1.0.0",
	url = "https://drixevel.dev/"
};

public APLRes AskPluginLoad2(Handle myself, bool late, char[] error, int err_max) {
	if (GetEngineVersion() != Engine_TF2) {
		Format(error, err_max, "This plugin is only for Team Fortress 2");
		return APLRes_Failure;
	}

	return APLRes_Success;
}

public void OnPluginStart() {
	convar_Gamemode = CreateConVar("tf_gamemode", "", "The current gamemode for the server.", FCVAR_NOTIFY);
	convar_Gamemode.AddChangeHook(OnGamemodeChange);
}

public void OnGamemodeChange(ConVar convar, const char[] oldValue, const char[] newValue) {
	if (StrEqual(oldValue, newValue)) {
		return;
	}

	//Too much work for me but the logic to change gamemodes goes here, probably impossible in some instances but I'm not sure.
	if (StrEqual(newValue, "cp")) {

	} else if (StrEqual(newValue, "ctf")) {

	} else if (StrEqual(newValue, "tc")) {

	} else if (StrEqual(newValue, "sd")) {

	} else if (StrEqual(newValue, "arena")) {

	} else if (StrEqual(newValue, "mvm")) {

	} else if (StrEqual(newValue, "payload")) {

	} else if (StrEqual(newValue, "payloadrace")) {

	} else if (StrEqual(newValue, "passtime")) {

	} else if (StrEqual(newValue, "training")) {

	} else if (StrEqual(newValue, "koth")) {

	} else if (StrEqual(newValue, "medieval")) {

	} else if (StrEqual(newValue, "hybrid")) {

	} else if (StrEqual(newValue, "mannpower")) {

	} else if (StrEqual(newValue, "playerdestruction")) {

	} else if (StrEqual(newValue, "robotdestruction")) {

	}
}

public void OnMapStart() {
	char sMap[64];
	GetCurrentMap(sMap, sizeof(sMap));
	GetMapDisplayName(sMap, sMap, sizeof(sMap)); //Converts workshop maps to their actual map names.

	if (StrContains(sMap, "cp_") == 0) {
		convar_Gamemode.SetString("controlpoint");
	} else if (StrContains(sMap, "ctf_") == 0) {
		convar_Gamemode.SetString("ctf");
	} else if (StrContains(sMap, "tc_") == 0) {
		convar_Gamemode.SetString("tc");
	} else if (StrContains(sMap, "sd_") == 0) {
		convar_Gamemode.SetString("sd");
	}
}

public void OnEntityCreated(int entity, const char[] classname) {
	if (StrEqual(classname, "tf_logic_arena")) {
		convar_Gamemode.SetString("arena");
	} else if (StrEqual(classname, "tf_logic_mann_vs_machine")) {
		convar_Gamemode.SetString("mvm");
	} else if (StrEqual(classname, "team_train_watcher")) {
		convar_Gamemode.SetString("payload");
	} else if (StrEqual(classname, "tf_logic_multiple_escort")) {
		convar_Gamemode.SetString("payloadrace");
	} else if (StrEqual(classname, "passtime_logic")) {
		convar_Gamemode.SetString("passtime");
	} else if (StrEqual(classname, "tf_logic_training_mode")) {
		convar_Gamemode.SetString("training");
	} else if (StrEqual(classname, "tf_logic_koth")) {
		convar_Gamemode.SetString("koth");
	} else if (StrEqual(classname, "tf_logic_medieval")) {
		convar_Gamemode.SetString("medieval");
	} else if (StrEqual(classname, "tf_logic_hybrid_ctf_cp")) {
		convar_Gamemode.SetString("hybrid");
	} else if (StrEqual(classname, "tf_logic_mannpower")) {
		convar_Gamemode.SetString("mannpower");
	} else if (StrEqual(classname, "tf_logic_player_destruction")) {
		convar_Gamemode.SetString("playerdestruction");
	} else if (StrEqual(classname, "tf_logic_robot_destruction")) {
		convar_Gamemode.SetString("robotdestruction");
	}
}