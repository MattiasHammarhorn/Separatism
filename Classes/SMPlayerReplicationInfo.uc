class SMPlayerReplicationInfo extends ROPlayerReplicationInfo;

simulated function ClientInitialize(Controller C)
{
    local ROPlayerController ROPC;
    local bool bNewOwner;

    bNewOwner = (Owner != C);
    Super.ClientInitialize(C);

    if( bNewOwner )
    {
        self.UsedNames.Length = 0;
    }

    ROPC = ROPlayerController(C);
    if( bNewOwner && ROPC != None && LocalPlayer(ROPC.Player) != None )
    {
        ClientInitializeUnlocks();
    }

    PawnHandlerClass = class'SMPawnHandler';
}

// reliable server function ServerSetCustomCharConfig(CharacterConfig MyCharConfig)
// {
//     local ROMapInfo ROMI;
//     local byte TeamIndex, ArmyIndex, bPilot;
//     local ROPlayerController ROPC;

//     TeamIndex = GetTeamNum();

//     ROMI = ROMapInfo(WorldInfo.GetMapInfo());

//     if( ROMI != none )
//     {
//         if( TeamIndex == `AXIS_TEAM_INDEX )
//             ArmyIndex = ROMI.NorthernForce;
//         else
//             ArmyIndex = ROMI.SouthernForce;
//     }

//     if( PawnHandlerClass == none )
//         PawnHandlerClass = class'SMPawnHandler';
    
//     if( RoleInfo.bIsPilot )
//         bPilot = RoleInfo.bIsTransportPilot ? 1 : 2;
    
//     PawnHandlerClass.static.ValidateCharConfig(TeamIndex, ArmyIndex, bPilot, int(HonorLevel), MyCharConfig.TunicMesh, MyCharConfig.TunicMaterial, MyCharConfig.ShirtTexture, MyCharConfig.Headmesh, MyCharConfig.HairMaterial, MyCharConfig.HeadgearMesh, MyCharConfig.HeadgearMaterial, MyCharConfig.FaceItemMesh, MyCharConfig.FacialHairMesh, MyCharConfig.TattooTex, self);
//     SetCustomCharConfig(MyCharConfig);

//     ROPC = ROPlayerController(Owner);
// }

// simulated function ClientSetCustomCharConfig()
// {
//     local CharacterConfig TempCharConfig;
//     local ROMapInfo ROMI;
//     local byte TeamIndex, ArmyIndex, bPilot;

//     TeamIndex = GetTeamNum();

//     ROMI = ROMapInfo(WorldInfo.GetMapInfo());

//     if( ROMI != none )
//     {
//         if( TeamIndex == `AXIS_TEAM_INDEX )
//             ArmyIndex = ROMI.NorthernForce;
//         else
//             ArmyIndex = ROMI.SouthernForce;
//     }

//     TempCharConfig.ClassIndex = ClassIndex;

//     if( RoleInfo != none )
//     {
//         if( RoleInfo.bIsPilot )
//             bPilot = RoleInfo.bIsTransportPilot ? 1 : 2;
        
//         PawnHandlerClass.static.GetCharConfig(TeamIndex, ArmyIndex, bPilot, ClassIndex, int(HonorLevel), TempCharConfig.TunicMesh, TempCharConfig.TunicMaterial, TempCharConfig.ShirtTexture, TempCharConfig.HeadMesh, TempCharConfig.HairMaterial, TempCharConfig.HeadgearMesh, TempCharConfig.HeadgearMaterial, TempCharConfig.FaceItemMesh, TempCharConfig.FacialHairMesh, TempCharConfig.TaattooTex, self, bBot);
//     }

//     if( Role < ROLE_Authority )
//         ServerSetCustomCharConfig(TempCharConfig);
//     else
//         SetCustomCharConfig(TempCharConfig);
    
//     if( bNewOwner )
//         bReplicatedInitialCharConfig = true;
// }

// defaultproperties
// {
//     PawnHandlerClass = Class'SMPawnHandler'
// }