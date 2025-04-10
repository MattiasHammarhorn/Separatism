class SMUISceneCharacter extends ROUISceneCharacter
    config(Mutator_SM_UI);

//Adding this didn't do anything??
function InitPlayerConfig()
{
    local LocalPlayer Player;
    local ROMapInfo ROMI;
    local bool bMainMenu;

    Player = GetPlayerOwner();
    if( Player != none && Player.Actor != none )
    {
        ROPC = ROPlayerController(Player.Actor);
        if( ROPC != none )
        {
            ROMI = ROMapInfo(ROPC.WorldInfo.GetMapInfo());

            bMainMenu = ROPC.WorldInfo.GRI.GameClass.static.GetGameType() == ROGT_Default;
        
            if( bMainMenu )
            {
                TeamIndexActual = ROPC.LastDisplayedTeam;
                ArmyIndexActual = ROPC.LastDisplayedArmy;
            }
            else
            {
                TeamIndexActual = ROPC.GetTeamNum();
                if( ROMI != none && TeamIndexActual == `ALLIES_TEAM_INDEX )
                    ArmyIndexActual = ROMI.SouthernForce;
                else if( ROMI != none && TeamIndexActual == `AXIS_TEAM_INDEX )
                    ArmyIndexActual = ROMI.NorthernForce;
                else
                    ArmyIndexActual = 0;
            }

            ROPRI = ROPlayerReplicationInfo(ROPC.PlayerReplicationInfo);
        }

        if( ROPRI != none && ROPRI.RoleInfo != none )
        {
            ClassIndexActual = ROPRI.RoleInfo.ClassIndex;
            bPilotActual = ROPRI.RoleInfo.bIsPilot;
            bCombatPilotActual = bPilotActual && !ROPRI.RoleInfo.bIsTransportPilot;
        }
        else
        {
            if( bMainMenu )
            {
                bPilotActual = ROPC.bLastDisplayedPilot;
                ClassIndexActual = ROPC.LastDisplayedClass;
            }
            else
            {
                bPilotActual = false;
                ClassIndexActual = -1;
            }
        }

        ROPC.StatsWrite.UpdateHonorLevel();
        HonorLevel = byte(ROPC.StatsWrite.HonorLevel);
    }
}

function SetPawnHandler()
{
    local ROMapInfo ROMI;
    local int NorthArmyCount;

    if( ROCCM != none && ROCCM.PawnHandlerClass != none )
    {
        PawnHandlerClass = class'SMPawnHandler';
        TunicSelectionWidget.PawnHandlerClass = PawnHandlerClass;
        TunicMatSelectionWidget.PawnHandlerClass = PawnHandlerClass;
        ShirtSelectionWidget.PawnHandlerClass = PawnHandlerClass;
        HeadSelectionWidget.PawnHandlerClass = PawnHandlerClass;
        HairColourSelectionWidget.PawnHandlerClass = PawnHandlerClass;
        HeadgearSelectionWidget.PawnHandlerClass = PawnHandlerClass;
        HeadgearMatSelectionWidget.PawnHandlerClass = PawnHandlerClass;
        FaceItemSelectionWidget.PawnHandlerClass = PawnHandlerClass;
        FacialHairSelectionWidget.PawnHandlerClass = PawnHandlerClass;
        TattooSelectionWidget.PawnHandlerClass = PawnHandlerClass;

        ROMI = ROMapInfo(ROCCM.WorldInfo.GetMapInfo());

        if( ROMI != none )
        {
            // Using NorthArmyCount set to 1 still causes
            // the CCM to default to the south team by default... 
            // `log("Deciding NorthArmyCount");
            NorthArmyCount = 1;
            // `log("NorthArmyCount: "@NorthArmyCount);
            TunicSelectionWidget.TeamSplitValue = NorthArmyCount;
            // `log("NorthArmyCount: "@NorthArmyCount);
            TunicMatSelectionWidget.TeamSplitValue = NorthArmyCount;
            // `log("NorthArmyCount: "@NorthArmyCount);
            ShirtSelectionWidget.TeamSplitValue = NorthArmyCount;
            // `log("NorthArmyCount: "@NorthArmyCount);
            HeadSelectionWidget.TeamSplitValue = NorthArmyCount;
            // `log("NorthArmyCount: "@NorthArmyCount);
            HairColourSelectionWidget.TeamSplitValue = NorthArmyCount;
            // `log("NorthArmyCount: "@NorthArmyCount);
            HeadgearSelectionWidget.TeamSplitValue = NorthArmyCount;
            // `log("NorthArmyCount: "@NorthArmyCount);
            HeadgearMatSelectionWidget.TeamSplitValue = NorthArmyCount;
            // `log("NorthArmyCount: "@NorthArmyCount);
            FaceItemSelectionWidget.TeamSplitValue = NorthArmyCount;
            // `log("NorthArmyCount: "@NorthArmyCount);
            FacialHairSelectionWidget.TeamSplitValue = NorthArmyCount;
            // `log("NorthArmyCount: "@NorthArmyCount);
            TattooSelectionWidget.TeamSplitValue = NorthArmyCount;
            // `log("NorthArmyCount decided!");
        }
    }
}

function PopulateArmyList()
{
    local ROMapInfo ROMI;

    if( ROPC != none )
        ROMI = ROMapInfo(ROPC.WorldInfo.GetMapInfo());
    
    if( ROMI != none )
    {
        ROCharCustStringsDataStore.Empty('ROCharCustArmyType');
        ROCharCustStringsDataStore.AddStr('ROCharCustArmyType', "JNA");
        ROCharCustStringsDataStore.AddStr('ROCharCustArmyType', "ZNG");

        // Ooooh so that's what this index is used for...
        // I should probably put factions in team enums
        // and handle it more dynamically!
        FirstSouthIndex = 1;

        ArmyComboBox.ComboList.RefreshSubscriberValue();
        ArmyComboBox.ComboList.SetRowCount(2);
        ArmyComboBox.SetSelection(TeamIndexActual);
    }
}

// function bool OnCopyRoleYesClicked(UIScreenObject EventObject, int PlayerIndex)
// {
//     if( class'SMPawnHandler'.static.CopyConfigToClass(TeamIndex, ArmyIndex, ClassIndex, CopyRoleListIndexArray[Max(0,CopyRoleComboBox.ComboList.GetCurrentItem())]) )
//         CopyRoleButton.SetEnabled(false);

//     CopyRoleDialog.SetVisibility(false);
//     return true;
// }

// function PopulateRoleList()
// {
//     local int i, ArrayLength;
//     local string ClassName;

//     local ROMapInfo ROMI;

//     ROCharCustStringsDataStore.Empty('ROCharCustRoleType');
//     ClassListIndexArray.length = 0;

//     for(i=0; i<ROMI.SouthernRoles.length; i++)
//     {
//         ClassName = class'SMPlayerController'.static.GetClassNameByIndex(TeamIndex, i);
//         if( ClassName != "Error!" )
//         {
//             ClassListIndexArray.AddItem(i);
//             ROCharCustStringsDataStore.AddStr('ROCharCustRoleType', ClassName);
//         }
//     }

// //     //Todo: Add handling for pilot and eventually crewmen roles
// //     for(i=0; i<ROCI_TRANSPORTPILOT; i++)
// //     {
// //         ClassName = "";
// //         if( ClassName != "Error!" )
// //         {
// //             ClassListIndexArray.AddItem(i);
// //             ROCharCustStringsDataStore.AddStr('ROCharCustRoleType', ClassName);
// //         }
// //     }

//         ArrayLength = ClassListIndexArray.length;

//         RoleComboBox.ComboList.RefreshSubscriberValue();
//         RoleComboBox.ComboList.SetRowCount(ArrayLength);

//         RoleComboBox.SetSelection(ClassListIndexArray.Find(ClassIndexActual));
// }