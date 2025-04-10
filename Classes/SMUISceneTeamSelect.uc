class SMUISceneTeamSelect extends ROUISceneTeamSelect;

function InitializeButtonStyle(ROPlayerController ROPC)
{
    local ROMapInfo ROMI;

    if( ROPC != none )
        ROMI = ROMapInfo(ROPC.WorldInfo.GetMapInfo());
    
    if( ROMI != none )
    {
        NorthButtonImageEnabled = NorthEnabledLogos[0];
        NorthButtonImageDisabled = NorthDisabledLogos[0];
        NorthButtonImageHighlighted = NorthHighlightedLogos[0];

        SouthButtonImageEnabled = SouthEnabledLogos[0];
        SouthButtonImageDisabled = SouthDisabledLogos[0];
        SouthButtonImageHighlighted = SouthHighlightedLogos[0];

        TeamLabelButtons[0].SetCaption(class'Separatism'.default.NorthArmyNames[0]);
        TeamLabelButtons[1].SetCaption(class'Separatism'.default.SouthArmyNames[0]);
    }

    TeamImages[0].SetValue(NorthButtonImageEnabled);
    TeamImages[1].SetValue(SouthButtonImageEnabled);
}

function ShowTeamInfo()
{
    local UIPanel Container;
    LogInternal("Separatism ShowTeamInfo begin");

    Container = UIPanel(FindChild(TeamInfoContainerName, true));

    if( TeamInfoTeamIndex == `AXIS_TEAM_INDEX)
        UILabel(Container.FindChild(TeamInfoLabelName, true)).SetValue(NorthTeamInfoText);
    else
        UILabel(Container.FindChild(TeamInfoLabelName, true)).SetValue(SouthTeamInfoText);
    
    Container.SetDockParameters(UIFACE_Top, TeamImages[TeamInfoTeamIndex], UIFACE_Top, 0.5, UIPADDINGEVAL_PercentTarget);
    Container.SetDockParameters(UIFACE_Left, TeamImages[TeamInfoTeamIndex], UIFACE_Left, 0.0);
    Container.SetDockParameters(UIFACE_Right, TeamImages[TeamInfoTeamIndex], UIFACE_Right, 0.0);

    Container.SetVisibility(TeamInfoTeamIndex < 2);
    LogInternal("Separatism ShowTeamInfo end");
}

defaultproperties
{
    NorthEnabledLogos(0)=MaterialInstanceConstant'SM_UI.teamlogos.Team_Cutout_JNA_desat'
    SouthEnabledLogos(0)=MaterialInstanceConstant'SM_UI.teamlogos.Team_Cutout_ZNG_desat'

    NorthDisabledLogos(0)=MaterialInstanceConstant'SM_UI.teamlogos.Team_Cutout_JNA_disabled'
    SouthDisabledLogos(0)=MaterialInstanceConstant'SM_UI.teamlogos.Team_Cutout_ZNG_disabled'

    NorthHighlightedLogos(0)=MaterialInstanceConstant'SM_UI.teamlogos.Team_Cutout_JNA_highlighted'
    SouthHighlightedLogos(0)=MaterialInstanceConstant'SM_UI.teamlogos.Team_Cutout_ZNG_highlighted'
}