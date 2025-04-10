class SMRoleInfoSouthernInfantry extends RORoleInfo
    abstract;

defaultproperties
{
    Items[RORIGM_Default]={(
                    SecondaryWeapons=(class'Separatism.SMWeap_TTYugo_Pistol'),
                    SquadLeaderItems=(class'ROGame.ROItem_Binoculars')
        )}

    bAllowPistolsInRealism=true

    RoleRootClass=class'RORoleInfoSouthernInfantry'
}