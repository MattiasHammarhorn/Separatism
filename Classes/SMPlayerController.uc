class SMPlayerController extends ROPlayerController
    config(Mutator_SM);

var array< class<RORoleInfo> > JNARoles;
var array< class<RORoleInfo> > ZNGRoles;

// From GOM 3
simulated function PreBeginPlay()
{
    if( WorldInfo.NetMode == NM_Standalone)
    {
        ReplaceRoles();
    }

    super.PreBeginPlay();
}

// From GOM 3
// Have to hijack this function because GRI does not seem to exist in PreBeginPlay OR PostBeginPlay even though it's created in PreBeginPlay
simulated function ReceivedGameClass(class<GameInfo> GameClass)
{
    super.ReceivedGameClass(GameClass);

    if( WorldInfo.NetMode != NM_Standalone )
    {
        ReplaceRoles();
    }
}

function InitialiseCCMs()
{
    local ROCharacterPreviewActor ROCPA, CPABoth;
    local ROCharCustMannequin TempCCM;
    
    if( WorldInfo.NetMode == NM_DedicatedServer )
        return;
    
    if( ROCCC == none )
    {
        ROCCC = Spawn(class'ROCharCustController');

        if( ROCCC != none )
            ROCCC.ROPCRef = self;
    }

    foreach WorldInfo.DynamicActors(class'ROCharacterPreviewActor', ROCPA)
    {

        if( ROCPA.OwningTeam == EOT_Both )
        {
            CPABoth = ROCPA;
        }
        else if( AllCCMs[ROCPA.OwningTeam] == none )
        {
            AllCCMs[ROCPA.OwningTeam] = Spawn(class'SMCharCustMannequin', self,, ROCPA.Location, ROCPA.Rotation);
        }
    }

    if( AllCCMs[0] == none || AllCCMs[1] == none )
    {
        if( CPABoth != none )
            TempCCM = Spawn(class'SMCharCustMannequin', self,, CPABoth.Location, CPABoth.Rotation);
        else
        {
            TempCCM = Spawn(class'SMCharCustMannequin', self,, vect(0,0,100));
            `warn("Couldn't find an ROCharacterPreviewActor, the level designer has not added one to the map! Creating a default one"@TempCCM);
        }

        TempCCM.SetOwningTeam(EOT_Both);

        if( AllCCMs[0] == none )
            AllCCMs[0] = TempCCM;
        
        if( AllCCMs[1] == none )
            AllCCMs[1] = TempCCM;
    }
}

// Modified role replacing function from GOM 3
simulated function ReplaceRoles()
{
    local int i;
    local ROMapInfo ROMI;
    local array<RORoleCount> OldRoles;
    local array<class <RORoleInfo> > NewRoles;
    local RORoleCount NewRoleCount;
    `log("SMPlayerController.ReplaceRoles() start!");

    ROMI = ROMapInfo(WorldInfo.GetMapInfo());

    // Grab the old northern roles then clear them
    OldRoles = ROMI.NorthernRoles;
    ROMI.NorthernRoles.length = 0;
    `log("Replacing northern roles");

    NewRoles = default.JNARoles;

    // Don't add a Commander if the slot is empty or being filled by a non-commander class (Skirmish maps do this)
    if (ROMI.NorthernTeamLeader.RoleInfo != none)
    {
        `log("ROMI.NorthernTeamLeader.RoleInfo: "@ROMI.NorthernTeamLeader.RoleInfo);
        if (ROMI.NorthernTeamLeader.RoleInfo.default.ClassIndex == `ROCI_COMMANDER)
        {
            ROMI.NorthernTeamLeader.RoleInfo = new NewRoles[`ROCI_COMMANDER];
        }
        else
        {
            ROMI.NorthernTeamLeader.RoleInfo = new NewRoles[`ROCI_COMMANDER];
        }
    }

    // North Roles
    for (i = 0; i < OldRoles.length; i++)
    {
        `log("Old " @static.GetRoleNameFromIndex(OldRoles[i].RoleInfoClass.default.ClassIndex)/*@ " w " @OldRoles[i].RoleInfoClass@ " slots: " @OldRoles[i].Count@*/);
        `log("Northern OldRoles[i].RoleInfoClass.default.ClassIndex: "@OldRoles[i].RoleInfoClass.default.ClassIndex);
        `log("Northern OldRoles[i].RoleInfoClass.default.MyName: "@OldRoles[i].RoleInfoClass.default.MyName);
        NewRoleCount.RoleInfoClass = NewRoles[OldRoles[i].RoleInfoClass.default.ClassIndex];
        NewRoleCount.Count = OldRoles[i].Count;

        `log("Northern NewRoleCount.RoleInfoClass: "@NewRoleCount.RoleInfoClass);
        `log("Northern NewRoleCount.Count: "@NewRoleCount.Count);
        if (NewRoleCount.RoleInfoClass != none && NewRoleCount.Count != 0)
        {
            `log("New " @static.GetRoleNameFromIndex(NewRoleCount.RoleInfoClass.default.ClassIndex)/*@ " w " @NewRoleCount.RoleInfoClass@ " slots: " @NewRoleCount.Count@*/);
            ROMI.NorthernRoles.AddItem(NewRoleCount);
        }
    }

    // Grab the old southern roles then clear them
    OldRoles = ROMI.SouthernRoles;
    ROMI.SouthernRoles.length = 0;
    `log("Replacing southern roles");

    NewRoles = default.ZNGRoles;

    // Don't add a Commander if the slot is empty or being filled by a non-commander class (Skirmish maps do this)
    if (ROMI.SouthernTeamLeader.RoleInfo != none)
    {
        `log("ROMI.SouthernTeamLeader.RoleInfo: "@ROMI.SouthernTeamLeader.RoleInfo);
        if (ROMI.SouthernTeamLeader.RoleInfo.default.ClassIndex == `ROCI_COMMANDER)
        {
            ROMI.SouthernTeamLeader.RoleInfo = new NewRoles[`ROCI_COMMANDER];
        }
        else
        {
            ROMI.SouthernTeamLeader.RoleInfo = new NewRoles[`ROCI_COMMANDER];
        }
    }

    // South Roles
    for (i = 0; i < OldRoles.length; i++)
    {
        `log("Old " @static.GetRoleNameFromIndex(OldRoles[i].RoleInfoClass.default.ClassIndex)/*@ " w " @OldRoles[i].RoleInfoClass@ " slots: " @OldRoles[i].Count@*/);
        `log("Southern OldRoles[i].RoleInfoClass.default.ClassIndex: "@OldRoles[i].RoleInfoClass.default.ClassIndex);
        `log("Southern OldRoles[i].RoleInfoClass.default.MyName: "@OldRoles[i].RoleInfoClass.default.MyName);
        NewRoleCount.RoleInfoClass = NewRoles[OldRoles[i].RoleInfoClass.default.ClassIndex];
        NewRoleCount.Count = OldRoles[i].Count;

        `log("Southern NewRoleCount.RoleInfoClass: "@NewRoleCount.RoleInfoClass);
        `log("Southern NewRoleCount.Count: "@NewRoleCount.Count);
        if (NewRoleCount.RoleInfoClass != none && NewRoleCount.Count != 0)
        {
            `log("New " @static.GetRoleNameFromIndex(NewRoleCount.RoleInfoClass.default.ClassIndex)/*@ " w " @NewRoleCount.RoleInfoClass@ " slots: " @NewRoleCount.Count@*/);
            ROMI.SouthernRoles.AddItem(NewRoleCount);
        }
    }
    `log("SMPlayerController.ReplaceRoles() end!");
}

// Camera functions from GOM
exec function Camera(optional bool free = false)
{
    ServerCamera(free);
}

// Function to get role-based Class Indexes from GOM 3 by Sgt.Joe
static function string GetRoleNameFromIndex(int index)
{
    switch (index)
    {
        case `ROCI_RIFLEMAN: return "ROCI_RIFLEMAN";
        case `ROCI_SCOUT: return "ROCI_SCOUT";
        case `ROCI_MACHINEGUNNER: return "ROCI_MACHINEGUNNER";
        case `ROCI_SNIPER: return "ROCI_SNIPER";
        case `ROCI_ENGINEER: return "ROCI_ENGINEER";
        case `ROCI_HEAVY: return "ROCI_HEAVY";
        case `ROCI_ANTITANK: return "ROCI_ANTITANK";
        case `ROCI_RADIOMAN: return "ROCI_RADIOMAN";
        case `ROCI_COMMANDER: return "ROCI_COMMANDER";
    }

    return "UNKNOWN ROLE";
}

static function string GetClassNameByIndex(int TeamIndex, int ClassIndex, optional bool bShortName)
{
    local int i;

    if( TeamIndex == `AXIS_TEAM_INDEX )
    {
        for( i = 0; i < default.JNARoles.Length; i++)
        {
            if(default.JNARoles[i].default.ClassIndex == ClassIndex)
                return default.JNARoles[i].static.GetProfileName(bShortName);
        }
    }
    else
    {
        for( i = 0; i < default.ZNGRoles.Length; i++)
        {
            if(default.ZNGRoles[i].default.ClassIndex == ClassIndex)
                return default.ZNGRoles[i].static.GetProfileName(bShortName);
        }
    }

    return "Error!";
}

unreliable server function ServerCamera(bool free)
{
    if (free)
    {
        SetCameraMode('FreeCam');
    }
    else
    {
        SetCameraMode('ThirdPerson');
    }
}

defaultproperties
{
    TeamSelectSceneTemplate=SMUISceneTeamSelect'SM_UI.UIScene.SMUIScene_TeamSelect'
    UnitSelectSceneTemplate=SMUISceneUnitSelect'SM_UI.UIScene.SMUIScene_UnitSelect'
    
    CharacterSceneTemplate=SMUISceneCharacter'SM_UI.UIScene.SMUIScene_Character'

    // UISceneUnitSelectType=class'SMUISceneUnitSelect'

    //Roles
    JNARoles(`ROCI_RIFLEMAN)=       class'SMRoleInfoNorthernRifleman'       // 0
    JNARoles(`ROCI_SCOUT)=          class'SMRoleInfoNorthernScout'          // 1
    JNARoles(`ROCI_MACHINEGUNNER)=  class'SMRoleInfoNorthernMachineGunner'  // 2
    JNARoles(`ROCI_SNIPER)=         class'SMRoleInfoNorthernMarksman'       // 3
    JNARoles(`ROCI_ENGINEER)=       class'SMRoleInfoNorthernEngineer'       // 4
    JNARoles(`ROCI_HEAVY)=          class'SMRoleInfoNorthernGrenadier'                                    // 5
    JNARoles(`ROCI_ANTITANK)=       none      // 6
    JNARoles(`ROCI_RADIOMAN)=       class'SMRoleInfoNorthernRadioman'       // 7
    JNARoles(`ROCI_COMMANDER)=      class'SMRoleInfoNorthernCommander'      // 8

    ZNGRoles(`ROCI_RIFLEMAN)=       class'SMRoleInfoSouthernRifleman'       // 0
    ZNGRoles(`ROCI_SCOUT)=          class'SMRoleInfoSouthernScout'          // 1
    ZNGRoles(`ROCI_MACHINEGUNNER)=  class'SMRoleInfoSouthernMachineGunner'  // 2
    ZNGRoles(`ROCI_SNIPER)=         class'SMRoleInfoSouthernSniper'         // 3
    ZNGRoles(`ROCI_ENGINEER)=       class'SMRoleInfoSouthernEngineer'       // 4
    ZNGRoles(`ROCI_HEAVY)=          class'SMRoleInfoSouthernGrenadier'      // 5
    ZNGRoles(`ROCI_ANTITANK)=       none                                    // 6
    ZNGRoles(`ROCI_RADIOMAN)=       class'SMRoleInfoSouthernRadioman'       // 7
    ZNGRoles(`ROCI_COMMANDER)=      class'SMRoleInfoSouthernCommander'      // 8
}