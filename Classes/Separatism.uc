class Separatism extends ROMutator
    config(Mutator_SM);

var localized array<localized string> NorthArmyNames;
var localized array<localized string> NorthArmyShortNames;

var localized array<localized string> SouthArmyNames;
var localized array<localized string> SouthArmyShortNames;

var RORoleInfoClasses JNARoleContentClasses;
var RORoleInfoClasses ZNGRoleContentClasses;

function ReplacePawns()
{
    // Attempt ZombieModeMutator override
    local ROGameInfo ROGI;
    ROGI = ROGameInfo(WorldInfo.Game);
    ROGI.PlayerControllerClass = Class'SMPlayerController';
    ROGI.PlayerReplicationInfoClass = Class'SMPlayerReplicationInfo';
    ROGI.PawnHandlerClass = Class'SMPawnHandler';
    ROGI.NorthRoleContentClasses = JNARoleContentClasses;
    ROGI.SouthRoleContentClasses = ZNGRoleContentClasses;
    ROGI.HUDType = Class'SMHUD';
}

simulated function PreBeginPlay()
{
    // PawnHandler has to be overwritten inside PreBeginPlay!
    ReplacePawns();
    // ReplaceRoles();
    LogInternal("Separatism PreBeginPlay");
    super(Mutator).PreBeginPlay();
}

simulated function PostBeginPlay()
{
    super(Mutator).PostBeginPlay();
    LogInternal("Separatism PostBeginPlay");
}

defaultproperties
{
    JNARoleContentClasses=(LevelContentClasses=("Separatism.SMPawnNorth"))
    ZNGRoleContentClasses=(LevelContentClasses=("Separatism.SMPawnSouth"))
}